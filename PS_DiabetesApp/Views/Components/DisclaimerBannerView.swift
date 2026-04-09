import SwiftUI

/// Soft amber disclaimer shown on Recipe detail and Lesson footers.
/// Reminds users this is educational content, not medical advice.
struct DisclaimerBannerView: View {
    var message: String = "Dies sind ausschließlich Bildungsinhalte. Konsultiere immer dein Behandlungsteam, bevor du Entscheidungen triffst."

    var body: some View {
        HStack(alignment: .top, spacing: 10) {
            Image(systemName: "info.circle.fill")
                .foregroundColor(.appAccent)
                .font(.system(size: 16))
                .padding(.top, 1)

            Text(message)
                .font(.appCaption)
                .foregroundColor(.appText)
                .fixedSize(horizontal: false, vertical: true)
        }
        .padding(12)
        .background(Color.appAccent.opacity(0.10))
        .clipShape(RoundedRectangle(cornerRadius: 12))
        .overlay(
            RoundedRectangle(cornerRadius: 12)
                .stroke(Color.appAccent.opacity(0.25), lineWidth: 1)
        )
    }
}
