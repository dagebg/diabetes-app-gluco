import SwiftUI

/// Dashboard / landing screen after onboarding.
/// Shows greeting, streak, quick navigation, and daily tip.
struct HomeView: View {
    @EnvironmentObject var appState: AppState
    @StateObject private var vm = HomeViewModel()

    /// Binding from MainTabView — lets feature cards switch tabs directly
    @Binding var selectedTab: Int

    var body: some View {
        NavigationStack {
            ScrollView(showsIndicators: false) {
                VStack(spacing: 20) {
                    greetingCard
                    sectionHeader("Schnellzugriff")
                    featureCards
                    sectionHeader("Tipp des Tages 💡")
                    tipCard
                    Spacer().frame(height: 8)
                }
                .padding(.horizontal, 20)
                .padding(.top, 16)
                .padding(.bottom, 24)
            }
            .background(Color.appBackground.ignoresSafeArea())
            .navigationBarHidden(true)
        }
    }

    // MARK: - Greeting Card

    private var greetingCard: some View {
        VStack(alignment: .leading, spacing: 12) {
            // Time greeting + name
            VStack(alignment: .leading, spacing: 4) {
                Text(vm.timeGreeting + ",")
                    .font(.appTitle2)
                    .foregroundColor(.white.opacity(0.85))
                Text((appState.currentUser?.firstName ?? "there") + " 👋")
                    .font(.appLargeTitle)
                    .foregroundColor(.white)
            }

            Divider().background(Color.white.opacity(0.25))

            HStack(spacing: 16) {
                // Streak badge
                Label {
                    Text("\(appState.currentStreak)-Tage-Streak")
                        .font(.appBodyBold)
                        .foregroundColor(.white)
                } icon: {
                    Text("🔥")
                }

                Spacer()

                // Lesson progress
                VStack(alignment: .trailing, spacing: 2) {
                    Text("\(appState.completedLessonsCount)/\(appState.totalLessonsCount) Lektionen")
                        .font(.appCaptionBold)
                        .foregroundColor(.white.opacity(0.9))
                    ProgressBarView(
                        progress: Double(appState.completedLessonsCount) / Double(max(appState.totalLessonsCount, 1)),
                        color: .white,
                        height: 5
                    )
                    .frame(width: 80)
                }
            }
        }
        .padding(20)
        .background(
            LinearGradient(
                colors: [Color.appPrimary, Color.appPrimary.opacity(0.72)],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
        )
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .shadow(color: Color.appPrimary.opacity(0.35), radius: 14, x: 0, y: 6)
    }

    // MARK: - Feature Cards

    private var featureCards: some View {
        VStack(spacing: 12) {
            Button { selectedTab = 1 } label: {
                FeatureCard(
                    title: "Lernen",
                    subtitle: "\(appState.completedLessonsCount) von \(appState.totalLessonsCount) abgeschlossen",
                    emoji: "📚",
                    color: .appPrimary,
                    isWide: true
                )
            }
            .buttonStyle(.plain)

            Button { selectedTab = 2 } label: {
                FeatureCard(
                    title: "Rezepte",
                    subtitle: "\(appState.recipes.count) Rezepte",
                    emoji: "🍽️",
                    color: .appGreen,
                    isWide: true
                )
            }
            .buttonStyle(.plain)

            Button { selectedTab = 3 } label: {
                FeatureCard(
                    title: "Tagebuch",
                    subtitle: "\(appState.journalEntries.count) Einträge · Wie war dein Tag?",
                    emoji: "📓",
                    color: .appPurple,
                    isWide: true
                )
            }
            .buttonStyle(.plain)
        }
    }

    // MARK: - Tip Card

    private var tipCard: some View {
        HStack(alignment: .top, spacing: 14) {
            Text("💬")
                .font(.system(size: 28))

            Text("\"\(vm.tipOfTheDay)\"")
                .font(.appBody)
                .foregroundColor(.appText)
                .italic()
                .lineSpacing(5)
                .fixedSize(horizontal: false, vertical: true)
        }
        .appCard()
    }

    // MARK: - Section Header

    private func sectionHeader(_ title: String) -> some View {
        HStack {
            Text(title)
                .font(.appTitle2)
                .foregroundColor(.appText)
            Spacer()
        }
    }
}

