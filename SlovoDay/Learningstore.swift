//
//  Learningstore.swift
//  SlovoDay
//
//  Created by Aram Gokce on 7/24/26.
import Foundation
import Combine

class LearningStore: ObservableObject {
    @Published private(set) var learnedIDs: Set<Int>
    @Published private(set) var deck: [Int]              // shuffled queue of remaining word ids
    @Published private(set) var selectedCategory: String? // nil = "All"

    private let learnedKey = "learnedWordIDs"
    private let deckKey = "currentDeckOrder"
    private let categoryKey = "selectedCategory"

    init() {
        let savedLearned = UserDefaults.standard.array(forKey: learnedKey) as? [Int] ?? []
        let learnedSet = Set(savedLearned)
        self.learnedIDs = learnedSet

        let savedCategory = UserDefaults.standard.string(forKey: categoryKey)
        self.selectedCategory = savedCategory

        if let savedDeck = UserDefaults.standard.array(forKey: deckKey) as? [Int], !savedDeck.isEmpty {
            self.deck = savedDeck
        } else {
            self.deck = LearningStore.buildDeck(excluding: learnedSet, category: savedCategory)
        }
    }

    static func buildDeck(excluding learned: Set<Int>, category: String?) -> [Int] {
        wordList
            .filter { category == nil || $0.partOfSpeech == category }
            .map { $0.id }
            .filter { !learned.contains($0) }
            .shuffled()
    }

    // Counts scoped to the currently selected category (or all words if nil).
    var totalCount: Int { totalCount(for: selectedCategory) }
    var learnedCount: Int { learnedCount(for: selectedCategory) }

    // Counts for an arbitrary category, used to show progress on every chip at once.
    func totalCount(for category: String?) -> Int {
        wordList.filter { category == nil || $0.partOfSpeech == category }.count
    }

    func learnedCount(for category: String?) -> Int {
        wordList.filter {
            (category == nil || $0.partOfSpeech == category) && learnedIDs.contains($0.id)
        }.count
    }

    var remainingCount: Int { deck.count }

    var currentWord: Word? {
        guard let id = deck.first else { return nil }
        return wordList.first { $0.id == id }
    }

    // Switches the active category filter and rebuilds the deck for it.
    func setCategory(_ category: String?) {
        selectedCategory = category
        deck = LearningStore.buildDeck(excluding: learnedIDs, category: category)
        save()
    }

    // Marks the current card as learned and removes it from the deck for good.
    func markCurrentAsLearned() {
        guard !deck.isEmpty else { return }
        let id = deck.removeFirst()
        learnedIDs.insert(id)
        save()
    }

    // Puts the current card back into the pool and reshuffles, so the
    // next card is random rather than always cycling in the same order.
    func skipCurrent() {
        guard !deck.isEmpty else { return }
        let id = deck.removeFirst()
        deck.append(id)
        deck.shuffle()
        save()
    }

    // Reshuffles the remaining deck on demand, without skipping the current card.
    func shuffleDeck() {
        deck.shuffle()
        save()
    }

    // Clears all progress (across every category) and rebuilds the deck
    // for whichever category is currently selected.
    func reset() {
        learnedIDs = []
        deck = LearningStore.buildDeck(excluding: [], category: selectedCategory)
        save()
    }

    private func save() {
        UserDefaults.standard.set(Array(learnedIDs), forKey: learnedKey)
        UserDefaults.standard.set(deck, forKey: deckKey)
        if let category = selectedCategory {
            UserDefaults.standard.set(category, forKey: categoryKey)
        } else {
            UserDefaults.standard.removeObject(forKey: categoryKey)
        }
    }
}
