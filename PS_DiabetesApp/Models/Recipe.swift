import Foundation

// A single recipe card shown in the Recipes tab.
// Intentionally has NO nutritional/carb data to avoid medical claims.
struct Recipe: Identifiable {
    let id: UUID
    let title: String
    let emoji: String
    let shortDescription: String   // 1–2 sentences shown on the card
    let prepTime: String           // e.g. "10 min"
    let cookTime: String           // e.g. "20 min"
    let servings: Int
    let tags: [RecipeTag]
    let ingredients: [String]      // Plain strings: "2 cups rolled oats"
    let steps: [String]            // Ordered instruction strings
}

// Soft categorization — avoids hard "diabetic safe" medical claims
enum RecipeTag: String, CaseIterable, Identifiable {
    case lowSugar       = "Wenig Zucker"
    case highProtein    = "Viel Protein"
    case quickAndEasy   = "Schnell & Einfach"
    case vegetarian     = "Vegetarisch"
    case snack          = "Snack"
    case breakfast      = "Frühstück"
    case lunch          = "Mittagessen"
    case dinner         = "Abendessen"

    var id: String { rawValue }
}
