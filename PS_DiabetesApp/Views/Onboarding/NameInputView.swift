import SwiftUI

/// Step 2: Ask for the user's first name.
/// Tone: warm and conversational — not a form, a greeting.
struct NameInputView: View {
    @ObservedObject var vm: OnboardingViewModel
    let onContinue: () -> Void

    @FocusState private var fieldFocused: Bool
    @State private var appeared = false

    var body: some View {
        VStack(spacing: 0) {
            // Back button
            HStack {
                Button {
                    vm.goBack()
                } label: {
                    Image(systemName: "chevron.left")
                        .font(.system(size: 17, weight: .semibold))
                        .foregroundColor(.appPrimary)
                }
                Spacer()

                // Step dots
                stepDots(current: 1)
            }
            .padding(.horizontal, 24)
            .padding(.top, 16)

            ScrollView {
                VStack(alignment: .leading, spacing: 32) {

                    // Heading
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Hallo! 👋")
                            .font(.appTitle2)
                            .foregroundColor(.appTextSecondary)

                        Text("Wie sollen wir\ndich nennen?")
                            .font(.appLargeTitle)
                            .foregroundColor(.appText)
                    }
                    .padding(.top, 32)
                    .opacity(appeared ? 1 : 0)
                    .offset(y: appeared ? 0 : 20)

                    // Text field
                    VStack(alignment: .leading, spacing: 8) {
                        TextField("Dein Name…", text: $vm.name)
                            .font(.appTitle2)
                            .foregroundColor(.appText)
                            .focused($fieldFocused)
                            .submitLabel(.done)
                            .onSubmit { if vm.canProceedFromName { onContinue() } }
                            .padding(.vertical, 14)
                            .padding(.horizontal, 16)
                            .background(
                                RoundedRectangle(cornerRadius: 14)
                                    .fill(Color.appCard)
                                    .shadow(color: .black.opacity(0.06), radius: 8, x: 0, y: 2)
                            )
                            .overlay(
                                RoundedRectangle(cornerRadius: 14)
                                    .stroke(fieldFocused ? Color.appPrimary : Color.appDivider, lineWidth: 1.5)
                            )
                            .animation(.easeInOut(duration: 0.2), value: fieldFocused)

                        Text("So personalisieren wir deine Erfahrung.")
                            .font(.appCaption)
                            .foregroundColor(.appTextSecondary)
                    }
                    .opacity(appeared ? 1 : 0)
                    .offset(y: appeared ? 0 : 20)

                    Spacer().frame(height: 20)
                }
                .padding(.horizontal, 24)
            }

            // Continue button — always visible above keyboard
            Button(action: onContinue) {
                Text("Weiter")
            }
            .primaryButtonStyle(isEnabled: vm.canProceedFromName)
            .disabled(!vm.canProceedFromName)
            .padding(.horizontal, 24)
            .padding(.bottom, 32)
        }
        .background(Color.appBackground.ignoresSafeArea())
        .onAppear {
            withAnimation(.easeOut(duration: 0.45).delay(0.1)) { appeared = true }
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) { fieldFocused = true }
        }
    }
}

// MARK: - Step Progress Dots

func stepDots(current: Int) -> some View {
    HStack(spacing: 6) {
        ForEach(0..<5) { i in
            Capsule()
                .fill(i == current ? Color.appPrimary : Color.appPrimary.opacity(0.2))
                .frame(width: i == current ? 20 : 7, height: 7)
        }
    }
    .animation(.spring(), value: current)
}
