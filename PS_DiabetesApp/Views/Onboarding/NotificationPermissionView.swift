import SwiftUI

/// Step 4 of onboarding — ask for notification permission and let the user pick a reminder time.
struct NotificationPermissionView: View {
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
                stepDots(current: 4)
            }
            .padding(.horizontal, 24)
            .padding(.top, 16)

            ScrollView(showsIndicators: false) {
                VStack(alignment: .leading, spacing: 32) {

                    // Hero illustration
                    HStack {
                        Spacer()
                        ZStack {
                            Circle()
                                .fill(Color.appPrimary.opacity(0.08))
                                .frame(width: 140, height: 140)
                            Circle()
                                .fill(Color.appPrimary.opacity(0.13))
                                .frame(width: 100, height: 100)
                            Image(systemName: "bell.badge.fill")
                                .font(.system(size: 48))
                                .foregroundStyle(Color.appPrimary)
                        }
                        Spacer()
                    }
                    .padding(.top, 24)
                    .opacity(appeared ? 1 : 0)
                    .scaleEffect(appeared ? 1 : 0.85)

                    // Heading
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Dran Bleiben lohnt sich. 🔔")
                            .font(.appLargeTitle)
                            .foregroundColor(.appText)
                        Text("Eine tägliche Erinnerung hilft dir, jeden Tag etwas Neues über T1D zu lernen – auch wenn's nur 2 Minuten sind.")
                            .font(.appBody)
                            .foregroundColor(.appTextSecondary)
                            .lineSpacing(5)
                            .fixedSize(horizontal: false, vertical: true)
                            .padding(.top, 4)
                    }
                    .opacity(appeared ? 1 : 0)
                    .offset(y: appeared ? 0 : 20)

                    // Time picker
                    VStack(alignment: .leading, spacing: 12) {
                        Text("Erinnere mich täglich um")
                            .font(.appHeadline)
                            .foregroundColor(.appText)

                        DatePicker(
                            "",
                            selection: $vm.reminderTime,
                            displayedComponents: .hourAndMinute
                        )
                        .datePickerStyle(.wheel)
                        .labelsHidden()
                        .frame(maxWidth: .infinity)
                        .tint(.appPrimary)
                    }
                    .appCard()
                    .opacity(appeared ? 1 : 0)
                    .offset(y: appeared ? 0 : 16)

                    Spacer().frame(height: 8)
                }
                .padding(.horizontal, 24)
            }

            // Actions
            VStack(spacing: 14) {
                Button {
                    NotificationManager.shared.requestPermission { granted in
                        if granted {
                            NotificationManager.shared.scheduleDailyReminders(at: vm.reminderTime)
                        }
                        onComplete()
                    }
                } label: {
                    Text("Benachrichtigungen erlauben")
                }
                .primaryButtonStyle()

                Button("Überspringen", action: onComplete)
                    .font(.appBody)
                    .foregroundColor(.appTextSecondary)
                    .padding(.bottom, 8)
            }
            .padding(.horizontal, 24)
            .padding(.bottom, 32)
        }
        .background(Color.appBackground.ignoresSafeArea())
        .onAppear {
            withAnimation(.easeOut(duration: 0.45).delay(0.1)) { appeared = true }
        }
    }
}
