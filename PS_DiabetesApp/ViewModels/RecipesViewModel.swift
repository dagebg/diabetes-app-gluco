import Foundation
import Combine

final class RecipesViewModel: ObservableObject {

    @Published var selectedTags: Set<RecipeTag> = []
    @Published var searchText: String = ""

    func toggleTag(_ tag: RecipeTag) {
        if selectedTags.contains(tag) {
            selectedTags.remove(tag)
        } else {
            selectedTags.insert(tag)
        }
    }

    func filteredRecipes(from all: [Recipe]) -> [Recipe] {
        var result = all

        // Tag filter: recipe must match at least one selected tag
        if !selectedTags.isEmpty {
            result = result.filter { recipe in
                !selectedTags.isDisjoint(with: Set(recipe.tags))
            }
        }

        // Simple text search on title and description
        let trimmed = searchText.trimmingCharacters(in: .whitespaces)
        if !trimmed.isEmpty {
            result = result.filter {
                $0.title.localizedCaseInsensitiveContains(trimmed) ||
                $0.shortDescription.localizedCaseInsensitiveContains(trimmed)
            }
        }

        return result
    }

    /// Tags that appear in at least one recipe — avoids showing empty filters
    func availableTags(from recipes: [Recipe]) -> [RecipeTag] {
        let used = Set(recipes.flatMap { $0.tags })
        return RecipeTag.allCases.filter { used.contains($0) }
    }

    // MARK: - New Recipe Draft

    @Published var isShowingNewRecipe: Bool = false

    @Published var draftTitle: String = ""
    @Published var draftEmoji: String = "🍽️"
    @Published var draftDescription: String = ""
    @Published var draftPrepTime: String = ""
    @Published var draftCookTime: String = ""
    @Published var draftServings: Int = 2
    @Published var draftTags: Set<RecipeTag> = []
    @Published var draftIngredients: [String] = [""]
    @Published var draftSteps: [String] = [""]

    var canSaveRecipe: Bool {
        !draftTitle.trimmingCharacters(in: .whitespaces).isEmpty &&
        draftIngredients.contains(where: { !$0.trimmingCharacters(in: .whitespaces).isEmpty }) &&
        draftSteps.contains(where: { !$0.trimmingCharacters(in: .whitespaces).isEmpty })
    }

    func addIngredient() { draftIngredients.append("") }
    func removeIngredient(at index: Int) {
        guard draftIngredients.count > 1 else { return }
        draftIngredients.remove(at: index)
    }

    func addStep() { draftSteps.append("") }
    func removeStep(at index: Int) {
        guard draftSteps.count > 1 else { return }
        draftSteps.remove(at: index)
    }

    func toggleDraftTag(_ tag: RecipeTag) {
        if draftTags.contains(tag) { draftTags.remove(tag) } else { draftTags.insert(tag) }
    }

    func buildRecipe() -> Recipe? {
        let title = draftTitle.trimmingCharacters(in: .whitespaces)
        guard !title.isEmpty else { return nil }
        let ingredients = draftIngredients.map { $0.trimmingCharacters(in: .whitespaces) }.filter { !$0.isEmpty }
        let steps = draftSteps.map { $0.trimmingCharacters(in: .whitespaces) }.filter { !$0.isEmpty }
        guard !ingredients.isEmpty, !steps.isEmpty else { return nil }
        return Recipe(
            id: UUID(),
            title: title,
            emoji: draftEmoji.isEmpty ? "🍽️" : draftEmoji,
            shortDescription: draftDescription.trimmingCharacters(in: .whitespaces),
            prepTime: draftPrepTime.isEmpty ? "–" : draftPrepTime,
            cookTime: draftCookTime.isEmpty ? "–" : draftCookTime,
            servings: draftServings,
            tags: Array(draftTags),
            ingredients: ingredients,
            steps: steps
        )
    }

    func resetNewRecipeDraft() {
        draftTitle = ""; draftEmoji = "🍽️"; draftDescription = ""
        draftPrepTime = ""; draftCookTime = ""; draftServings = 2
        draftTags = []; draftIngredients = [""]; draftSteps = [""]
    }
}
