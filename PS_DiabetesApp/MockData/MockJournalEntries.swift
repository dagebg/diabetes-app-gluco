import Foundation

enum MockJournalEntries {

    // Pre-populated entries so the journal doesn't look empty on first launch
    static let all: [JournalEntry] = [

        JournalEntry(
            id: UUID(),
            date: Date().addingTimeInterval(-86400 * 6), // 6 days ago
            mood: .good,
            note: "Heute Morgen vor dem Frühstück einen wunderschönen Spaziergang gemacht. Fühlte mich ruhig und klar. Das Wetter hat geholfen.",
            prompt: nil
        ),

        JournalEntry(
            id: UUID(),
            date: Date().addingTimeInterval(-86400 * 5),
            mood: .okay,
            note: "Ein etwas schwieriger Nachmittag – fühlte mich nicht richtig, konnte aber nicht genau sagen warum. Habe einen Snack gegessen, mich ausgeruht und mich abends besser gefühlt.",
            prompt: .challenge
        ),

        JournalEntry(
            id: UUID(),
            date: Date().addingTimeInterval(-86400 * 4),
            mood: .great,
            note: "War zum Geburtstagsabendessen mit Freunden. Habe alles gut im Griff gehabt und einfach Spaß gehabt. Momente wie diese erinnern mich daran, dass T1D nicht alles bestimmen muss.",
            prompt: .oneGoodThing
        ),

        JournalEntry(
            id: UUID(),
            date: Date().addingTimeInterval(-86400 * 3),
            mood: .tired,
            note: "Habe nicht gut geschlafen. Bin ein paarmal aufgewacht. Fühle mich heute träge. Nehme es ruhig.",
            prompt: nil
        ),

        JournalEntry(
            id: UUID(),
            date: Date().addingTimeInterval(-86400 * 2),
            mood: .stressed,
            note: "Große Präsentation an der Uni heute. War den größten Teil des Morgens nervös. Es lief am Ende gut, aber danach war ich erschöpft.",
            prompt: .challenge
        ),

        JournalEntry(
            id: UUID(),
            date: Date().addingTimeInterval(-86400 * 1),
            mood: .good,
            note: "Das Linsen-Suppen-Rezept aus der App ausprobiert. Es war wirklich gut. Hat sich gut angefühlt, etwas von Grund auf zu kochen.",
            prompt: .gratitude
        ),

        JournalEntry(
            id: UUID(),
            date: Date(),
            mood: .good,
            note: "Den Tag positiv beginnen. Etwas Neues über Kohlenhydrate in der App gelernt. Kleine Erfolge.",
            prompt: .learning
        )
    ]
}
