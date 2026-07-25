import SwiftUI

struct ContentView: View {
    @StateObject private var store = LearningStore()

    var body: some View {
        NavigationStack {
            VStack(spacing: 24) {

                VStack(spacing: 6) {
                    HStack {
                        Text("\(store.learnedCount) / \(store.totalCount) words learned")
                            .font(.subheadline)
                            .foregroundColor(.secondary)

                        Spacer()

                        Button {
                            store.shuffleDeck()
                        } label: {
                            Image(systemName: "shuffle")
                                .foregroundColor(.secondary)
                        }
                    }
                    .padding(.horizontal, 40)

                    ProgressView(value: Double(store.learnedCount), total: Double(max(store.totalCount, 1)))
                        .padding(.horizontal, 40)
                }
                .padding(.top, 40)

                if let word = store.currentWord {

                    VStack(spacing: 8) {
                        Text(stressedRussian(word))
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

                    HStack(spacing: 16) {
                        Button {
                            store.skipCurrent()
                        } label: {
                            Text("Skip")
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(Color.gray.opacity(0.15))
                                .clipShape(RoundedRectangle(cornerRadius: 12))
                        }

                        Button {
                            store.markCurrentAsLearned()
                        } label: {
                            Text("Learned")
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(Color.green)
                                .foregroundColor(.white)
                                .clipShape(RoundedRectangle(cornerRadius: 12))
                        }
                    }
                    .padding(.horizontal, 24)
                    .padding(.bottom, 24)

                } else {
                    Spacer()
                    VStack(spacing: 16) {
                        Text("You've learned every word!")
                            .font(.title2.bold())
                        Text("Start over to review them all again.")
                            .foregroundColor(.secondary)
                        Button {
                            store.reset()
                        } label: {
                            Text("Start Over")
                                .padding()
                                .background(Color.blue)
                                .foregroundColor(.white)
                                .clipShape(RoundedRectangle(cornerRadius: 12))
                        }
                        .padding(.top, 8)
                    }
                    Spacer()
                }
            }
            .navigationTitle("SlovoDay")
        }
    }
}

#Preview {
    ContentView()
}
