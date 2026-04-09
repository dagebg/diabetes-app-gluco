import Foundation

// Represents the person using the app.
// Set during onboarding, lives in AppState for the session.
struct User {
    let id: UUID
    var name: String
    var diagnosisDuration: DiagnosisDuration
    var gender: Gender?
    var age: Int?

    // Personalized greeting used throughout the app
    var firstName: String {
        name.components(separatedBy: " ").first ?? name
    }
}

enum Gender: String, CaseIterable, Identifiable {
    case male    = "Männlich"
    case female  = "Weiblich"
    case diverse = "Divers"

    var id: String { rawValue }

    var emoji: String {
        switch self {
        case .male:    return "♂️"
        case .female:  return "♀️"
        case .diverse: return "⚧️"
        }
    }
}

// How long the user has had T1D — drives tone and content hints
enum DiagnosisDuration: String, CaseIterable, Identifiable {
    case justDiagnosed   = "Gerade diagnostiziert"
    case fewMonths       = "Vor einigen Monaten"
    case oneToThreeYears = "Vor 1–3 Jahren"
    case moreThanThree   = "Mehr als 3 Jahre"

    var id: String { rawValue }

    // A short empathetic subtitle shown after selection
    var supportMessage: String {
        switch self {
        case .justDiagnosed:
            return "Willkommen. Das ist viel auf einmal – wir gehen es Schritt für Schritt an."
        case .fewMonths:
            return "Du hast schon so viel erreicht. Lass uns daran weiterarbeiten."
        case .oneToThreeYears:
            return "Du kennst die Grundlagen. Lass uns ein bisschen tiefer gehen."
        case .moreThanThree:
            return "Du hast Erfahrung. Hoffentlich können wir dir noch etwas Neues beibringen."
        }
    }
}
