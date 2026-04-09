import Foundation

// A single lesson card the user can tap into and read
struct Lesson: Identifiable {
    let id: UUID
    let category: LessonCategory
    let title: String
    let emoji: String          // Visual anchor — keeps it friendly
    let shortDescription: String
    let pages: [LessonPage]    // Ordered content pages within the lesson
    let estimatedMinutes: Int
}

// A single swipeable/scrollable page inside a lesson
struct LessonPage: Identifiable {
    let id: UUID
    let heading: String
    let body: String                // Easy-language content (default)
    let illustrationName: String?   // SF Symbol name or nil for plain pages
    var sciHeading: String? = nil   // Scientific heading — falls back to heading if nil
    var sciBody: String? = nil      // Scientific body — falls back to body if nil
}

enum LearningMode: String, CaseIterable, Identifiable {
    case easy       = "Einfach"
    case scientific = "Wissenschaftlich"
    var id: String { rawValue }
    var icon: String {
        switch self {
        case .easy:       return "book.fill"
        case .scientific: return "flask.fill"
        }
    }
}

// Groups lessons into browseable sections on the Learn screen
enum LessonCategory: String, CaseIterable, Identifiable {
    case whatIsT1D  = "Was ist T1D?"
    case dailyLife  = "Alltag"
    case foodCarbs  = "Ernährung & Kohlenhydrate"

    var id: String { rawValue }

    var emoji: String {
        switch self {
        case .whatIsT1D:  return "🔬"
        case .dailyLife:  return "☀️"
        case .foodCarbs:  return "🥗"
        }
    }

    var color: String {
        // Used to look up named colors from Assets.xcassets
        switch self {
        case .whatIsT1D:  return "CategoryBlue"
        case .dailyLife:  return "CategoryOrange"
        case .foodCarbs:  return "CategoryGreen"
        }
    }
}
