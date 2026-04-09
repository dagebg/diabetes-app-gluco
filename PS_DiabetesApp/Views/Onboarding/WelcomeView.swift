import SwiftUI

/// First onboarding screen.
/// Purpose: create a warm, calm first impression. Not clinical. Not overwhelming.
struct WelcomeView: View {
    let onContinue: () -> Void

    @State private var logoVisible   = false
    @State private var textVisible   = false
    @State private var buttonVisible = false

    var body: some View {
        VStack(spacing: 0) {
            Spacer()

            // Hero illustration — overlapping tinted circles + icon
            heroArea
                .opacity(logoVisible ? 1 : 0)
                .scaleEffect(logoVisible ? 1 : 0.85)

            Spacer().frame(height: 40)

            // App name + tagline
            VStack(spacing: 10) {
                Text("Gluco")
                    .font(.appLargeTitle)
                    .foregroundColor(.appText)

                Text("Dein T1D-Begleiter.\nEinfach. Freundlich. Deins.")
                    .font(.appBody)
                    .foregroundColor(.appTextSecondary)
                    .multilineTextAlignment(.center)
                    .lineSpacing(4)
            }
            .opacity(textVisible ? 1 : 0)
            .offset(y: textVisible ? 0 : 16)

            Spacer()

            // CTA button
            Button(action: onContinue) {
                Text("Los geht's")
            }
            .primaryButtonStyle()
            .padding(.horizontal, 32)
            .opacity(buttonVisible ? 1 : 0)
            .offset(y: buttonVisible ? 0 : 20)

            Spacer().frame(height: 48)
        }
        .padding(.horizontal, 24)
        .onAppear { animateEntrance() }
    }

    // MARK: - Hero Area

    private var heroArea: some View {
        ZStack {
            // Background circles for depth
            Circle()
                .fill(Color.appPrimary.opacity(0.08))
                .frame(width: 240, height: 240)

            Circle()
                .fill(Color.appPrimary.opacity(0.12))
                .frame(width: 180, height: 180)

            // Central icon
            ZStack {
                Circle()
                    .fill(Color.appPrimary.opacity(0.18))
                    .frame(width: 120, height: 120)

                Image(systemName: "heart.text.square.fill")
                    .font(.system(size: 52))
                    .foregroundStyle(Color.appPrimary)
            }

            // Small floating accent badges
            Image(systemName: "bolt.fill")
                .font(.system(size: 18))
                .foregroundColor(.appAccent)
                .padding(10)
                .background(Circle().fill(Color.appAccent.opacity(0.15)))
                .offset(x: 90, y: -55)

            Image(systemName: "leaf.fill")
                .font(.system(size: 16))
                .foregroundColor(.appGreen)
                .padding(10)
                .background(Circle().fill(Color.appGreen.opacity(0.15)))
                .offset(x: -85, y: 60)

            Image(systemName: "graduationcap.fill")
                .font(.system(size: 16))
                .foregroundColor(.appPurple)
                .padding(10)
                .background(Circle().fill(Color.appPurple.opacity(0.15)))
                .offset(x: 80, y: 65)
        }
        .frame(width: 260, height: 260)
    }

    // MARK: - Animation

    private func animateEntrance() {
        withAnimation(.spring(response: 0.7, dampingFraction: 0.65).delay(0.1)) {
            logoVisible = true
        }
        withAnimation(.easeOut(duration: 0.5).delay(0.45)) {
            textVisible = true
        }
        withAnimation(.easeOut(duration: 0.5).delay(0.65)) {
            buttonVisible = true
        }
    }
}
