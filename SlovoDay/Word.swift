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

    // MARK: Batch 2 — 50 more high-frequency verbs (ids 45-94)

    Word(id: 45, russian: "слышать", transliteration: "slYshat", translation: "to hear",
         partOfSpeech: "verb", gender: nil,
         exampleRussian: "Я тебя не слышу.", exampleTranslation: "I can't hear you.",
         verbDetails: VerbDetails(aspect: "imperfective", aspectPair: "услышать",
            pastMasculine: "слышал", pastFeminine: "слышала", pastNeuter: "слышало", pastPlural: "слышали",
            present: ["ya": "слышу", "ty": "слышишь", "on": "слышит", "my": "слышим", "vy": "слышите", "oni": "слышат"],
            imperativeInformal: nil, imperativeFormal: nil)),

    Word(id: 46, russian: "спрашивать", transliteration: "sprAshivat", translation: "to ask",
         partOfSpeech: "verb", gender: nil,
         exampleRussian: "Я хочу спрашивать вас.", exampleTranslation: "I want to ask you.",
         verbDetails: VerbDetails(aspect: "imperfective", aspectPair: "спросить",
            pastMasculine: "спрашивал", pastFeminine: "спрашивала", pastNeuter: "спрашивало", pastPlural: "спрашивали",
            present: ["ya": "спрашиваю", "ty": "спрашиваешь", "on": "спрашивает", "my": "спрашиваем", "vy": "спрашиваете", "oni": "спрашивают"],
            imperativeInformal: "спрашивай", imperativeFormal: "спрашивайте")),

    Word(id: 47, russian: "спросить", transliteration: "sprasIt", translation: "to ask (once)",
         partOfSpeech: "verb", gender: nil,
         exampleRussian: "Можно спросить?", exampleTranslation: "May I ask?",
         verbDetails: VerbDetails(aspect: "perfective", aspectPair: "спрашивать",
            pastMasculine: "спросил", pastFeminine: "спросила", pastNeuter: "спросило", pastPlural: "спросили",
            present: ["ya": "спрошу", "ty": "спросишь", "on": "спросит", "my": "спросим", "vy": "спросите", "oni": "спросят"],
            imperativeInformal: "спроси", imperativeFormal: "спросите")),

    Word(id: 48, russian: "отвечать", transliteration: "atvechAt", translation: "to answer",
         partOfSpeech: "verb", gender: nil,
         exampleRussian: "Я отвечаю на вопрос.", exampleTranslation: "I'm answering the question.",
         verbDetails: VerbDetails(aspect: "imperfective", aspectPair: "ответить",
            pastMasculine: "отвечал", pastFeminine: "отвечала", pastNeuter: "отвечало", pastPlural: "отвечали",
            present: ["ya": "отвечаю", "ty": "отвечаешь", "on": "отвечает", "my": "отвечаем", "vy": "отвечаете", "oni": "отвечают"],
            imperativeInformal: "отвечай", imperativeFormal: "отвечайте")),

    Word(id: 49, russian: "ответить", transliteration: "atVYEtit", translation: "to answer (once)",
         partOfSpeech: "verb", gender: nil,
         exampleRussian: "Он не ответил.", exampleTranslation: "He didn't answer.",
         verbDetails: VerbDetails(aspect: "perfective", aspectPair: "отвечать",
            pastMasculine: "ответил", pastFeminine: "ответила", pastNeuter: "ответило", pastPlural: "ответили",
            present: ["ya": "отвечу", "ty": "ответишь", "on": "ответит", "my": "ответим", "vy": "ответите", "oni": "ответят"],
            imperativeInformal: "ответь", imperativeFormal: "ответьте")),

    Word(id: 50, russian: "начинать", transliteration: "nachinAt", translation: "to begin",
         partOfSpeech: "verb", gender: nil,
         exampleRussian: "Мы начинаем урок.", exampleTranslation: "We are starting the lesson.",
         verbDetails: VerbDetails(aspect: "imperfective", aspectPair: "начать",
            pastMasculine: "начинал", pastFeminine: "начинала", pastNeuter: "начинало", pastPlural: "начинали",
            present: ["ya": "начинаю", "ty": "начинаешь", "on": "начинает", "my": "начинаем", "vy": "начинаете", "oni": "начинают"],
            imperativeInformal: "начинай", imperativeFormal: "начинайте")),

    Word(id: 51, russian: "начать", transliteration: "nachAt", translation: "to begin (once)",
         partOfSpeech: "verb", gender: nil,
         exampleRussian: "Давай начнём.", exampleTranslation: "Let's begin.",
         verbDetails: VerbDetails(aspect: "perfective", aspectPair: "начинать",
            pastMasculine: "начал", pastFeminine: "начала", pastNeuter: "начало", pastPlural: "начали",
            present: ["ya": "начну", "ty": "начнёшь", "on": "начнёт", "my": "начнём", "vy": "начнёте", "oni": "начнут"],
            imperativeInformal: "начни", imperativeFormal: "начните")),

    Word(id: 52, russian: "заканчивать", transliteration: "zakAnchivat", translation: "to finish",
         partOfSpeech: "verb", gender: nil,
         exampleRussian: "Я заканчиваю работу.", exampleTranslation: "I'm finishing work.",
         verbDetails: VerbDetails(aspect: "imperfective", aspectPair: "закончить",
            pastMasculine: "заканчивал", pastFeminine: "заканчивала", pastNeuter: "заканчивало", pastPlural: "заканчивали",
            present: ["ya": "заканчиваю", "ty": "заканчиваешь", "on": "заканчивает", "my": "заканчиваем", "vy": "заканчиваете", "oni": "заканчивают"],
            imperativeInformal: "заканчивай", imperativeFormal: "заканчивайте")),

    Word(id: 53, russian: "закончить", transliteration: "zakOnchit", translation: "to finish (once)",
         partOfSpeech: "verb", gender: nil,
         exampleRussian: "Я закончил работу.", exampleTranslation: "I finished work.",
         verbDetails: VerbDetails(aspect: "perfective", aspectPair: "заканчивать",
            pastMasculine: "закончил", pastFeminine: "закончила", pastNeuter: "закончило", pastPlural: "закончили",
            present: ["ya": "закончу", "ty": "закончишь", "on": "закончит", "my": "закончим", "vy": "закончите", "oni": "закончат"],
            imperativeInformal: "закончи", imperativeFormal: "закончите")),

    Word(id: 54, russian: "продолжать", transliteration: "praдalzhAt", translation: "to continue",
         partOfSpeech: "verb", gender: nil,
         exampleRussian: "Продолжай, пожалуйста.", exampleTranslation: "Please continue.",
         verbDetails: VerbDetails(aspect: "imperfective", aspectPair: "продолжить",
            pastMasculine: "продолжал", pastFeminine: "продолжала", pastNeuter: "продолжало", pastPlural: "продолжали",
            present: ["ya": "продолжаю", "ty": "продолжаешь", "on": "продолжает", "my": "продолжаем", "vy": "продолжаете", "oni": "продолжают"],
            imperativeInformal: "продолжай", imperativeFormal: "продолжайте")),

    Word(id: 55, russian: "помогать", transliteration: "pamagAt", translation: "to help",
         partOfSpeech: "verb", gender: nil,
         exampleRussian: "Я помогаю маме.", exampleTranslation: "I help my mom.",
         verbDetails: VerbDetails(aspect: "imperfective", aspectPair: "помочь",
            pastMasculine: "помогал", pastFeminine: "помогала", pastNeuter: "помогало", pastPlural: "помогали",
            present: ["ya": "помогаю", "ty": "помогаешь", "on": "помогает", "my": "помогаем", "vy": "помогаете", "oni": "помогают"],
            imperativeInformal: "помогай", imperativeFormal: "помогайте")),

    Word(id: 56, russian: "помочь", transliteration: "pamOch", translation: "to help (once)",
         partOfSpeech: "verb", gender: nil,
         exampleRussian: "Помоги мне, пожалуйста.", exampleTranslation: "Help me, please.",
         verbDetails: VerbDetails(aspect: "perfective", aspectPair: "помогать",
            pastMasculine: "помог", pastFeminine: "помогла", pastNeuter: "помогло", pastPlural: "помогли",
            present: ["ya": "помогу", "ty": "поможешь", "on": "поможет", "my": "поможем", "vy": "поможете", "oni": "помогут"],
            imperativeInformal: "помоги", imperativeFormal: "помогите")),

    Word(id: 57, russian: "слушать", transliteration: "slUshat", translation: "to listen",
         partOfSpeech: "verb", gender: nil,
         exampleRussian: "Я слушаю музыку.", exampleTranslation: "I'm listening to music.",
         verbDetails: VerbDetails(aspect: "imperfective", aspectPair: "послушать",
            pastMasculine: "слушал", pastFeminine: "слушала", pastNeuter: "слушало", pastPlural: "слушали",
            present: ["ya": "слушаю", "ty": "слушаешь", "on": "слушает", "my": "слушаем", "vy": "слушаете", "oni": "слушают"],
            imperativeInformal: "слушай", imperativeFormal: "слушайте")),

    Word(id: 58, russian: "играть", transliteration: "igrAt", translation: "to play",
         partOfSpeech: "verb", gender: nil,
         exampleRussian: "Дети играют во дворе.", exampleTranslation: "The kids are playing outside.",
         verbDetails: VerbDetails(aspect: "imperfective", aspectPair: "сыграть",
            pastMasculine: "играл", pastFeminine: "играла", pastNeuter: "играло", pastPlural: "играли",
            present: ["ya": "играю", "ty": "играешь", "on": "играет", "my": "играем", "vy": "играете", "oni": "играют"],
            imperativeInformal: "играй", imperativeFormal: "играйте")),

    Word(id: 59, russian: "учить", transliteration: "uchIt", translation: "to teach / learn (memorize)",
         partOfSpeech: "verb", gender: nil,
         exampleRussian: "Я учу новые слова.", exampleTranslation: "I'm learning new words.",
         verbDetails: VerbDetails(aspect: "imperfective", aspectPair: "выучить",
            pastMasculine: "учил", pastFeminine: "учила", pastNeuter: "учило", pastPlural: "учили",
            present: ["ya": "учу", "ty": "учишь", "on": "учит", "my": "учим", "vy": "учите", "oni": "учат"],
            imperativeInformal: "учи", imperativeFormal: "учите")),

    Word(id: 60, russian: "учиться", transliteration: "uchItsa", translation: "to study / be a student",
         partOfSpeech: "verb", gender: nil,
         exampleRussian: "Я учусь в университете.", exampleTranslation: "I study at university.",
         verbDetails: VerbDetails(aspect: "imperfective", aspectPair: "научиться",
            pastMasculine: "учился", pastFeminine: "училась", pastNeuter: "училось", pastPlural: "учились",
            present: ["ya": "учусь", "ty": "учишься", "on": "учится", "my": "учимся", "vy": "учитесь", "oni": "учатся"],
            imperativeInformal: "учись", imperativeFormal: "учитесь")),

    Word(id: 61, russian: "изучать", transliteration: "izuchAt", translation: "to study (a subject)",
         partOfSpeech: "verb", gender: nil,
         exampleRussian: "Я изучаю русский язык.", exampleTranslation: "I am studying Russian.",
         verbDetails: VerbDetails(aspect: "imperfective", aspectPair: "изучить",
            pastMasculine: "изучал", pastFeminine: "изучала", pastNeuter: "изучало", pastPlural: "изучали",
            present: ["ya": "изучаю", "ty": "изучаешь", "on": "изучает", "my": "изучаем", "vy": "изучаете", "oni": "изучают"],
            imperativeInformal: "изучай", imperativeFormal: "изучайте")),

    Word(id: 62, russian: "покупать", transliteration: "pakupAt", translation: "to buy",
         partOfSpeech: "verb", gender: nil,
         exampleRussian: "Я покупаю хлеб.", exampleTranslation: "I'm buying bread.",
         verbDetails: VerbDetails(aspect: "imperfective", aspectPair: "купить",
            pastMasculine: "покупал", pastFeminine: "покупала", pastNeuter: "покупало", pastPlural: "покупали",
            present: ["ya": "покупаю", "ty": "покупаешь", "on": "покупает", "my": "покупаем", "vy": "покупаете", "oni": "покупают"],
            imperativeInformal: "покупай", imperativeFormal: "покупайте")),

    Word(id: 63, russian: "купить", transliteration: "kupIt", translation: "to buy (once)",
         partOfSpeech: "verb", gender: nil,
         exampleRussian: "Я купил новую машину.", exampleTranslation: "I bought a new car.",
         verbDetails: VerbDetails(aspect: "perfective", aspectPair: "покупать",
            pastMasculine: "купил", pastFeminine: "купила", pastNeuter: "купило", pastPlural: "купили",
            present: ["ya": "куплю", "ty": "купишь", "on": "купит", "my": "купим", "vy": "купите", "oni": "купят"],
            imperativeInformal: "купи", imperativeFormal: "купите")),

    Word(id: 64, russian: "продавать", transliteration: "pradavAt", translation: "to sell",
         partOfSpeech: "verb", gender: nil,
         exampleRussian: "Они продают дом.", exampleTranslation: "They are selling the house.",
         verbDetails: VerbDetails(aspect: "imperfective", aspectPair: "продать",
            pastMasculine: "продавал", pastFeminine: "продавала", pastNeuter: "продавало", pastPlural: "продавали",
            present: ["ya": "продаю", "ty": "продаёшь", "on": "продаёт", "my": "продаём", "vy": "продаёте", "oni": "продают"],
            imperativeInformal: "продавай", imperativeFormal: "продавайте")),

    Word(id: 65, russian: "открывать", transliteration: "atkryvAt", translation: "to open",
         partOfSpeech: "verb", gender: nil,
         exampleRussian: "Я открываю окно.", exampleTranslation: "I'm opening the window.",
         verbDetails: VerbDetails(aspect: "imperfective", aspectPair: "открыть",
            pastMasculine: "открывал", pastFeminine: "открывала", pastNeuter: "открывало", pastPlural: "открывали",
            present: ["ya": "открываю", "ty": "открываешь", "on": "открывает", "my": "открываем", "vy": "открываете", "oni": "открывают"],
            imperativeInformal: "открывай", imperativeFormal: "открывайте")),

    Word(id: 66, russian: "открыть", transliteration: "atkrYt", translation: "to open (once)",
         partOfSpeech: "verb", gender: nil,
         exampleRussian: "Открой дверь, пожалуйста.", exampleTranslation: "Open the door, please.",
         verbDetails: VerbDetails(aspect: "perfective", aspectPair: "открывать",
            pastMasculine: "открыл", pastFeminine: "открыла", pastNeuter: "открыло", pastPlural: "открыли",
            present: ["ya": "открою", "ty": "откроешь", "on": "откроет", "my": "откроем", "vy": "откроете", "oni": "откроют"],
            imperativeInformal: "открой", imperativeFormal: "откройте")),

    Word(id: 67, russian: "закрывать", transliteration: "zakryvAt", translation: "to close",
         partOfSpeech: "verb", gender: nil,
         exampleRussian: "Я закрываю окно.", exampleTranslation: "I'm closing the window.",
         verbDetails: VerbDetails(aspect: "imperfective", aspectPair: "закрыть",
            pastMasculine: "закрывал", pastFeminine: "закрывала", pastNeuter: "закрывало", pastPlural: "закрывали",
            present: ["ya": "закрываю", "ty": "закрываешь", "on": "закрывает", "my": "закрываем", "vy": "закрываете", "oni": "закрывают"],
            imperativeInformal: "закрывай", imperativeFormal: "закрывайте")),

    Word(id: 68, russian: "закрыть", transliteration: "zakrYt", translation: "to close (once)",
         partOfSpeech: "verb", gender: nil,
         exampleRussian: "Закрой дверь.", exampleTranslation: "Close the door.",
         verbDetails: VerbDetails(aspect: "perfective", aspectPair: "закрывать",
            pastMasculine: "закрыл", pastFeminine: "закрыла", pastNeuter: "закрыло", pastPlural: "закрыли",
            present: ["ya": "закрою", "ty": "закроешь", "on": "закроет", "my": "закроем", "vy": "закроете", "oni": "закроют"],
            imperativeInformal: "закрой", imperativeFormal: "закройте")),

    Word(id: 69, russian: "находить", transliteration: "nakhadIt", translation: "to find",
         partOfSpeech: "verb", gender: nil,
         exampleRussian: "Я нахожу это интересным.", exampleTranslation: "I find it interesting.",
         verbDetails: VerbDetails(aspect: "imperfective", aspectPair: "найти",
            pastMasculine: "находил", pastFeminine: "находила", pastNeuter: "находило", pastPlural: "находили",
            present: ["ya": "нахожу", "ty": "находишь", "on": "находит", "my": "находим", "vy": "находите", "oni": "находят"],
            imperativeInformal: "находи", imperativeFormal: "находите")),

    Word(id: 70, russian: "найти", transliteration: "naytI", translation: "to find (once)",
         partOfSpeech: "verb", gender: nil,
         exampleRussian: "Я нашёл ключи.", exampleTranslation: "I found the keys.",
         verbDetails: VerbDetails(aspect: "perfective", aspectPair: "находить",
            pastMasculine: "нашёл", pastFeminine: "нашла", pastNeuter: "нашло", pastPlural: "нашли",
            present: ["ya": "найду", "ty": "найдёшь", "on": "найдёт", "my": "найдём", "vy": "найдёте", "oni": "найдут"],
            imperativeInformal: "найди", imperativeFormal: "найдите")),

    Word(id: 71, russian: "терять", transliteration: "teRYAt", translation: "to lose",
         partOfSpeech: "verb", gender: nil,
         exampleRussian: "Я теряю терпение.", exampleTranslation: "I'm losing patience.",
         verbDetails: VerbDetails(aspect: "imperfective", aspectPair: "потерять",
            pastMasculine: "терял", pastFeminine: "теряла", pastNeuter: "теряло", pastPlural: "теряли",
            present: ["ya": "теряю", "ty": "теряешь", "on": "теряет", "my": "теряем", "vy": "теряете", "oni": "теряют"],
            imperativeInformal: "теряй", imperativeFormal: "теряйте")),

    Word(id: 72, russian: "встречать", transliteration: "fstrechAt", translation: "to meet",
         partOfSpeech: "verb", gender: nil,
         exampleRussian: "Я встречаю друзей.", exampleTranslation: "I'm meeting friends.",
         verbDetails: VerbDetails(aspect: "imperfective", aspectPair: "встретить",
            pastMasculine: "встречал", pastFeminine: "встречала", pastNeuter: "встречало", pastPlural: "встречали",
            present: ["ya": "встречаю", "ty": "встречаешь", "on": "встречает", "my": "встречаем", "vy": "встречаете", "oni": "встречают"],
            imperativeInformal: "встречай", imperativeFormal: "встречайте")),

    Word(id: 73, russian: "встретить", transliteration: "fstRYEtit", translation: "to meet (once)",
         partOfSpeech: "verb", gender: nil,
         exampleRussian: "Я встретил старого друга.", exampleTranslation: "I met an old friend.",
         verbDetails: VerbDetails(aspect: "perfective", aspectPair: "встречать",
            pastMasculine: "встретил", pastFeminine: "встретила", pastNeuter: "встретило", pastPlural: "встретили",
            present: ["ya": "встречу", "ty": "встретишь", "on": "встретит", "my": "встретим", "vy": "встретите", "oni": "встретят"],
            imperativeInformal: "встреть", imperativeFormal: "встретьте")),

    Word(id: 74, russian: "звонить", transliteration: "zvanIt", translation: "to call (phone)",
         partOfSpeech: "verb", gender: nil,
         exampleRussian: "Я звоню маме.", exampleTranslation: "I'm calling my mom.",
         verbDetails: VerbDetails(aspect: "imperfective", aspectPair: "позвонить",
            pastMasculine: "звонил", pastFeminine: "звонила", pastNeuter: "звонило", pastPlural: "звонили",
            present: ["ya": "звоню", "ty": "звонишь", "on": "звонит", "my": "звоним", "vy": "звоните", "oni": "звонят"],
            imperativeInformal: "звони", imperativeFormal: "звоните")),

    Word(id: 75, russian: "просить", transliteration: "prasIt", translation: "to ask / request",
         partOfSpeech: "verb", gender: nil,
         exampleRussian: "Я прошу помощи.", exampleTranslation: "I'm asking for help.",
         verbDetails: VerbDetails(aspect: "imperfective", aspectPair: "попросить",
            pastMasculine: "просил", pastFeminine: "просила", pastNeuter: "просило", pastPlural: "просили",
            present: ["ya": "прошу", "ty": "просишь", "on": "просит", "my": "просим", "vy": "просите", "oni": "просят"],
            imperativeInformal: "проси", imperativeFormal: "просите")),

    Word(id: 76, russian: "ждать", transliteration: "zhdat", translation: "to wait",
         partOfSpeech: "verb", gender: nil,
         exampleRussian: "Я жду тебя.", exampleTranslation: "I'm waiting for you.",
         verbDetails: VerbDetails(aspect: "imperfective", aspectPair: "подождать",
            pastMasculine: "ждал", pastFeminine: "ждала", pastNeuter: "ждало", pastPlural: "ждали",
            present: ["ya": "жду", "ty": "ждёшь", "on": "ждёт", "my": "ждём", "vy": "ждёте", "oni": "ждут"],
            imperativeInformal: "жди", imperativeFormal: "ждите")),

    Word(id: 77, russian: "есть", transliteration: "yest", translation: "to eat",
         partOfSpeech: "verb", gender: nil,
         exampleRussian: "Я хочу есть.", exampleTranslation: "I want to eat.",
         verbDetails: VerbDetails(aspect: "imperfective", aspectPair: "съесть",
            pastMasculine: "ел", pastFeminine: "ела", pastNeuter: "ело", pastPlural: "ели",
            present: ["ya": "ем", "ty": "ешь", "on": "ест", "my": "едим", "vy": "едите", "oni": "едят"],
            imperativeInformal: "ешь", imperativeFormal: "ешьте")),

    Word(id: 78, russian: "пить", transliteration: "pit", translation: "to drink",
         partOfSpeech: "verb", gender: nil,
         exampleRussian: "Я пью чай.", exampleTranslation: "I'm drinking tea.",
         verbDetails: VerbDetails(aspect: "imperfective", aspectPair: "выпить",
            pastMasculine: "пил", pastFeminine: "пила", pastNeuter: "пило", pastPlural: "пили",
            present: ["ya": "пью", "ty": "пьёшь", "on": "пьёт", "my": "пьём", "vy": "пьёте", "oni": "пьют"],
            imperativeInformal: "пей", imperativeFormal: "пейте")),

    Word(id: 79, russian: "спать", transliteration: "spat", translation: "to sleep",
         partOfSpeech: "verb", gender: nil,
         exampleRussian: "Я хочу спать.", exampleTranslation: "I want to sleep.",
         verbDetails: VerbDetails(aspect: "imperfective", aspectPair: "поспать",
            pastMasculine: "спал", pastFeminine: "спала", pastNeuter: "спало", pastPlural: "спали",
            present: ["ya": "сплю", "ty": "спишь", "on": "спит", "my": "спим", "vy": "спите", "oni": "спят"],
            imperativeInformal: "спи", imperativeFormal: "спите")),

    Word(id: 80, russian: "сидеть", transliteration: "sidYEt", translation: "to sit",
         partOfSpeech: "verb", gender: nil,
         exampleRussian: "Я сижу дома.", exampleTranslation: "I'm sitting at home.",
         verbDetails: VerbDetails(aspect: "imperfective", aspectPair: "посидеть",
            pastMasculine: "сидел", pastFeminine: "сидела", pastNeuter: "сидело", pastPlural: "сидели",
            present: ["ya": "сижу", "ty": "сидишь", "on": "сидит", "my": "сидим", "vy": "сидите", "oni": "сидят"],
            imperativeInformal: "сиди", imperativeFormal: "сидите")),

    Word(id: 81, russian: "стоять", transliteration: "stayAt", translation: "to stand",
         partOfSpeech: "verb", gender: nil,
         exampleRussian: "Машина стоит на улице.", exampleTranslation: "The car is standing on the street.",
         verbDetails: VerbDetails(aspect: "imperfective", aspectPair: "постоять",
            pastMasculine: "стоял", pastFeminine: "стояла", pastNeuter: "стояло", pastPlural: "стояли",
            present: ["ya": "стою", "ty": "стоишь", "on": "стоит", "my": "стоим", "vy": "стоите", "oni": "стоят"],
            imperativeInformal: "стой", imperativeFormal: "стойте")),

    Word(id: 82, russian: "лежать", transliteration: "lyezhAt", translation: "to lie (down)",
         partOfSpeech: "verb", gender: nil,
         exampleRussian: "Книга лежит на столе.", exampleTranslation: "The book is lying on the table.",
         verbDetails: VerbDetails(aspect: "imperfective", aspectPair: "полежать",
            pastMasculine: "лежал", pastFeminine: "лежала", pastNeuter: "лежало", pastPlural: "лежали",
            present: ["ya": "лежу", "ty": "лежишь", "on": "лежит", "my": "лежим", "vy": "лежите", "oni": "лежат"],
            imperativeInformal: "лежи", imperativeFormal: "лежите")),

    Word(id: 83, russian: "ехать", transliteration: "Yekhat", translation: "to go (by vehicle)",
         partOfSpeech: "verb", gender: nil,
         exampleRussian: "Мы едем в Москву.", exampleTranslation: "We are going to Moscow.",
         verbDetails: VerbDetails(aspect: "imperfective", aspectPair: "поехать",
            pastMasculine: "ехал", pastFeminine: "ехала", pastNeuter: "ехало", pastPlural: "ехали",
            present: ["ya": "еду", "ty": "едешь", "on": "едет", "my": "едем", "vy": "едете", "oni": "едут"],
            imperativeInformal: "поезжай", imperativeFormal: "поезжайте")),

    Word(id: 84, russian: "лететь", transliteration: "lyetYEt", translation: "to fly",
         partOfSpeech: "verb", gender: nil,
         exampleRussian: "Самолёт летит высоко.", exampleTranslation: "The plane is flying high.",
         verbDetails: VerbDetails(aspect: "imperfective", aspectPair: "полететь",
            pastMasculine: "летел", pastFeminine: "летела", pastNeuter: "летело", pastPlural: "летели",
            present: ["ya": "лечу", "ty": "летишь", "on": "летит", "my": "летим", "vy": "летите", "oni": "летят"],
            imperativeInformal: "лети", imperativeFormal: "летите")),

    Word(id: 85, russian: "бежать", transliteration: "byezhAt", translation: "to run",
         partOfSpeech: "verb", gender: nil,
         exampleRussian: "Собака бежит быстро.", exampleTranslation: "The dog is running fast.",
         verbDetails: VerbDetails(aspect: "imperfective", aspectPair: "побежать",
            pastMasculine: "бежал", pastFeminine: "бежала", pastNeuter: "бежало", pastPlural: "бежали",
            present: ["ya": "бегу", "ty": "бежишь", "on": "бежит", "my": "бежим", "vy": "бежите", "oni": "бегут"],
            imperativeInformal: "беги", imperativeFormal: "бегите")),

    Word(id: 86, russian: "приезжать", transliteration: "priyezhAt", translation: "to arrive (by vehicle)",
         partOfSpeech: "verb", gender: nil,
         exampleRussian: "Гости приезжают завтра.", exampleTranslation: "The guests arrive tomorrow.",
         verbDetails: VerbDetails(aspect: "imperfective", aspectPair: "приехать",
            pastMasculine: "приезжал", pastFeminine: "приезжала", pastNeuter: "приезжало", pastPlural: "приезжали",
            present: ["ya": "приезжаю", "ty": "приезжаешь", "on": "приезжает", "my": "приезжаем", "vy": "приезжаете", "oni": "приезжают"],
            imperativeInformal: "приезжай", imperativeFormal: "приезжайте")),

    Word(id: 87, russian: "уезжать", transliteration: "uyezhAt", translation: "to leave (by vehicle)",
         partOfSpeech: "verb", gender: nil,
         exampleRussian: "Я уезжаю завтра.", exampleTranslation: "I'm leaving tomorrow.",
         verbDetails: VerbDetails(aspect: "imperfective", aspectPair: "уехать",
            pastMasculine: "уезжал", pastFeminine: "уезжала", pastNeuter: "уезжало", pastPlural: "уезжали",
            present: ["ya": "уезжаю", "ty": "уезжаешь", "on": "уезжает", "my": "уезжаем", "vy": "уезжаете", "oni": "уезжают"],
            imperativeInformal: "уезжай", imperativeFormal: "уезжайте")),

    Word(id: 88, russian: "приходить", transliteration: "prikhadIt", translation: "to come",
         partOfSpeech: "verb", gender: nil,
         exampleRussian: "Он приходит домой поздно.", exampleTranslation: "He comes home late.",
         verbDetails: VerbDetails(aspect: "imperfective", aspectPair: "прийти",
            pastMasculine: "приходил", pastFeminine: "приходила", pastNeuter: "приходило", pastPlural: "приходили",
            present: ["ya": "прихожу", "ty": "приходишь", "on": "приходит", "my": "приходим", "vy": "приходите", "oni": "приходят"],
            imperativeInformal: "приходи", imperativeFormal: "приходите")),

    Word(id: 89, russian: "уходить", transliteration: "ukhadIt", translation: "to leave",
         partOfSpeech: "verb", gender: nil,
         exampleRussian: "Я ухожу на работу.", exampleTranslation: "I'm leaving for work.",
         verbDetails: VerbDetails(aspect: "imperfective", aspectPair: "уйти",
            pastMasculine: "уходил", pastFeminine: "уходила", pastNeuter: "уходило", pastPlural: "уходили",
            present: ["ya": "ухожу", "ty": "уходишь", "on": "уходит", "my": "уходим", "vy": "уходите", "oni": "уходят"],
            imperativeInformal: "уходи", imperativeFormal: "уходите")),

    Word(id: 90, russian: "входить", transliteration: "vkhadIt", translation: "to enter",
         partOfSpeech: "verb", gender: nil,
         exampleRussian: "Он входит в комнату.", exampleTranslation: "He is entering the room.",
         verbDetails: VerbDetails(aspect: "imperfective", aspectPair: "войти",
            pastMasculine: "входил", pastFeminine: "входила", pastNeuter: "входило", pastPlural: "входили",
            present: ["ya": "вхожу", "ty": "входишь", "on": "входит", "my": "входим", "vy": "входите", "oni": "входят"],
            imperativeInformal: "входи", imperativeFormal: "входите")),

    Word(id: 91, russian: "выходить", transliteration: "vykhadIt", translation: "to exit",
         partOfSpeech: "verb", gender: nil,
         exampleRussian: "Мы выходим на следующей станции.", exampleTranslation: "We're getting off at the next station.",
         verbDetails: VerbDetails(aspect: "imperfective", aspectPair: "выйти",
            pastMasculine: "выходил", pastFeminine: "выходила", pastNeuter: "выходило", pastPlural: "выходили",
            present: ["ya": "выхожу", "ty": "выходишь", "on": "выходит", "my": "выходим", "vy": "выходите", "oni": "выходят"],
            imperativeInformal: "выходи", imperativeFormal: "выходите")),

    Word(id: 92, russian: "заходить", transliteration: "zakhadIt", translation: "to stop by",
         partOfSpeech: "verb", gender: nil,
         exampleRussian: "Заходи в гости!", exampleTranslation: "Come visit!",
         verbDetails: VerbDetails(aspect: "imperfective", aspectPair: "зайти",
            pastMasculine: "заходил", pastFeminine: "заходила", pastNeuter: "заходило", pastPlural: "заходили",
            present: ["ya": "захожу", "ty": "заходишь", "on": "заходит", "my": "заходим", "vy": "заходите", "oni": "заходят"],
            imperativeInformal: "заходи", imperativeFormal: "заходите")),

    Word(id: 93, russian: "нравиться", transliteration: "nrAvitsa", translation: "to be pleasing (to like)",
         partOfSpeech: "verb", gender: nil,
         exampleRussian: "Мне нравится эта песня.", exampleTranslation: "I like this song.",
         verbDetails: VerbDetails(aspect: "imperfective", aspectPair: "понравиться",
            pastMasculine: "нравился", pastFeminine: "нравилась", pastNeuter: "нравилось", pastPlural: "нравились",
            present: ["ya": "нравлюсь", "ty": "нравишься", "on": "нравится", "my": "нравимся", "vy": "нравитесь", "oni": "нравятся"],
            imperativeInformal: nil, imperativeFormal: nil)),

    Word(id: 94, russian: "интересоваться", transliteration: "interesavAtsa", translation: "to be interested in",
         partOfSpeech: "verb", gender: nil,
         exampleRussian: "Я интересуюсь музыкой.", exampleTranslation: "I'm interested in music.",
         verbDetails: VerbDetails(aspect: "imperfective", aspectPair: "заинтересоваться",
            pastMasculine: "интересовался", pastFeminine: "интересовалась", pastNeuter: "интересовалось", pastPlural: "интересовались",
            present: ["ya": "интересуюсь", "ty": "интересуешься", "on": "интересуется", "my": "интересуемся", "vy": "интересуетесь", "oni": "интересуются"],
            imperativeInformal: nil, imperativeFormal: nil)),
]

// Picks a word based on how many days since a fixed start date,
// so the "word of the day" changes automatically every day.
func wordOfTheDay(from list: [Word], startDate: Date = Date(timeIntervalSince1970: 1735689600)) -> Word {
    let daysSinceStart = Calendar.current.dateComponents([.day], from: startDate, to: Date()).day ?? 0
    let index = daysSinceStart % list.count
    return list[index]
}

