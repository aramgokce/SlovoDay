//
//  Word.swift
//  SlovoDay
//
//  Created by Aram Gokce on 7/6/26.
//

import Foundation

struct Word: Identifiable {
    let id: Int
    let russian: String
    let transliteration: String   // with stress marked, e.g. "spasIba"
    let translation: String
    let partOfSpeech: String
    let gender: String?           // "masculine" / "feminine" / "neuter" / nil
    let exampleRussian: String
    let exampleTranslation: String
}

// Starter word list — add more over time.
// The order here is the order words will be taught.
let wordList: [Word] = [
    Word(id: 1, russian: "спасибо", transliteration: "spasIba", translation: "thank you",
         partOfSpeech: "interjection", gender: nil,
         exampleRussian: "Спасибо за помощь!", exampleTranslation: "Thanks for the help!"),

    Word(id: 2, russian: "привет", transliteration: "privEt", translation: "hi / hello",
         partOfSpeech: "interjection", gender: nil,
         exampleRussian: "Привет, как дела?", exampleTranslation: "Hi, how are you?"),

    Word(id: 3, russian: "дом", transliteration: "dom", translation: "house / home",
         partOfSpeech: "noun", gender: "masculine",
         exampleRussian: "Это мой дом.", exampleTranslation: "This is my house."),

    Word(id: 4, russian: "вода", transliteration: "vadA", translation: "water",
         partOfSpeech: "noun", gender: "feminine",
         exampleRussian: "Я хочу воды.", exampleTranslation: "I want water."),

    Word(id: 5, russian: "хорошо", transliteration: "kharashO", translation: "good / well",
         partOfSpeech: "adverb", gender: nil,
         exampleRussian: "Всё хорошо.", exampleTranslation: "Everything is fine."),
]

// Picks a word based on how many days since a fixed start date,
// so the "word of the day" changes automatically every day.
func wordOfTheDay(from list: [Word], startDate: Date = Date(timeIntervalSince1970: 1735689600)) -> Word {
    let daysSinceStart = Calendar.current.dateComponents([.day], from: startDate, to: Date()).day ?? 0
    let index = daysSinceStart % list.count
    return list[index]
}
