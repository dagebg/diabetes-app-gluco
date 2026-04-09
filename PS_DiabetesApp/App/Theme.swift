import SwiftUI

// MARK: - App Colors
// Defined here (not in xcassets) so the demo runs without Xcode setup.

extension Color {
    /// Primary blue — used for CTAs, active states, headers
    static let appPrimary       = Color(red: 0.36, green: 0.54, blue: 0.97)
    /// Warm off-white — app background
    static let appBackground    = Color(red: 0.97, green: 0.97, blue: 0.99)
    /// Pure white — card surfaces
    static let appCard          = Color.white
    /// Orange — accent highlights, icons
    static let appAccent        = Color(red: 1.00, green: 0.61, blue: 0.27)
    /// Teal green — success, recipes, food
    static let appGreen         = Color(red: 0.22, green: 0.76, blue: 0.55)
    /// Soft purple — journal
    static let appPurple        = Color(red: 0.60, green: 0.40, blue: 0.90)
    /// Near-black — primary text
    static let appText          = Color(red: 0.15, green: 0.15, blue: 0.25)
    /// Medium gray — secondary text, subtitles
    static let appTextSecondary = Color(red: 0.56, green: 0.56, blue: 0.68)
    /// Light separator line
    static let appDivider       = Color(red: 0.91, green: 0.91, blue: 0.94)

    // Category tints — match LessonCategory
    static let categoryBlue     = Color(red: 0.31, green: 0.56, blue: 0.97)
    static let categoryOrange   = Color(red: 1.00, green: 0.60, blue: 0.20)
    static let categoryGreen    = Color(red: 0.22, green: 0.76, blue: 0.55)
}

// MARK: - App Fonts
// Rounded design for headings — friendlier and less clinical.

extension Font {
    static let appLargeTitle  = Font.system(size: 34, weight: .bold,     design: .rounded)
    static let appTitle       = Font.system(size: 26, weight: .bold,     design: .rounded)
    static let appTitle2      = Font.system(size: 20, weight: .semibold, design: .rounded)
    static let appHeadline    = Font.system(size: 17, weight: .semibold, design: .rounded)
    static let appBody        = Font.system(size: 16, weight: .regular)
    static let appBodyBold    = Font.system(size: 16, weight: .semibold)
    static let appCaption     = Font.system(size: 13, weight: .regular)
    static let appCaptionBold = Font.system(size: 13, weight: .semibold)
}

// MARK: - LessonCategory View Helpers
// Kept here (not in model) so models stay import-free from SwiftUI.

extension LessonCategory {
    var themeColor: Color {
        switch self {
        case .whatIsT1D: return .categoryBlue
        case .dailyLife: return .categoryOrange
        case .foodCarbs: return .categoryGreen
        }
    }
    /// Soft tinted background for chips and badges
    var lightColor: Color { themeColor.opacity(0.13) }
}

// MARK: - Reusable View Modifiers

extension View {
    /// Standard white card with subtle shadow
    func appCard(padding: CGFloat = 16) -> some View {
        self
            .padding(padding)
            .background(Color.appCard)
            .clipShape(RoundedRectangle(cornerRadius: 16))
            .shadow(color: .black.opacity(0.07), radius: 10, x: 0, y: 3)
    }

    /// Full-width primary action button
    func primaryButtonStyle(isEnabled: Bool = true) -> some View {
        self
            .font(.appHeadline)
            .foregroundColor(.white)
            .frame(maxWidth: .infinity)
            .padding(.vertical, 16)
            .background(isEnabled ? Color.appPrimary : Color.appTextSecondary)
            .clipShape(RoundedRectangle(cornerRadius: 14))
            .animation(.easeInOut(duration: 0.2), value: isEnabled)
    }

    /// Full-width ghost/secondary button
    func secondaryButtonStyle() -> some View {
        self
            .font(.appHeadline)
            .foregroundColor(.appPrimary)
            .frame(maxWidth: .infinity)
            .padding(.vertical, 16)
            .background(Color.appPrimary.opacity(0.10))
            .clipShape(RoundedRectangle(cornerRadius: 14))
    }
}
