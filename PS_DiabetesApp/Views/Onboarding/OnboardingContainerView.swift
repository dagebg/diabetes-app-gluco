import SwiftUI

/// Root onboarding container — owns the VM and drives step transitions.
/// Each step is a full-screen child view. Transition: slide + fade.
struct OnboardingContainerView: View {
    @StateObject private var vm = OnboardingViewModel()
    @EnvironmentObject var appState: AppState

    var body: some View {
        ZStack {
            Color.appBackground.ignoresSafeArea()

            switch vm.currentStep {
            case .welcome:
                WelcomeView(onContinue: vm.proceedToName)
                    .transition(.asymmetric(
                        insertion: .opacity,
                        removal: .move(edge: .leading).combined(with: .opacity)
                    ))

            case .name:
                NameInputView(vm: vm, onContinue: vm.proceedToProfile)
                    .transition(.asymmetric(
                        insertion: .move(edge: .trailing).combined(with: .opacity),
                        removal: .move(edge: .leading).combined(with: .opacity)
                    ))

            case .profile:
                ProfileInputView(vm: vm, onContinue: vm.proceedToDiagnosis)
                    .transition(.asymmetric(
                        insertion: .move(edge: .trailing).combined(with: .opacity),
                        removal: .move(edge: .leading).combined(with: .opacity)
                    ))

            case .diagnosisTime:
                DiagnosisTimeView(vm: vm, onComplete: vm.proceedToNotifications)
                    .transition(.asymmetric(
                        insertion: .move(edge: .trailing).combined(with: .opacity),
                        removal: .move(edge: .leading).combined(with: .opacity)
                    ))

            case .notifications:
                NotificationPermissionView(vm: vm) {
                    if let duration = vm.selectedDuration {
                        appState.completeOnboarding(
                            name: vm.name.trimmingCharacters(in: .whitespaces),
                            diagnosisDuration: duration,
                            gender: vm.draftGender,
                            age: vm.draftAge
                        )
                    }
                }
                .transition(.asymmetric(
                    insertion: .move(edge: .trailing).combined(with: .opacity),
                    removal: .opacity
                ))
            }
        }
        .animation(.easeInOut(duration: 0.35), value: vm.currentStep)
    }
}
