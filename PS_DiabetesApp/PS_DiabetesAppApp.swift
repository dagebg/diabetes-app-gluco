import SwiftUI

@main
struct PS_DiabetesAppApp: App {

    // Single source of truth — injected into the entire view hierarchy
    @StateObject private var appState = AppState()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(appState)
        }
    }
}
