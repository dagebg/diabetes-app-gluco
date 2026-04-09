import SwiftUI

/// Lifestyle journal — entries by mood, date, and free text.
/// No medical tracking. Pure feelings and reflection.
struct JournalView: View {
    @EnvironmentObject var appState: AppState
    @StateObject private var vm = JournalViewModel()

    var body: some View {
        NavigationStack {
            ZStack(alignment: .bottomTrailing) {
                VStack(spacing: 0) {

                    // Stats strip
                    statsStrip
                        .padding(.horizontal, 20)
                        .padding(.vertical, 12)

                    Divider()

                    if appState.journalEntries.isEmpty {
                        emptyState
                    } else {
                        entriesList
                    }
                }

                // Floating add button
                addButton
                    .padding(24)
            }
            .background(Color.appBackground.ignoresSafeArea())
            .navigationTitle("Tagebuch")
            .navigationBarTitleDisplayMode(.large)
            .sheet(isPresented: $vm.isShowingNewEntry, onDismiss: vm.resetDraft) {
                NewJournalEntryView(vm: vm) { entry in
                    appState.addJournalEntry(entry)
                    vm.isShowingNewEntry = false
                }
            }
        }
    }

    // MARK: - Stats Strip

    private var statsStrip: some View {
        HStack(spacing: 24) {
            statCell(
                value: "\(appState.journalEntries.count)",
                label: "Einträge",
                icon: "book.closed.fill",
                color: .appPurple
            )
            Divider().frame(height: 32)
            statCell(
                value: "\(appState.currentStreak)",
                label: "Tage Streak",
                icon: "flame.fill",
                color: .appAccent
            )
            Spacer()

            Text("📓 Weiter so!")
                .font(.appCaption)
                .foregroundColor(.appTextSecondary)
        }
    }

    private func statCell(value: String, label: String, icon: String, color: Color) -> some View {
        HStack(spacing: 6) {
            Image(systemName: icon)
                .foregroundColor(color)
                .font(.system(size: 14))
            VStack(alignment: .leading, spacing: 0) {
                Text(value)
                    .font(.appBodyBold)
                    .foregroundColor(.appText)
                Text(label)
                    .font(.appCaption)
                    .foregroundColor(.appTextSecondary)
            }
        }
    }

    // MARK: - Entries List

    private var entriesList: some View {
        ScrollView(showsIndicators: false) {
            LazyVStack(alignment: .leading, spacing: 8) {
                ForEach(vm.entriesGroupedByMonth(from: appState.sortedJournalEntries), id: \.key) { group in
                    // Month header
                    Text(group.key)
                        .font(.appCaptionBold)
                        .foregroundColor(.appTextSecondary)
                        .padding(.top, 16)
                        .padding(.horizontal, 20)

                    ForEach(group.value) { entry in
                        NavigationLink {
                            JournalEntryDetailView(entryID: entry.id)
                        } label: {
                            JournalEntryRow(entry: entry)
                        }
                        .buttonStyle(.plain)
                        .padding(.horizontal, 20)
                        .swipeActions(edge: .trailing, allowsFullSwipe: true) {
                            Button(role: .destructive) {
                                withAnimation {
                                    appState.deleteJournalEntry(id: entry.id)
                                }
                            } label: {
                                Label("Löschen", systemImage: "trash")
                            }
                        }
                    }
                }

                Spacer().frame(height: 80) // space for FAB
            }
            .padding(.vertical, 8)
        }
    }

    // MARK: - Empty State

    private var emptyState: some View {
        VStack(spacing: 16) {
            Text("📝")
                .font(.system(size: 48))
            Text("Dein Tagebuch ist leer.")
                .font(.appHeadline)
                .foregroundColor(.appText)
            Text("Tippe auf +, um deinen ersten Eintrag zu schreiben.")
                .font(.appBody)
                .foregroundColor(.appTextSecondary)
        }
        .frame(maxHeight: .infinity)
    }

    // MARK: - Add Button (FAB)

    private var addButton: some View {
        Button {
            vm.isShowingNewEntry = true
        } label: {
            Image(systemName: "plus")
                .font(.system(size: 22, weight: .semibold))
                .foregroundColor(.white)
                .frame(width: 58, height: 58)
                .background(Color.appPurple)
                .clipShape(Circle())
                .shadow(color: Color.appPurple.opacity(0.4), radius: 12, x: 0, y: 5)
        }
    }
}
