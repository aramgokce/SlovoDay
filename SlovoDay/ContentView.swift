
import SwiftUI

struct ContentView: View {
    @StateObject private var store = LearningStore()
    @State private var showSettings = false

    var body: some View {
        NavigationStack {
            VStack(spacing: 24) {

                // Category filter chips
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 8) {
                        CategoryChip(
                            label: "All",
                            learned: store.learnedCount(for: nil),
                            total: store.totalCount(for: nil),
                            isSelected: store.selectedCategory == nil
                        ) {
                            store.setCategory(nil)
                        }
                        ForEach(wordCategories, id: \.self) { category in
                            CategoryChip(
                                label: category.capitalized,
                                learned: store.learnedCount(for: category),
                                total: store.totalCount(for: category),
                                isSelected: store.selectedCategory == category
                            ) {
                                store.setCategory(category)
                            }
                        }
                    }
                    .padding(.horizontal, 20)
                }
                .padding(.top, 16)

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
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        showSettings = true
                    } label: {
                        Image(systemName: "line.3.horizontal")
                    }
                }
            }
            .sheet(isPresented: $showSettings) {
                SettingsView(store: store)
            }
        }
    }
}

#Preview {
    ContentView()
}

// A single pill-shaped filter chip used in the category bar, showing that
// category's own learned/total progress.
struct CategoryChip: View {
    let label: String
    let learned: Int
    let total: Int
    let isSelected: Bool
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            VStack(spacing: 2) {
                Text(label)
                    .font(.subheadline)
                    .fontWeight(isSelected ? .semibold : .regular)
                Text("\(learned)/\(total)")
                    .font(.caption2)
                    .opacity(0.8)
            }
            .padding(.horizontal, 14)
            .padding(.vertical, 8)
            .background(isSelected ? Color.accentColor : Color.gray.opacity(0.15))
            .foregroundColor(isSelected ? .white : .primary)
            .clipShape(Capsule())
        }
        .buttonStyle(.plain)
    }
}
