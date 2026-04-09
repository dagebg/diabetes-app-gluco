import Foundation

// A single diary entry written by the user.
// Intentionally lifestyle/feelings only — no blood sugar, no insulin fields.
struct JournalEntry: Identifiable {
    let id: UUID
    var date: Date
    var mood: Mood
    var note: String           // Free-text: what's on their mind today
    var prompt: DayPrompt?     // Optional pre-written prompt they responded to
}

// Simple emoji-based mood — approachable and non-clinical
enum Mood: String, CaseIterable, Identifiable {
    case great    = "Super"
    case good     = "Gut"
    case okay     = "Okay"
    case tired    = "Müde"
    case stressed = "Gestresst"

    var id: String { rawValue }

    var emoji: String {
        switch self {
        case .great:    return "😄"
        case .good:     return "🙂"
        case .okay:     return "😐"
        case .tired:    return "😴"
        case .stressed: return "😤"
        }
    }

    // Short affirming label shown below the emoji picker
    var label: String { rawValue }
}

// Optional daily reflection prompts to help users who don't know what to write
enum DayPrompt: String, CaseIterable, Identifiable {
    case oneGoodThing  = "Was war heute eine positive Sache?"
    case challenge     = "War heute etwas schwierig? Das darf gesagt werden."
    case learning      = "Hast du heute etwas Neues über dich gelernt?"
    case gratitude     = "Wofür bist du gerade dankbar?"

    var id: String { rawValue }
}
