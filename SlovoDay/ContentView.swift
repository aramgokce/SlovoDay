import SwiftUI

struct ContentView: View {
    @State private var selectedIndex = todayIndex(from: wordList)

    var body: some View {
        NavigationStack {
            TabView(selection: $selectedIndex) {
                ForEach(wordList.indices, id: \.self) { index in
                    WordCardView(word: wordList[index])
                        .tag(index)
                }
            }
            .tabViewStyle(.page(indexDisplayMode: .automatic))
            .navigationTitle("SlovoDay")
        }
    }
}

struct WordCardView: View {
    let word: Word

    var body: some View {
        VStack(spacing: 24) {
            Text("Word of the Day")
                .font(.headline)
                .foregroundColor(.secondary)

            VStack(spacing: 8) {
                Text(word.russian)
                    .font(.system(size: 48, weight: .bold))

                Text(word.transliteration)
                    .font(.title3)
                    .foregroundColor(.secondary)
                    .italic()
            }

            Text(word.partOfSpeech + (word.gender.map { " · \($0)" } ?? ""))
                .font(.caption)
                .foregroundColor(.secondary)

            Text(word.translation)
                .font(.title2)
                .fontWeight(.semibold)

            Divider()
                .padding(.horizontal, 40)

            VStack(spacing: 6) {
                Text(word.exampleRussian)
                    .font(.body)
                    .multilineTextAlignment(.center)

                Text(word.exampleTranslation)
                    .font(.body)
                    .foregroundColor(.secondary)
                    .multilineTextAlignment(.center)
            }
            .padding(.horizontal, 32)

            if let details = word.verbDetails {
                NavigationLink {
                    VerbDetailView(word: word, details: details)
                } label: {
                    HStack {
                        Text("Aspect: \(details.aspect)")
                        if let pair = details.aspectPair {
                            Text("↔ \(pair)")
                                .foregroundColor(.secondary)
                        }
                        Image(systemName: "chevron.right")
                            .font(.caption)
                    }
                    .padding(.horizontal, 16)
                    .padding(.vertical, 10)
                    .background(Color.gray.opacity(0.15))
                    .clipShape(Capsule())
                }
                .buttonStyle(.plain)
            }

            Spacer()
        }
        .padding(.top, 60)
    }
}

func todayIndex(from list: [Word], startDate: Date = Date(timeIntervalSince1970: 1735689600)) -> Int {
    let daysSinceStart = Calendar.current.dateComponents([.day], from: startDate, to: Date()).day ?? 0
    return daysSinceStart % list.count
}

#Preview {
    ContentView()
}
