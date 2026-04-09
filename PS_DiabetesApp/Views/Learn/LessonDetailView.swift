import SwiftUI

/// Full lesson view — shows a paged reader with progress dots and nav buttons.
/// Duolingo-style: one concept per page, swipeable, progress visible at top.
struct LessonDetailView: View {
    let lesson: Lesson

    @EnvironmentObject var appState: AppState
    @Environment(\.dismiss) private var dismiss

    @State private var currentPage = 0
    @State private var showCompletionBanner = false

    private var isCompleted: Bool {
        appState.completedLessonIDs.contains(lesson.id)
    }

    private var isLastPage: Bool {
        currentPage == lesson.pages.count - 1
    }

    var body: some View {
        VStack(spacing: 0) {

            // Page dots + category chip
            headerBar

            Divider()

            // Swipeable lesson pages
            TabView(selection: $currentPage) {
                ForEach(Array(lesson.pages.enumerated()), id: \.element.id) { index, page in
                    LessonPageView(page: page, mode: appState.learningMode)
                        .tag(index)
                }
            }
            .tabViewStyle(.page(indexDisplayMode: .never))
            .animation(.easeInOut, value: currentPage)

            Divider()

            // Navigation buttons
            navButtons
                .padding(.horizontal, 20)
                .padding(.vertical, 14)

            // Disclaimer at the bottom
            DisclaimerBannerView()
                .padding(.horizontal, 20)
                .padding(.bottom, 16)
        }
        .background(Color.appBackground.ignoresSafeArea())
        .navigationTitle(lesson.title)
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Text("~\(lesson.estimatedMinutes) min")
                    .font(.appCaption)
                    .foregroundColor(.appTextSecondary)
            }
        }
        .overlay(alignment: .top) {
            if showCompletionBanner {
                completionBanner
                    .transition(.move(edge: .top).combined(with: .opacity))
                    .zIndex(1)
            }
        }
    }

    // MARK: - Header Bar

    private var headerBar: some View {
        VStack(spacing: 10) {
            // Dots
            PageDotsView(
                total: lesson.pages.count,
                current: currentPage,
                activeColor: lesson.category.themeColor
            )

            // Category + mode toggle + completion badge
            HStack(spacing: 8) {
                TagChip(label: lesson.category.emoji + " " + lesson.category.rawValue,
                        color: lesson.category.themeColor)

                Spacer()

                // Compact mode pill
                modePill

                if isCompleted {
                    Label("Abgeschlossen", systemImage: "checkmark.seal.fill")
                        .font(.appCaptionBold)
                        .foregroundColor(.appGreen)
                }
            }
        }
        .padding(.horizontal, 20)
        .padding(.vertical, 12)
    }

    // MARK: - Mode Pill

    private var modePill: some View {
        Button {
            withAnimation(.spring(response: 0.3, dampingFraction: 0.75)) {
                appState.learningMode = appState.learningMode == .easy ? .scientific : .easy
            }
        } label: {
            HStack(spacing: 4) {
                Image(systemName: appState.learningMode.icon)
                    .font(.system(size: 10, weight: .semibold))
                Text(appState.learningMode.rawValue)
                    .font(.appCaption)
            }
            .foregroundColor(appState.learningMode == .scientific ? .appPrimary : .appTextSecondary)
            .padding(.horizontal, 10)
            .padding(.vertical, 5)
            .background(
                appState.learningMode == .scientific
                    ? Color.appPrimary.opacity(0.1)
                    : Color.appCard
            )
            .clipShape(Capsule())
            .overlay(Capsule().stroke(
                appState.learningMode == .scientific ? Color.appPrimary.opacity(0.4) : Color.appDivider,
                lineWidth: 1
            ))
        }
    }

    // MARK: - Navigation Buttons

    private var navButtons: some View {
        HStack(spacing: 12) {
            // Back button (hidden on first page)
            if currentPage > 0 {
                Button {
                    withAnimation { currentPage -= 1 }
                } label: {
                    Text("← Zurück")
                }
                .secondaryButtonStyle()
            }

            if isLastPage {
                // Complete / completed button
                Button {
                    guard !isCompleted else { dismiss(); return }
                    appState.toggleLessonCompletion(lesson.id)
                    withAnimation(.spring()) { showCompletionBanner = true }
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                        withAnimation { showCompletionBanner = false }
                        dismiss()
                    }
                } label: {
                    Text(isCompleted ? "✓ Bereits abgeschlossen" : "Als erledigt markieren 🎉")
                }
                .primaryButtonStyle(isEnabled: !isCompleted)
            } else {
                // Next page
                Button {
                    withAnimation { currentPage += 1 }
                } label: {
                    Text("Weiter →")
                }
                .primaryButtonStyle()
            }
        }
    }

    // MARK: - Completion Banner

    private var completionBanner: some View {
        HStack(spacing: 10) {
            Image(systemName: "checkmark.circle.fill")
                .foregroundColor(.appGreen)
            Text("Lektion abgeschlossen! Gut gemacht 🙌")
                .font(.appHeadline)
                .foregroundColor(.appText)
        }
        .padding(14)
        .background(Color.appCard)
        .clipShape(RoundedRectangle(cornerRadius: 14))
        .shadow(color: .black.opacity(0.1), radius: 10, x: 0, y: 4)
        .padding(.top, 8)
    }
}
