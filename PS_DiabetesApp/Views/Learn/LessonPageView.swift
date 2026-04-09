import SwiftUI

/// A single readable page within a lesson.
/// Renders easy or scientific content based on the active LearningMode.
struct LessonPageView: View {
    let page: LessonPage
    let mode: LearningMode

    private var displayHeading: String {
        mode == .scientific ? (page.sciHeading ?? page.heading) : page.heading
    }
    private var displayBody: String {
        mode == .scientific ? (page.sciBody ?? page.body) : page.body
    }

    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(alignment: .leading, spacing: 28) {

                // SF Symbol illustration (if available)
                if let symbolName = page.illustrationName {
                    HStack {
                        Spacer()
                        Image(systemName: symbolName)
                            .font(.system(size: 64, weight: .light))
                            .foregroundStyle(
                                LinearGradient(
                                    colors: [.appPrimary, .appPrimary.opacity(0.5)],
                                    startPoint: .top,
                                    endPoint: .bottom
                                )
                            )
                            .padding(24)
                            .background(
                                Circle().fill(Color.appPrimary.opacity(0.07))
                                    .frame(width: 130, height: 130)
                            )
                            .frame(width: 130, height: 130)
                        Spacer()
                    }
                    .padding(.top, 8)
                }

                // Heading
                Text(displayHeading)
                    .font(.appTitle)
                    .foregroundColor(.appText)
                    .fixedSize(horizontal: false, vertical: true)

                // Body
                Text(displayBody)
                    .font(mode == .scientific ? .appBody : .appBody)
                    .foregroundColor(.appTextSecondary)
                    .lineSpacing(mode == .scientific ? 5 : 7)
                    .fixedSize(horizontal: false, vertical: true)

                Spacer().frame(height: 20)
            }
            .padding(.horizontal, 24)
            .padding(.top, 16)
        }
    }
}
