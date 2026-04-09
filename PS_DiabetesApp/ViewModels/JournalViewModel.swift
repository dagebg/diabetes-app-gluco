import Foundation
import Combine

final class JournalViewModel: ObservableObject {

    @Published var isShowingNewEntry: Bool = false
    @Published var isShowingEditEntry: Bool = false

    // MARK: - New Entry Form State
    // Kept in this VM so sheet dismissal resets it cleanly.

    @Published var draftMood: Mood? = nil
    @Published var draftNote: String = ""
    @Published var draftPrompt: DayPrompt? = nil

    var canSaveEntry: Bool {
        draftMood != nil && !draftNote.trimmingCharacters(in: .whitespaces).isEmpty
    }

    func buildEntry() -> JournalEntry? {
        guard let mood = draftMood else { return nil }
        return JournalEntry(
            id: UUID(),
            date: Date(),
            mood: mood,
            note: draftNote.trimmingCharacters(in: .whitespaces),
            prompt: draftPrompt
        )
    }

    func loadDraftForEdit(_ entry: JournalEntry) {
        draftMood   = entry.mood
        draftNote   = entry.note
        draftPrompt = entry.prompt
    }

    func resetDraft() {
        draftMood   = nil
        draftNote   = ""
        draftPrompt = nil
    }

    // MARK: - Display Helpers

    func entriesGroupedByMonth(from entries: [JournalEntry]) -> [(key: String, value: [JournalEntry])] {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMMM yyyy"
        let grouped = Dictionary(grouping: entries) { formatter.string(from: $0.date) }
        // Sort by most recent month first
        return grouped
            .sorted { lhs, rhs in
                let fmt = DateFormatter()
                fmt.dateFormat = "MMMM yyyy"
                let lDate = fmt.date(from: lhs.key) ?? Date.distantPast
                let rDate = fmt.date(from: rhs.key) ?? Date.distantPast
                return lDate > rDate
            }
    }
}
