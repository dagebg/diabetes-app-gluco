import Foundation
import Combine

// Single observable object passed through the entire app via .environmentObject.
// All in-memory state — nothing persists between sessions (demo build).
final class AppState: ObservableObject {

    // MARK: - Onboarding

    @Published var hasCompletedOnboarding: Bool = false
    @Published var currentUser: User? = nil

    // MARK: - Learn

    @Published var lessons: [Lesson] = MockLessons.all
    @Published var completedLessonIDs: Set<UUID> = []
    @Published var learningMode: LearningMode = .easy

    // MARK: - Recipes

    @Published var recipes: [Recipe] = MockRecipes.all

    // MARK: - Journal

    @Published var journalEntries: [JournalEntry] = MockJournalEntries.all

    // MARK: - Streak (mock — always shows 7 for demo)

    var currentStreak: Int { 7 }

    // MARK: - Computed Helpers

    var lessonsGroupedByCategory: [LessonCategory: [Lesson]] {
        Dictionary(grouping: lessons, by: \.category)
    }

    var completedLessonsCount: Int {
        completedLessonIDs.count
    }

    var totalLessonsCount: Int {
        lessons.count
    }

    // MARK: - Actions

    func completeOnboarding(name: String, diagnosisDuration: DiagnosisDuration, gender: Gender? = nil, age: Int? = nil) {
        currentUser = User(
            id: UUID(),
            name: name,
            diagnosisDuration: diagnosisDuration,
            gender: gender,
            age: age
        )
        hasCompletedOnboarding = true
    }

    func toggleLessonCompletion(_ lessonID: UUID) {
        if completedLessonIDs.contains(lessonID) {
            completedLessonIDs.remove(lessonID)
        } else {
            completedLessonIDs.insert(lessonID)
        }
    }

    func addJournalEntry(_ entry: JournalEntry) {
        journalEntries.insert(entry, at: 0)
    }

    func deleteJournalEntry(id: UUID) {
        journalEntries.removeAll { $0.id == id }
    }

    func updateJournalEntry(_ updated: JournalEntry) {
        guard let i = journalEntries.firstIndex(where: { $0.id == updated.id }) else { return }
        journalEntries[i] = updated
    }

    func addRecipe(_ recipe: Recipe) {
        recipes.insert(recipe, at: 0)
    }

    #if DEBUG
    func resetApp() {
        hasCompletedOnboarding = false
        currentUser = nil
        completedLessonIDs = []
        journalEntries = MockJournalEntries.all
    }
    #endif

    // Sorted newest-first for the journal list view
    var sortedJournalEntries: [JournalEntry] {
        journalEntries.sorted { $0.date > $1.date }
    }
}
