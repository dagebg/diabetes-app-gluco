import SwiftUI

/// Root view — switches between onboarding and the main app
/// based on AppState.hasCompletedOnboarding.
struct ContentView: View {
    @EnvironmentObject var appState: AppState

    var body: some View {
        Group {
            if appState.hasCompletedOnboarding {
                MainTabView()
            } else {
                OnboardingContainerView()
            }
        }
        // Crossfade between onboarding and main app
        .animation(.easeInOut(duration: 0.4), value: appState.hasCompletedOnboarding)
    }
}

// MARK: - Main Tab View

/// Tab bar container. Owns selectedTab so HomeView can switch tabs programmatically.
struct MainTabView: View {
    @State private var selectedTab = 0

    var body: some View {
        TabView(selection: $selectedTab) {
            HomeView(selectedTab: $selectedTab)
                .tabItem {
                    Label("Start", systemImage: "house.fill")
                }
                .tag(0)

            LearnView()
                .tabItem {
                    Label("Lernen", systemImage: "graduationcap.fill")
                }
                .tag(1)

            RecipesView()
                .tabItem {
                    Label("Rezepte", systemImage: "fork.knife")
                }
                .tag(2)

            JournalView()
                .tabItem {
                    Label("Tagebuch", systemImage: "square.and.pencil")
                }
                .tag(3)

            SettingsView()
                .tabItem {
                    Label("Einstellungen", systemImage: "gearshape.fill")
                }
                .tag(4)
        }
        .tint(.appPrimary)
    }
}
