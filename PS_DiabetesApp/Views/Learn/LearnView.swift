import SwiftUI

/// Browse lessons organised by category.
/// Each category is a horizontal scroll of lesson cards.
struct LearnView: View {
    @EnvironmentObject var appState: AppState
    @StateObject private var vm = LearnViewModel()

    var body: some View {
        NavigationStack {
            ScrollView(showsIndicators: false) {
                VStack(alignment: .leading, spacing: 28) {

                    // Overall progress banner
                    progressBanner

                    // Language mode switcher
                    modeSwitcher
                        .padding(.horizontal, 20)

                    // One section per category
                    ForEach(LessonCategory.allCases) { category in
                        categorySection(category)
                    }

                    Spacer().frame(height: 8)
                }
                .padding(.top, 8)
                .padding(.bottom, 24)
            }
            .background(Color.appBackground.ignoresSafeArea())
            .navigationTitle("Lernen")
            .navigationBarTitleDisplayMode(.large)
        }
    }

    // MARK: - Mode Switcher

    private var modeSwitcher: some View {
        HStack(spacing: 0) {
            ForEach(LearningMode.allCases) { mode in
                let isSelected = appState.learningMode == mode
                Button {
                    withAnimation(.spring(response: 0.3, dampingFraction: 0.75)) {
                        appState.learningMode = mode
                    }
                } label: {
                    HStack(spacing: 6) {
                        Image(systemName: mode.icon)
                            .font(.system(size: 12, weight: .semibold))
                        Text(mode.rawValue)
                            .font(.appCaptionBold)
                    }
                    .foregroundColor(isSelected ? .white : .appTextSecondary)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 10)
                    .background(isSelected ? Color.appPrimary : Color.clear)
                    .clipShape(Capsule())
                }
            }
        }
        .padding(4)
        .background(Color.appCard)
        .clipShape(Capsule())
        .overlay(Capsule().stroke(Color.appDivider, lineWidth: 1))
    }

    // MARK: - Progress Banner

    private var progressBanner: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack {
                Text("Dein Fortschritt")
                    .font(.appHeadline)
                    .foregroundColor(.appText)
                Spacer()
                Text("\(appState.completedLessonsCount)/\(appState.totalLessonsCount)")
                    .font(.appCaptionBold)
                    .foregroundColor(.appPrimary)
            }

            ProgressBarView(
                progress: Double(appState.completedLessonsCount) / Double(max(appState.totalLessonsCount, 1)),
                color: .appPrimary,
                height: 8
            )
        }
        .appCard()
        .padding(.horizontal, 20)
    }

    // MARK: - Category Section

    private func categorySection(_ category: LessonCategory) -> some View {
        let lessons = vm.lessonsFor(category: category, from: appState.lessons)
        let doneCount = vm.completionCount(
            for: category,
            from: appState.lessons,
            completedIDs: appState.completedLessonIDs
        )

        return VStack(alignment: .leading, spacing: 12) {
            // Section header
            HStack(alignment: .firstTextBaseline) {
                Text(category.emoji + " " + category.rawValue)
                    .font(.appTitle2)
                    .foregroundColor(.appText)
                Spacer()
                Text("\(doneCount)/\(lessons.count)")
                    .font(.appCaptionBold)
                    .foregroundColor(category.themeColor)
            }
            .padding(.horizontal, 20)

            // Horizontal scroll of cards
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 12) {
                    Spacer().frame(width: 8) // leading inset
                    ForEach(lessons) { lesson in
                        NavigationLink {
                            LessonDetailView(lesson: lesson)
                        } label: {
                            LessonCard(
                                lesson: lesson,
                                isCompleted: appState.completedLessonIDs.contains(lesson.id)
                            )
                        }
                        .buttonStyle(.plain)
                    }
                    Spacer().frame(width: 8) // trailing inset
                }
            }
        }
    }
}
