//
//  Word.swift
//  SlovoDay
//
//  Created by Aram Gokce on 7/6/26.
//

import Foundation

// MARK: - Verb-specific grammatical details
struct VerbDetails {
    let aspect: String              // "imperfective" or "perfective"
    let aspectPair: String?         // the matching verb of the other aspect (nil if none)
    let pastMasculine: String
    let pastFeminine: String
    let pastNeuter: String
    let pastPlural: String
    let present: [String: String]   // keys: "ya","ty","on","my","vy","oni"
    let imperativeInformal: String?
    let imperativeFormal: String?
}

// MARK: - Word
struct Word: Identifiable {
    let id: Int
    let russian: String
    let transliteration: String     // stress marked, e.g. "spasIba"
    let translation: String
    let partOfSpeech: String
    let gender: String?             // for nouns: "masculine"/"feminine"/"neuter"
    let exampleRussian: String
    let exampleTranslation: String
    let verbDetails: VerbDetails?   // only filled in for verbs
}

// MARK: - Word list (top 30, frequency-informed)
let wordList: [Word] = [

    Word(id: 1, russian: "я", transliteration: "ya", translation: "I",
         partOfSpeech: "pronoun", gender: nil,
         exampleRussian: "Я студент.", exampleTranslation: "I am a student.",
         verbDetails: nil),

    Word(id: 2, russian: "ты", transliteration: "ty", translation: "you (informal)",
         partOfSpeech: "pronoun", gender: nil,
         exampleRussian: "Ты дома?", exampleTranslation: "Are you home?",
         verbDetails: nil),

    Word(id: 3, russian: "он", transliteration: "on", translation: "he",
         partOfSpeech: "pronoun", gender: nil,
         exampleRussian: "Он врач.", exampleTranslation: "He is a doctor.",
         verbDetails: nil),

    Word(id: 4, russian: "она", transliteration: "aná", translation: "she",
         partOfSpeech: "pronoun", gender: nil,
         exampleRussian: "Она здесь.", exampleTranslation: "She is here.",
         verbDetails: nil),

    Word(id: 5, russian: "мы", transliteration: "my", translation: "we",
         partOfSpeech: "pronoun", gender: nil,
         exampleRussian: "Мы друзья.", exampleTranslation: "We are friends.",
         verbDetails: nil),

    Word(id: 6, russian: "вы", transliteration: "vy", translation: "you (formal/plural)",
         partOfSpeech: "pronoun", gender: nil,
         exampleRussian: "Вы говорите по-русски?", exampleTranslation: "Do you speak Russian?",
         verbDetails: nil),

    Word(id: 7, russian: "они", transliteration: "aní", translation: "they",
         partOfSpeech: "pronoun", gender: nil,
         exampleRussian: "Они дома.", exampleTranslation: "They are home.",
         verbDetails: nil),

    Word(id: 8, russian: "это", transliteration: "Eta", translation: "this / it",
         partOfSpeech: "pronoun", gender: nil,
         exampleRussian: "Это моя книга.", exampleTranslation: "This is my book.",
         verbDetails: nil),

    Word(id: 9, russian: "что", transliteration: "shto", translation: "what",
         partOfSpeech: "pronoun", gender: nil,
         exampleRussian: "Что это?", exampleTranslation: "What is this?",
         verbDetails: nil),

    Word(id: 10, russian: "как", transliteration: "kak", translation: "how",
         partOfSpeech: "adverb", gender: nil,
         exampleRussian: "Как дела?", exampleTranslation: "How are you?",
         verbDetails: nil),

    Word(id: 11, russian: "да", transliteration: "da", translation: "yes",
         partOfSpeech: "particle", gender: nil,
         exampleRussian: "Да, конечно.", exampleTranslation: "Yes, of course.",
         verbDetails: nil),

    Word(id: 12, russian: "нет", transliteration: "nyet", translation: "no",
         partOfSpeech: "particle", gender: nil,
         exampleRussian: "Нет, спасибо.", exampleTranslation: "No, thank you.",
         verbDetails: nil),

    Word(id: 13, russian: "хорошо", transliteration: "kharashO", translation: "good / well",
         partOfSpeech: "adverb", gender: nil,
         exampleRussian: "Всё хорошо.", exampleTranslation: "Everything is fine.",
         verbDetails: nil),

    Word(id: 14, russian: "спасибо", transliteration: "spasIba", translation: "thank you",
         partOfSpeech: "interjection", gender: nil,
         exampleRussian: "Спасибо за помощь!", exampleTranslation: "Thanks for the help!",
         verbDetails: nil),

    Word(id: 15, russian: "пожалуйста", transliteration: "pazhAlusta", translation: "please / you're welcome",
         partOfSpeech: "interjection", gender: nil,
         exampleRussian: "Помоги мне, пожалуйста.", exampleTranslation: "Help me, please.",
         verbDetails: nil),

    Word(id: 16, russian: "дом", transliteration: "dom", translation: "house / home",
         partOfSpeech: "noun", gender: "masculine",
         exampleRussian: "Это мой дом.", exampleTranslation: "This is my house.",
         verbDetails: nil),

    Word(id: 17, russian: "вода", transliteration: "vadA", translation: "water",
         partOfSpeech: "noun", gender: "feminine",
         exampleRussian: "Я хочу воды.", exampleTranslation: "I want water.",
         verbDetails: nil),

    Word(id: 18, russian: "время", transliteration: "vRYEmya", translation: "time",
         partOfSpeech: "noun", gender: "neuter",
         exampleRussian: "У меня нет времени.", exampleTranslation: "I don't have time.",
         verbDetails: nil),

    Word(id: 19, russian: "год", transliteration: "got", translation: "year",
         partOfSpeech: "noun", gender: "masculine",
         exampleRussian: "В этом году.", exampleTranslation: "This year.",
         verbDetails: nil),

    Word(id: 20, russian: "человек", transliteration: "chelavYEk", translation: "person",
         partOfSpeech: "noun", gender: "masculine",
         exampleRussian: "Он хороший человек.", exampleTranslation: "He is a good person.",
         verbDetails: nil),

    // MARK: Verbs — these carry full VerbDetails

    Word(id: 21, russian: "быть", transliteration: "byt", translation: "to be",
         partOfSpeech: "verb", gender: nil,
         exampleRussian: "Я буду дома.", exampleTranslation: "I will be home.",
         verbDetails: VerbDetails(
            aspect: "imperfective", aspectPair: nil,
            pastMasculine: "был", pastFeminine: "была", pastNeuter: "было", pastPlural: "были",
            present: ["ya": "—", "ty": "—", "on": "есть", "my": "—", "vy": "—", "oni": "—"],
            imperativeInformal: "будь", imperativeFormal: "будьте")),

    Word(id: 22, russian: "знать", transliteration: "znat", translation: "to know",
         partOfSpeech: "verb", gender: nil,
         exampleRussian: "Я не знаю.", exampleTranslation: "I don't know.",
         verbDetails: VerbDetails(
            aspect: "imperfective", aspectPair: "узнать",
            pastMasculine: "знал", pastFeminine: "знала", pastNeuter: "знало", pastPlural: "знали",
            present: ["ya": "знаю", "ty": "знаешь", "on": "знает", "my": "знаем", "vy": "знаете", "oni": "знают"],
            imperativeInformal: "знай", imperativeFormal: "знайте")),

    Word(id: 23, russian: "мочь", transliteration: "moch", translation: "can / to be able to",
         partOfSpeech: "verb", gender: nil,
         exampleRussian: "Я могу помочь.", exampleTranslation: "I can help.",
         verbDetails: VerbDetails(
            aspect: "imperfective", aspectPair: "смочь",
            pastMasculine: "мог", pastFeminine: "могла", pastNeuter: "могло", pastPlural: "могли",
            present: ["ya": "могу", "ty": "можешь", "on": "может", "my": "можем", "vy": "можете", "oni": "могут"],
            imperativeInformal: nil, imperativeFormal: nil)),

    Word(id: 24, russian: "хотеть", transliteration: "khatYEt", translation: "to want",
         partOfSpeech: "verb", gender: nil,
         exampleRussian: "Я хочу есть.", exampleTranslation: "I want to eat.",
         verbDetails: VerbDetails(
            aspect: "imperfective", aspectPair: "захотеть",
            pastMasculine: "хотел", pastFeminine: "хотела", pastNeuter: "хотело", pastPlural: "хотели",
            present: ["ya": "хочу", "ty": "хочешь", "on": "хочет", "my": "хотим", "vy": "хотите", "oni": "хотят"],
            imperativeInformal: nil, imperativeFormal: nil)),

    Word(id: 25, russian: "говорить", transliteration: "gavarIt", translation: "to speak / say",
         partOfSpeech: "verb", gender: nil,
         exampleRussian: "Я говорю по-русски.", exampleTranslation: "I speak Russian.",
         verbDetails: VerbDetails(
            aspect: "imperfective", aspectPair: "сказать",
            pastMasculine: "говорил", pastFeminine: "говорила", pastNeuter: "говорило", pastPlural: "говорили",
            present: ["ya": "говорю", "ty": "говоришь", "on": "говорит", "my": "говорим", "vy": "говорите", "oni": "говорят"],
            imperativeInformal: "говори", imperativeFormal: "говорите")),

    Word(id: 26, russian: "делать", transliteration: "dYElat", translation: "to do / make",
         partOfSpeech: "verb", gender: nil,
         exampleRussian: "Что ты делаешь?", exampleTranslation: "What are you doing?",
         verbDetails: VerbDetails(
            aspect: "imperfective", aspectPair: "сделать",
            pastMasculine: "делал", pastFeminine: "делала", pastNeuter: "делало", pastPlural: "делали",
            present: ["ya": "делаю", "ty": "делаешь", "on": "делает", "my": "делаем", "vy": "делаете", "oni": "делают"],
            imperativeInformal: "делай", imperativeFormal: "делайте")),

    Word(id: 27, russian: "идти", transliteration: "itI", translation: "to go (on foot)",
         partOfSpeech: "verb", gender: nil,
         exampleRussian: "Я иду домой.", exampleTranslation: "I am going home.",
         verbDetails: VerbDetails(
            aspect: "imperfective", aspectPair: "пойти",
            pastMasculine: "шёл", pastFeminine: "шла", pastNeuter: "шло", pastPlural: "шли",
            present: ["ya": "иду", "ty": "идёшь", "on": "идёт", "my": "идём", "vy": "идёте", "oni": "идут"],
            imperativeInformal: "иди", imperativeFormal: "идите")),

    Word(id: 28, russian: "свой", transliteration: "svoy", translation: "one's own",
         partOfSpeech: "pronoun", gender: nil,
         exampleRussian: "У меня есть своя комната.", exampleTranslation: "I have my own room.",
         verbDetails: nil),

    Word(id: 29, russian: "весь", transliteration: "vyes", translation: "all / whole",
         partOfSpeech: "pronoun", gender: nil,
         exampleRussian: "Весь день.", exampleTranslation: "The whole day.",
         verbDetails: nil),

    Word(id: 30, russian: "так", transliteration: "tak", translation: "so / like this",
         partOfSpeech: "adverb", gender: nil,
         exampleRussian: "Это не так.", exampleTranslation: "That's not so.",
         verbDetails: nil),

    // MARK: More high-frequency verbs

    Word(id: 31, russian: "видеть", transliteration: "vIdet", translation: "to see",
         partOfSpeech: "verb", gender: nil,
         exampleRussian: "Я вижу тебя.", exampleTranslation: "I see you.",
         verbDetails: VerbDetails(
            aspect: "imperfective", aspectPair: "увидеть",
            pastMasculine: "видел", pastFeminine: "видела", pastNeuter: "видело", pastPlural: "видели",
            present: ["ya": "вижу", "ty": "видишь", "on": "видит", "my": "видим", "vy": "видите", "oni": "видят"],
            imperativeInformal: nil, imperativeFormal: nil)),

    Word(id: 32, russian: "смотреть", transliteration: "smatRYEt", translation: "to watch / look",
         partOfSpeech: "verb", gender: nil,
         exampleRussian: "Я смотрю телевизор.", exampleTranslation: "I am watching TV.",
         verbDetails: VerbDetails(
            aspect: "imperfective", aspectPair: "посмотреть",
            pastMasculine: "смотрел", pastFeminine: "смотрела", pastNeuter: "смотрело", pastPlural: "смотрели",
            present: ["ya": "смотрю", "ty": "смотришь", "on": "смотрит", "my": "смотрим", "vy": "смотрите", "oni": "смотрят"],
            imperativeInformal: "смотри", imperativeFormal: "смотрите")),

    Word(id: 33, russian: "думать", transliteration: "dUmat", translation: "to think",
         partOfSpeech: "verb", gender: nil,
         exampleRussian: "Я думаю, что да.", exampleTranslation: "I think so.",
         verbDetails: VerbDetails(
            aspect: "imperfective", aspectPair: "подумать",
            pastMasculine: "думал", pastFeminine: "думала", pastNeuter: "думало", pastPlural: "думали",
            present: ["ya": "думаю", "ty": "думаешь", "on": "думает", "my": "думаем", "vy": "думаете", "oni": "думают"],
            imperativeInformal: "думай", imperativeFormal: "думайте")),

    Word(id: 34, russian: "писать", transliteration: "pisAt", translation: "to write",
         partOfSpeech: "verb", gender: nil,
         exampleRussian: "Я пишу письмо.", exampleTranslation: "I am writing a letter.",
         verbDetails: VerbDetails(
            aspect: "imperfective", aspectPair: "написать",
            pastMasculine: "писал", pastFeminine: "писала", pastNeuter: "писало", pastPlural: "писали",
            present: ["ya": "пишу", "ty": "пишешь", "on": "пишет", "my": "пишем", "vy": "пишете", "oni": "пишут"],
            imperativeInformal: "пиши", imperativeFormal: "пишите")),

    Word(id: 35, russian: "читать", transliteration: "chitAt", translation: "to read",
         partOfSpeech: "verb", gender: nil,
         exampleRussian: "Я читаю книгу.", exampleTranslation: "I am reading a book.",
         verbDetails: VerbDetails(
            aspect: "imperfective", aspectPair: "прочитать",
            pastMasculine: "читал", pastFeminine: "читала", pastNeuter: "читало", pastPlural: "читали",
            present: ["ya": "читаю", "ty": "читаешь", "on": "читает", "my": "читаем", "vy": "читаете", "oni": "читают"],
            imperativeInformal: "читай", imperativeFormal: "читайте")),

    Word(id: 36, russian: "давать", transliteration: "davAt", translation: "to give",
         partOfSpeech: "verb", gender: nil,
         exampleRussian: "Он даёт мне книгу.", exampleTranslation: "He gives me a book.",
         verbDetails: VerbDetails(
            aspect: "imperfective", aspectPair: "дать",
            pastMasculine: "давал", pastFeminine: "давала", pastNeuter: "давало", pastPlural: "давали",
            present: ["ya": "даю", "ty": "даёшь", "on": "даёт", "my": "даём", "vy": "даёте", "oni": "дают"],
            imperativeInformal: "давай", imperativeFormal: "давайте")),

    Word(id: 37, russian: "понимать", transliteration: "panimAt", translation: "to understand",
         partOfSpeech: "verb", gender: nil,
         exampleRussian: "Я не понимаю.", exampleTranslation: "I don't understand.",
         verbDetails: VerbDetails(
            aspect: "imperfective", aspectPair: "понять",
            pastMasculine: "понимал", pastFeminine: "понимала", pastNeuter: "понимало", pastPlural: "понимали",
            present: ["ya": "понимаю", "ty": "понимаешь", "on": "понимает", "my": "понимаем", "vy": "понимаете", "oni": "понимают"],
            imperativeInformal: nil, imperativeFormal: nil)),

    Word(id: 38, russian: "жить", transliteration: "zhyt", translation: "to live",
         partOfSpeech: "verb", gender: nil,
         exampleRussian: "Я живу в Москве.", exampleTranslation: "I live in Moscow.",
         verbDetails: VerbDetails(
            aspect: "imperfective", aspectPair: nil,
            pastMasculine: "жил", pastFeminine: "жила", pastNeuter: "жило", pastPlural: "жили",
            present: ["ya": "живу", "ty": "живёшь", "on": "живёт", "my": "живём", "vy": "живёте", "oni": "живут"],
            imperativeInformal: "живи", imperativeFormal: "живите")),

    Word(id: 39, russian: "работать", transliteration: "rabOtat", translation: "to work",
         partOfSpeech: "verb", gender: nil,
         exampleRussian: "Я работаю дома.", exampleTranslation: "I work from home.",
         verbDetails: VerbDetails(
            aspect: "imperfective", aspectPair: nil,
            pastMasculine: "работал", pastFeminine: "работала", pastNeuter: "работало", pastPlural: "работали",
            present: ["ya": "работаю", "ty": "работаешь", "on": "работает", "my": "работаем", "vy": "работаете", "oni": "работают"],
            imperativeInformal: "работай", imperativeFormal: "работайте")),

    Word(id: 40, russian: "любить", transliteration: "lyubIt", translation: "to love / like",
         partOfSpeech: "verb", gender: nil,
         exampleRussian: "Я люблю тебя.", exampleTranslation: "I love you.",
         verbDetails: VerbDetails(
            aspect: "imperfective", aspectPair: nil,
            pastMasculine: "любил", pastFeminine: "любила", pastNeuter: "любило", pastPlural: "любили",
            present: ["ya": "люблю", "ty": "любишь", "on": "любит", "my": "любим", "vy": "любите", "oni": "любят"],
            imperativeInformal: "люби", imperativeFormal: "любите")),

    Word(id: 41, russian: "брать", transliteration: "brAt", translation: "to take",
         partOfSpeech: "verb", gender: nil,
         exampleRussian: "Я беру такси.", exampleTranslation: "I'm taking a taxi.",
         verbDetails: VerbDetails(
            aspect: "imperfective", aspectPair: "взять",
            pastMasculine: "брал", pastFeminine: "брала", pastNeuter: "брало", pastPlural: "брали",
            present: ["ya": "беру", "ty": "берёшь", "on": "берёт", "my": "берём", "vy": "берёте", "oni": "берут"],
            imperativeInformal: "бери", imperativeFormal: "берите")),

    Word(id: 42, russian: "стать", transliteration: "stAt", translation: "to become",
         partOfSpeech: "verb", gender: nil,
         exampleRussian: "Он стал врачом.", exampleTranslation: "He became a doctor.",
         verbDetails: VerbDetails(
            aspect: "perfective", aspectPair: "становиться",
            pastMasculine: "стал", pastFeminine: "стала", pastNeuter: "стало", pastPlural: "стали",
            present: ["ya": "стану", "ty": "станешь", "on": "станет", "my": "станем", "vy": "станете", "oni": "станут"],
            imperativeInformal: "стань", imperativeFormal: "станьте")),

    Word(id: 43, russian: "прийти", transliteration: "priytI", translation: "to come / arrive",
         partOfSpeech: "verb", gender: nil,
         exampleRussian: "Он придёт завтра.", exampleTranslation: "He will come tomorrow.",
         verbDetails: VerbDetails(
            aspect: "perfective", aspectPair: "приходить",
            pastMasculine: "пришёл", pastFeminine: "пришла", pastNeuter: "пришло", pastPlural: "пришли",
            present: ["ya": "приду", "ty": "придёшь", "on": "придёт", "my": "придём", "vy": "придёте", "oni": "придут"],
            imperativeInformal: "приди", imperativeFormal: "придите")),

    Word(id: 44, russian: "сказать", transliteration: "skazAt", translation: "to say (once)",
         partOfSpeech: "verb", gender: nil,
         exampleRussian: "Он сказал правду.", exampleTranslation: "He told the truth.",
         verbDetails: VerbDetails(
            aspect: "perfective", aspectPair: "говорить",
            pastMasculine: "сказал", pastFeminine: "сказала", pastNeuter: "сказало", pastPlural: "сказали",
            present: ["ya": "скажу", "ty": "скажешь", "on": "скажет", "my": "скажем", "vy": "скажете", "oni": "скажут"],
            imperativeInformal: "скажи", imperativeFormal: "скажите")),
]

// Picks a word based on how many days since a fixed start date,
// so the "word of the day" changes automatically every day.
func wordOfTheDay(from list: [Word], startDate: Date = Date(timeIntervalSince1970: 1735689600)) -> Word {
    let daysSinceStart = Calendar.current.dateComponents([.day], from: startDate, to: Date()).day ?? 0
    let index = daysSinceStart % list.count
    return list[index]
}
