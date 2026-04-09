import Foundation
import Combine

final class LearnViewModel: ObservableObject {

    /// Filters the lesson list to a specific category.
    /// nil = show all categories.
    @Published var selectedCategory: LessonCategory? = nil

    func lessons(from all: [Lesson]) -> [Lesson] {
        guard let category = selectedCategory else { return all }
        return all.filter { $0.category == category }
    }

    func lessonsFor(category: LessonCategory, from all: [Lesson]) -> [Lesson] {
        all.filter { $0.category == category }
    }

    func completionCount(for category: LessonCategory,
                         from all: [Lesson],
                         completedIDs: Set<UUID>) -> Int {
        lessonsFor(category: category, from: all)
            .filter { completedIDs.contains($0.id) }
            .count
    }
}
