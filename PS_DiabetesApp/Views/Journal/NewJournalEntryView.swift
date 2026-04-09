import SwiftUI

/// Bottom sheet for writing a new journal entry.
/// Fields: mood (required), prompt (optional), free-text note (required).
struct NewJournalEntryView: View {
    @ObservedObject var vm: JournalViewModel
    var isEditing: Bool = false
    let onSave: (JournalEntry) -> Void

    @Environment(\.dismiss) private var dismiss
    @FocusState private var noteFocused: Bool

    var body: some View {
        NavigationStack {
            ScrollView(showsIndicators: false) {
                VStack(alignment: .leading, spacing: 28) {

                    // Mood section
                    VStack(alignment: .leading, spacing: 12) {
                        sectionLabel("Wie fühlst du dich?", required: true)
                        MoodPickerView(selectedMood: $vm.draftMood)
                    }

                    Divider()

                    // Optional prompt
                    VStack(alignment: .leading, spacing: 12) {
                        sectionLabel("Brauchst du eine Frage? (optional)", required: false)
                        promptGrid
                    }

                    Divider()

                    // Free text note
                    VStack(alignment: .leading, spacing: 10) {
                        sectionLabel(
                            vm.draftPrompt != nil ? vm.draftPrompt!.rawValue : "Was beschäftigt dich heute?",
                            required: true
                        )

                        ZStack(alignment: .topLeading) {
                            // Placeholder
                            if vm.draftNote.isEmpty {
                                Text("Schreib einfach drauflos. Kein Urteil hier.")
                                    .font(.appBody)
                                    .foregroundColor(.appTextSecondary.opacity(0.6))
                                    .padding(.top, 8)
                                    .padding(.leading, 4)
                                    .allowsHitTesting(false)
                            }

                            TextEditor(text: $vm.draftNote)
                                .font(.appBody)
                                .foregroundColor(.appText)
                                .focused($noteFocused)
                                .frame(minHeight: 120)
                                .scrollContentBackground(.hidden)
                        }
                        .padding(14)
                        .background(Color.appCard)
                        .clipShape(RoundedRectangle(cornerRadius: 14))
                        .overlay(
                            RoundedRectangle(cornerRadius: 14)
                                .stroke(noteFocused ? Color.appPurple : Color.appDivider, lineWidth: 1.5)
                        )
                        .animation(.easeInOut(duration: 0.2), value: noteFocused)
                    }

                    Spacer().frame(height: 8)
                }
                .padding(.horizontal, 20)
                .padding(.top, 8)
                .padding(.bottom, 24)
            }
            .background(Color.appBackground.ignoresSafeArea())
            .navigationTitle(isEditing ? "Eintrag bearbeiten" : "Neuer Eintrag")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Abbrechen") { dismiss() }
                        .foregroundColor(.appTextSecondary)
                }

                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(isEditing ? "Aktualisieren" : "Speichern") {
                        if let entry = vm.buildEntry() { onSave(entry) }
                    }
                    .font(.appHeadline)
                    .foregroundColor(vm.canSaveEntry ? .appPurple : .appTextSecondary)
                    .disabled(!vm.canSaveEntry)
                }
            }
        }
    }

    // MARK: - Section Label

    private func sectionLabel(_ text: String, required: Bool) -> some View {
        HStack(spacing: 4) {
            Text(text)
                .font(.appHeadline)
                .foregroundColor(.appText)
            if required {
                Text("*")
                    .foregroundColor(.appPrimary)
            }
        }
    }

    // MARK: - Prompt Grid

    private var promptGrid: some View {
        VStack(spacing: 8) {
            ForEach(DayPrompt.allCases) { prompt in
                promptButton(prompt)
            }
        }
    }

    private func promptButton(_ prompt: DayPrompt) -> some View {
        let isSelected = vm.draftPrompt == prompt

        return Button {
            withAnimation(.spring(response: 0.3, dampingFraction: 0.7)) {
                vm.draftPrompt = isSelected ? nil : prompt
            }
        } label: {
            HStack {
                Text(prompt.rawValue)
                    .font(.appBody)
                    .foregroundColor(isSelected ? .appPurple : .appText)
                    .multilineTextAlignment(.leading)
                    .fixedSize(horizontal: false, vertical: true)
                Spacer()
                if isSelected {
                    Image(systemName: "checkmark.circle.fill")
                        .foregroundColor(.appPurple)
                }
            }
            .padding(14)
            .background(
                RoundedRectangle(cornerRadius: 12)
                    .fill(isSelected ? Color.appPurple.opacity(0.09) : Color.appCard)
            )
            .overlay(
                RoundedRectangle(cornerRadius: 12)
                    .stroke(isSelected ? Color.appPurple : Color.appDivider, lineWidth: 1.5)
            )
        }
        .animation(.spring(response: 0.3, dampingFraction: 0.7), value: isSelected)
    }
}
