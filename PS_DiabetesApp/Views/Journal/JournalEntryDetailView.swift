import SwiftUI

struct JournalEntryDetailView: View {
    let entryID: UUID

    @EnvironmentObject var appState: AppState
    @Environment(\.dismiss) private var dismiss

    // Each detail view owns its own edit VM so multiple can coexist on the stack
    @StateObject private var editVM = JournalViewModel()
    @State private var showDeleteAlert = false

    private var entry: JournalEntry? {
        appState.journalEntries.first { $0.id == entryID }
    }

    var body: some View {
        Group {
            if let entry {
                content(entry)
            } else {
                // Entry was deleted — auto-dismiss
                Color.clear.onAppear { dismiss() }
            }
        }
        .background(Color.appBackground.ignoresSafeArea())
    }

    // MARK: - Main Content

    @ViewBuilder
    private func content(_ entry: JournalEntry) -> some View {
        ScrollView(showsIndicators: false) {
            VStack(alignment: .leading, spacing: 24) {

                // Mood hero card
                moodHero(entry)

                // Prompt badge (if any)
                if let prompt = entry.prompt {
                    promptBadge(prompt)
                }

                // Full note
                Text(entry.note)
                    .font(.appBody)
                    .foregroundColor(.appText)
                    .lineSpacing(7)
                    .fixedSize(horizontal: false, vertical: true)

                Spacer().frame(height: 16)

                // Delete button
                Button {
                    showDeleteAlert = true
                } label: {
                    Label("Eintrag löschen", systemImage: "trash")
                        .font(.appBody)
                        .foregroundColor(.red)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 14)
                        .background(Color.red.opacity(0.08))
                        .clipShape(RoundedRectangle(cornerRadius: 14))
                }

                Spacer().frame(height: 8)
            }
            .padding(.horizontal, 20)
            .padding(.top, 20)
            .padding(.bottom, 32)
        }
        .navigationTitle(entry.date.journalDateString)
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button("Bearbeiten") {
                    editVM.loadDraftForEdit(entry)
                    editVM.isShowingEditEntry = true
                }
                .foregroundColor(.appPurple)
            }
        }
        .sheet(isPresented: $editVM.isShowingEditEntry, onDismiss: editVM.resetDraft) {
            NewJournalEntryView(vm: editVM, isEditing: true) { _ in
                let updated = JournalEntry(
                    id: entry.id,
                    date: entry.date,
                    mood: editVM.draftMood ?? entry.mood,
                    note: editVM.draftNote.trimmingCharacters(in: .whitespaces),
                    prompt: editVM.draftPrompt
                )
                appState.updateJournalEntry(updated)
                editVM.isShowingEditEntry = false
            }
        }
        .alert("Eintrag löschen?", isPresented: $showDeleteAlert) {
            Button("Löschen", role: .destructive) {
                appState.deleteJournalEntry(id: entry.id)
                dismiss()
            }
            Button("Abbrechen", role: .cancel) {}
        } message: {
            Text("Dieser Eintrag wird dauerhaft gelöscht.")
        }
    }

    // MARK: - Mood Hero

    private func moodHero(_ entry: JournalEntry) -> some View {
        HStack(spacing: 16) {
            ZStack {
                Circle()
                    .fill(Color.appPurple.opacity(0.12))
                    .frame(width: 64, height: 64)
                Text(entry.mood.emoji)
                    .font(.system(size: 32))
            }

            VStack(alignment: .leading, spacing: 4) {
                Text(entry.mood.label)
                    .font(.appTitle2)
                    .foregroundColor(.appText)
                Text(entry.date.journalDateString)
                    .font(.appCaption)
                    .foregroundColor(.appTextSecondary)
            }

            Spacer()
        }
        .padding(16)
        .background(Color.appCard)
        .clipShape(RoundedRectangle(cornerRadius: 16))
    }

    // MARK: - Prompt Badge

    private func promptBadge(_ prompt: DayPrompt) -> some View {
        HStack(spacing: 8) {
            Image(systemName: "quote.opening")
                .font(.system(size: 12, weight: .semibold))
                .foregroundColor(.appPurple)
            Text(prompt.rawValue)
                .font(.appCaption)
                .foregroundColor(.appTextSecondary)
                .fixedSize(horizontal: false, vertical: true)
        }
        .padding(12)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color.appPurple.opacity(0.07))
        .clipShape(RoundedRectangle(cornerRadius: 12))
        .overlay(
            RoundedRectangle(cornerRadius: 12)
                .stroke(Color.appPurple.opacity(0.2), lineWidth: 1)
        )
    }
}

// MARK: - Date Formatting

private extension Date {
    var journalDateString: String {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "de_DE")
        let cal = Calendar.current
        if cal.isDateInToday(self)     { return "Heute" }
        if cal.isDateInYesterday(self) { return "Gestern" }
        formatter.dateFormat = "EEEE, d. MMMM yyyy"
        return formatter.string(from: self)
    }
}
