//
//  Learningstore.swift
//  SlovoDay
//
//  Created by Aram Gokce on 7/24/26.
//
import Foundation
import Combine

class LearningStore: ObservableObject {
    @Published private(set) var learnedIDs: Set<Int>
    @Published private(set) var deck: [Int]   // shuffled queue of remaining word ids

    private let learnedKey = "learnedWordIDs"
    private let deckKey = "currentDeckOrder"

    init() {
        let savedLearned = UserDefaults.standard.array(forKey: learnedKey) as? [Int] ?? []
        let learnedSet = Set(savedLearned)
        self.learnedIDs = learnedSet

        if let savedDeck = UserDefaults.standard.array(forKey: deckKey) as? [Int], !savedDeck.isEmpty {
            self.deck = savedDeck
        } else {
            self.deck = LearningStore.buildDeck(excluding: learnedSet)
        }
    }

    static func buildDeck(excluding learned: Set<Int>) -> [Int] {
        wordList.map { $0.id }.filter { !learned.contains($0) }.shuffled()
    }

    var totalCount: Int { wordList.count }
    var learnedCount: Int { learnedIDs.count }
    var remainingCount: Int { deck.count }

    var currentWord: Word? {
        guard let id = deck.first else { return nil }
        return wordList.first { $0.id == id }
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

    // Clears all progress and reshuffles the full word list.
    func reset() {
        learnedIDs = []
        deck = LearningStore.buildDeck(excluding: [])
        save()
    }

    private func save() {
        UserDefaults.standard.set(Array(learnedIDs), forKey: learnedKey)
        UserDefaults.standard.set(deck, forKey: deckKey)
    }
}
