import Foundation
import Combine

final class OnboardingViewModel: ObservableObject {

    // MARK: - Step tracking

    enum Step: Int, CaseIterable {
        case welcome, name, profile, diagnosisTime, notifications
    }

    @Published var currentStep: Step = .welcome

    // MARK: - User input

    @Published var name: String = ""
    @Published var draftGender: Gender? = nil
    @Published var draftAge: Int? = nil
    @Published var selectedDuration: DiagnosisDuration? = nil

    // MARK: - Notifications

    @Published var reminderTime: Date = {
        var c = DateComponents(); c.hour = 9; c.minute = 0
        return Calendar.current.date(from: c) ?? Date()
    }()

    // MARK: - Validation

    var canProceedFromName: Bool {
        name.trimmingCharacters(in: .whitespaces).count >= 2
    }

    var canCompleteOnboarding: Bool {
        selectedDuration != nil
    }

    /// First name extracted — used in DiagnosisTimeView greeting
    var firstName: String {
        name.trimmingCharacters(in: .whitespaces)
            .components(separatedBy: " ")
            .first ?? name
    }

    // MARK: - Navigation

    func proceedToName() {
        currentStep = .name
    }

    func proceedToProfile() {
        guard canProceedFromName else { return }
        currentStep = .profile
    }

    func proceedToDiagnosis() {
        currentStep = .diagnosisTime
    }

    func proceedToNotifications() {
        guard canCompleteOnboarding else { return }
        currentStep = .notifications
    }

    func goBack() {
        guard currentStep.rawValue > 0 else { return }
        currentStep = Step(rawValue: currentStep.rawValue - 1) ?? .welcome
    }
}
