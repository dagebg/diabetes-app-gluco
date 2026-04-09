import Foundation
import UserNotifications

/// Handles daily reminder notifications.
/// Schedules 7 weekly-repeating notifications (one per weekday) for message variety.
final class NotificationManager {

    static let shared = NotificationManager()
    private init() {}

    private let identifierPrefix = "glucoDailyReminder"

    // MARK: - Permission

    func requestPermission(completion: @escaping (Bool) -> Void) {
        UNUserNotificationCenter.current()
            .requestAuthorization(options: [.alert, .badge, .sound]) { granted, _ in
                DispatchQueue.main.async { completion(granted) }
            }
    }

    // MARK: - Schedule

    /// Schedules 7 notifications — one per weekday at the given time, repeating weekly.
    /// This gives the user a different message each day of the week.
    func scheduleDailyReminders(at time: Date) {
        cancelDailyReminders()

        let hour   = Calendar.current.component(.hour,   from: time)
        let minute = Calendar.current.component(.minute, from: time)

        // weekday: 1 = Sonntag, 2 = Montag, ..., 7 = Samstag
        let messages: [(title: String, body: String)] = [
            ("Zeit zu lernen! 📚",          "Jeden Tag ein bisschen – so wird T1D verständlicher."),
            ("Guten Morgen! 💙",             "Schon 2 Minuten reichen für eine neue Lektion. Los geht's!"),
            ("Dein Streak wartet! 🔥",       "Öffne Gluco und mach dort weiter, wo du aufgehört hast."),
            ("Kleine Schritte, große Wirkung 💪", "Du schaffst das – eine Lektion nach der anderen."),
            ("Du bist nicht allein. 🌱",     "Millionen Menschen leben mit T1D. Heute lernst du mehr darüber."),
            ("Fast Wochenende! 🎓",          "Beende die Woche stark – eine Lektion für heute Abend."),
            ("Wochenend-Wissen! 🌟",         "Auch am Wochenende macht Lernen Spaß. Nur kurz reinschauen!")
        ]

        for (index, message) in messages.enumerated() {
            let content = UNMutableNotificationContent()
            content.title = message.title
            content.body  = message.body
            content.sound = .default

            var components = DateComponents()
            components.weekday = index + 1
            components.hour    = hour
            components.minute  = minute

            let trigger = UNCalendarNotificationTrigger(dateMatching: components, repeats: true)
            let request = UNNotificationRequest(
                identifier: "\(identifierPrefix)_\(index)",
                content: content,
                trigger: trigger
            )
            UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
        }
    }

    // MARK: - Cancel

    func cancelDailyReminders() {
        let ids = (0..<7).map { "\(identifierPrefix)_\($0)" }
        UNUserNotificationCenter.current().removePendingNotificationRequests(withIdentifiers: ids)
    }
}
