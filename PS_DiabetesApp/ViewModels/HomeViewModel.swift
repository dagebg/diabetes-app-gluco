import Foundation
import Combine

final class HomeViewModel: ObservableObject {

    // MARK: - Greeting

    /// Time-aware greeting — changes based on hour of day
    var timeGreeting: String {
        let hour = Calendar.current.component(.hour, from: Date())
        switch hour {
        case 5..<12:  return "Guten Morgen"
        case 12..<17: return "Guten Tag"
        case 17..<21: return "Guten Abend"
        default:      return "Hey"
        }
    }

    // MARK: - Tip of the Day
    // Rotates daily by day-of-year index — no backend needed.

    private let tips: [String] = [
        "T1D zu managen ist eine Fähigkeit, kein Test. Jeder Tag ist eine Chance zu lernen – nicht bewertet zu werden.",
        "Stress kann deinen Blutzucker genauso beeinflussen wie Essen. Das ist nicht deine Schuld – das ist Biologie.",
        "Du musst deine Erkrankung nicht jedem erklären. Teile nur, was sich richtig anfühlt.",
        "Ein schwieriger T1D-Tag macht nicht all die Tage zunichte, an denen du es gut gemeistert hast.",
        "Gesund essen bedeutet nicht perfekt essen. Kleine, beständige Entscheidungen summieren sich.",
        "Ruhe ist ein Teil des Gesundheitsmanagements – keine Belohnung, die du dir erst verdienen musst.",
        "Dein Behandlungsteam ist da, um mit dir zu arbeiten, nicht um dich zu beurteilen. Sei ehrlich mit ihnen.",
        "Dich mit anderen T1D-Betroffenen zu vergleichen kann irreführend sein. Jeder Körper ist anders.",
        "Es ist okay, frustriert zu sein. Mit einer chronischen Erkrankung zu leben ist wirklich schwer.",
        "Aktiv zu bleiben ist eines der besten Dinge für dein Wohlbefinden – finde, was dir Freude macht.",
        "Es gibt keinen 'perfekten' T1D-Tag. Fortschritt schlägt Perfektion jedes Mal.",
        "Vorausplanen macht einen großen Unterschied – nicht nur medizinisch, sondern auch mental.",
        "Kleine Erfolge zu feiern ist wichtig. Hast du heute etwas Schwieriges gemeistert? Das zählt.",
        "Du bist nicht deine Blutzuckerwerte. Du bist ein ganzer Mensch.",
        "Die T1D-Community ist eine der unterstützendsten da draußen – du bist damit nicht allein."
    ]

    var tipOfTheDay: String {
        let dayOfYear = Calendar.current.ordinality(of: .day, in: .year, for: Date()) ?? 1
        return tips[(dayOfYear - 1) % tips.count]
    }
}
