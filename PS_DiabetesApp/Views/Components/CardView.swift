import SwiftUI

/// Generic reusable card shell.
/// Wrap any content in this to get consistent card styling.
struct CardView<Content: View>: View {
    let content: Content

    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }

    var body: some View {
        content
            .appCard()
    }
}

// MARK: - Feature Card (Home Dashboard)

/// Large tappable card used on the Home screen for Learn / Recipes / Journal.
struct FeatureCard: View {
    let title: String
    let subtitle: String
    let emoji: String
    let color: Color
    var isWide: Bool = false

    var body: some View {
        HStack(spacing: 14) {
            // Emoji in a tinted circle
            ZStack {
                Circle()
                    .fill(color.opacity(0.15))
                    .frame(width: 52, height: 52)
                Text(emoji)
                    .font(.system(size: 26))
            }

            VStack(alignment: .leading, spacing: 3) {
                Text(title)
                    .font(.appHeadline)
                    .foregroundColor(.appText)
                Text(subtitle)
                    .font(.appCaption)
                    .foregroundColor(.appTextSecondary)
            }

            Spacer()

            Image(systemName: "chevron.right")
                .font(.system(size: 13, weight: .semibold))
                .foregroundColor(.appTextSecondary)
        }
        .appCard()
        .frame(maxWidth: isWide ? .infinity : nil)
    }
}

// MARK: - Lesson Card (Learn screen horizontal scroll)

struct LessonCard: View {
    let lesson: Lesson
    let isCompleted: Bool

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            ZStack(alignment: .topTrailing) {
                Text(lesson.emoji)
                    .font(.system(size: 38))

                if isCompleted {
                    Image(systemName: "checkmark.circle.fill")
                        .foregroundColor(.appGreen)
                        .font(.system(size: 20))
                        .background(Circle().fill(Color.white).padding(-2))
                }
            }

            // Category chip
            Text(lesson.category.rawValue)
                .font(.appCaptionBold)
                .foregroundColor(lesson.category.themeColor)
                .padding(.horizontal, 8)
                .padding(.vertical, 3)
                .background(lesson.category.lightColor)
                .clipShape(Capsule())

            Text(lesson.title)
                .font(.appHeadline)
                .foregroundColor(.appText)
                .lineLimit(2)
                .fixedSize(horizontal: false, vertical: true)

            Spacer()

            Text("~\(lesson.estimatedMinutes) min")
                .font(.appCaption)
                .foregroundColor(.appTextSecondary)
        }
        .padding(14)
        .frame(width: 160, height: 185)
        .background(Color.appCard)
        .clipShape(RoundedRectangle(cornerRadius: 16))
        .shadow(color: .black.opacity(0.07), radius: 8, x: 0, y: 2)
    }
}

// MARK: - Recipe Card (Recipes list)

struct RecipeCard: View {
    let recipe: Recipe

    var body: some View {
        HStack(spacing: 14) {
            // Emoji avatar
            ZStack {
                RoundedRectangle(cornerRadius: 12)
                    .fill(Color.appGreen.opacity(0.12))
                    .frame(width: 60, height: 60)
                Text(recipe.emoji)
                    .font(.system(size: 32))
            }

            VStack(alignment: .leading, spacing: 4) {
                Text(recipe.title)
                    .font(.appHeadline)
                    .foregroundColor(.appText)

                // Time row
                HStack(spacing: 6) {
                    Label(recipe.prepTime, systemImage: "clock")
                    Text("·")
                    Text("\(recipe.servings) Portionen")
                }
                .font(.appCaption)
                .foregroundColor(.appTextSecondary)

                // First 2 tags
                HStack(spacing: 6) {
                    ForEach(recipe.tags.prefix(2)) { tag in
                        TagChip(label: tag.rawValue, color: .appGreen)
                    }
                }
            }

            Spacer()

            Image(systemName: "chevron.right")
                .font(.system(size: 13, weight: .semibold))
                .foregroundColor(.appTextSecondary)
        }
        .appCard()
    }
}

// MARK: - Tag Chip

struct TagChip: View {
    let label: String
    let color: Color

    var body: some View {
        Text(label)
            .font(.appCaptionBold)
            .foregroundColor(color)
            .padding(.horizontal, 8)
            .padding(.vertical, 3)
            .background(color.opacity(0.12))
            .clipShape(Capsule())
    }
}

// MARK: - Journal Entry Row

struct JournalEntryRow: View {
    let entry: JournalEntry

    var body: some View {
        HStack(alignment: .top, spacing: 14) {
            // Mood emoji in circle
            ZStack {
                Circle()
                    .fill(Color.appPurple.opacity(0.12))
                    .frame(width: 46, height: 46)
                Text(entry.mood.emoji)
                    .font(.system(size: 22))
            }

            VStack(alignment: .leading, spacing: 4) {
                HStack {
                    Text(entry.mood.label)
                        .font(.appCaptionBold)
                        .foregroundColor(.appPurple)
                    Spacer()
                    Text(entry.date.relativeString)
                        .font(.appCaption)
                        .foregroundColor(.appTextSecondary)
                }

                Text(entry.note)
                    .font(.appBody)
                    .foregroundColor(.appText)
                    .lineLimit(2)
            }
        }
        .appCard()
    }
}

// MARK: - Date Helper

private extension Date {
    var relativeString: String {
        let cal = Calendar.current
        if cal.isDateInToday(self)     { return "Heute" }
        if cal.isDateInYesterday(self) { return "Gestern" }
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "de_DE")
        formatter.dateFormat = "EEEE"   // day name
        let daysAgo = cal.dateComponents([.day], from: self, to: Date()).day ?? 0
        if daysAgo < 7 { return formatter.string(from: self) }
        formatter.dateFormat = "d. MMM"
        return formatter.string(from: self)
    }
}
