import SwiftUI

/// Step 3: How long have they had T1D?
/// This drives the tone of the welcome message and future content hints.
struct DiagnosisTimeView: View {
    @ObservedObject var vm: OnboardingViewModel
    let onComplete: () -> Void

    @State private var appeared = false

    var body: some View {
        VStack(spacing: 0) {
            // Nav row
            HStack {
                Button { vm.goBack() } label: {
                    Image(systemName: "chevron.left")
                        .font(.system(size: 17, weight: .semibold))
                        .foregroundColor(.appPrimary)
                }
                Spacer()
                stepDots(current: 3)
            }
            .padding(.horizontal, 24)
            .padding(.top, 16)

            ScrollView {
                VStack(alignment: .leading, spacing: 28) {

                    // Personalised greeting
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Schön, dich kennenzulernen,")
                            .font(.appTitle2)
                            .foregroundColor(.appTextSecondary)
                        Text("\(vm.firstName)! 🙌")
                            .font(.appLargeTitle)
                            .foregroundColor(.appText)

                        Text("Noch eine Frage –")
                            .font(.appBody)
                            .foregroundColor(.appTextSecondary)
                            .padding(.top, 4)

                        Text("Wie lange hast du\nschon T1D?")
                            .font(.appTitle)
                            .foregroundColor(.appText)
                    }
                    .padding(.top, 28)
                    .opacity(appeared ? 1 : 0)
                    .offset(y: appeared ? 0 : 20)

                    // Selection options
                    VStack(spacing: 12) {
                        ForEach(DiagnosisDuration.allCases) { duration in
                            durationButton(duration)
                        }
                    }
                    .opacity(appeared ? 1 : 0)
                    .offset(y: appeared ? 0 : 16)

                    // Support message on selection
                    if let duration = vm.selectedDuration {
                        Text(duration.supportMessage)
                            .font(.appBody)
                            .foregroundColor(.appPrimary)
                            .padding(16)
                            .background(Color.appPrimary.opacity(0.08))
                            .clipShape(RoundedRectangle(cornerRadius: 14))
                            .transition(.opacity.combined(with: .move(edge: .bottom)))
                    }

                    Spacer().frame(height: 16)
                }
                .padding(.horizontal, 24)
                .animation(.spring(response: 0.4, dampingFraction: 0.75), value: vm.selectedDuration)
            }

            // Final CTA
            Button(action: onComplete) {
                Text("Weiter →")
            }
            .primaryButtonStyle(isEnabled: vm.canCompleteOnboarding)
            .disabled(!vm.canCompleteOnboarding)
            .padding(.horizontal, 24)
            .padding(.bottom, 32)
        }
        .background(Color.appBackground.ignoresSafeArea())
        .onAppear {
            withAnimation(.easeOut(duration: 0.45).delay(0.1)) { appeared = true }
        }
    }

    // MARK: - Duration Button

    private func durationButton(_ duration: DiagnosisDuration) -> some View {
        let isSelected = vm.selectedDuration == duration

        return Button {
            withAnimation(.spring(response: 0.3, dampingFraction: 0.7)) {
                vm.selectedDuration = duration
            }
        } label: {
            HStack(spacing: 14) {
                Text(durationEmoji(duration))
                    .font(.system(size: 24))

                Text(duration.rawValue)
                    .font(.appHeadline)
                    .foregroundColor(isSelected ? .appPrimary : .appText)

                Spacer()

                if isSelected {
                    Image(systemName: "checkmark.circle.fill")
                        .foregroundColor(.appPrimary)
                        .transition(.scale.combined(with: .opacity))
                }
            }
            .padding(16)
            .background(
                RoundedRectangle(cornerRadius: 14)
                    .fill(isSelected ? Color.appPrimary.opacity(0.09) : Color.appCard)
            )
            .overlay(
                RoundedRectangle(cornerRadius: 14)
                    .stroke(isSelected ? Color.appPrimary : Color.appDivider, lineWidth: 1.5)
            )
        }
        .animation(.spring(response: 0.3, dampingFraction: 0.7), value: isSelected)
    }

    private func durationEmoji(_ duration: DiagnosisDuration) -> String {
        switch duration {
        case .justDiagnosed:   return "🌱"
        case .fewMonths:       return "📖"
        case .oneToThreeYears: return "🔄"
        case .moreThanThree:   return "⭐️"
        }
    }
}
