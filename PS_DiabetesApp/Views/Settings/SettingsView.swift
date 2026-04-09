import SwiftUI
import UserNotifications

struct SettingsView: View {
    @EnvironmentObject var appState: AppState

    // Notification state
    @State private var notificationsEnabled: Bool = false
    @State private var reminderTime: Date = {
        var c = DateComponents(); c.hour = 9; c.minute = 0
        return Calendar.current.date(from: c) ?? Date()
    }()
    @State private var showingNameEdit = false
    @State private var editedName: String = ""

    var body: some View {
        NavigationStack {
            ScrollView(showsIndicators: false) {
                VStack(spacing: 16) {
                    profileSection
                    notificationsSection
                    appInfoSection

                    #if DEBUG
                    debugSection
                    #endif

                    Spacer().frame(height: 24)
                }
                .padding(.horizontal, 20)
                .padding(.top, 16)
            }
            .background(Color.appBackground.ignoresSafeArea())
            .navigationTitle("Einstellungen")
            .navigationBarTitleDisplayMode(.large)
            .onAppear(perform: loadNotificationStatus)
            .sheet(isPresented: $showingNameEdit) {
                nameEditSheet
            }
        }
    }

    // MARK: - Profile

    private var profileSection: some View {
        VStack(alignment: .leading, spacing: 0) {
            sectionHeader("Profil")

            VStack(spacing: 0) {
                // Avatar + name row
                HStack(spacing: 14) {
                    ZStack {
                        Circle()
                            .fill(Color.appGreen.opacity(0.15))
                            .frame(width: 54, height: 54)
                        Text(appState.currentUser?.firstName.prefix(1).uppercased() ?? "?")
                            .font(.system(size: 22, weight: .semibold))
                            .foregroundColor(.appGreen)
                    }

                    VStack(alignment: .leading, spacing: 2) {
                        Text(appState.currentUser?.name ?? "–")
                            .font(.appBodyBold)
                            .foregroundColor(.appText)
                        Text(profileSubtitle)
                            .font(.appCaption)
                            .foregroundColor(.appTextSecondary)
                    }

                    Spacer()

                    Button {
                        editedName = appState.currentUser?.name ?? ""
                        showingNameEdit = true
                    } label: {
                        Text("Bearbeiten")
                            .font(.appCaption)
                            .foregroundColor(.appGreen)
                    }
                }
                .padding(16)

                Divider().padding(.leading, 16)

                // Stats row
                HStack(spacing: 0) {
                    statCell(value: "\(appState.completedLessonsCount)", label: "Lektionen")
                    Divider().frame(height: 36)
                    statCell(value: "\(appState.journalEntries.count)", label: "Einträge")
                    Divider().frame(height: 36)
                    statCell(value: "\(appState.currentStreak)", label: "Tage Streak")
                }
                .padding(.vertical, 12)
            }
            .appCard()
        }
    }

    private func statCell(value: String, label: String) -> some View {
        VStack(spacing: 2) {
            Text(value)
                .font(.appBodyBold)
                .foregroundColor(.appText)
            Text(label)
                .font(.appCaption)
                .foregroundColor(.appTextSecondary)
        }
        .frame(maxWidth: .infinity)
    }

    // MARK: - Name Edit Sheet

    private var nameEditSheet: some View {
        NavigationStack {
            VStack(spacing: 20) {
                TextField("Dein Name", text: $editedName)
                    .font(.appBody)
                    .foregroundColor(.appText)
                    .padding(14)
                    .background(Color.appCard)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                    .overlay(RoundedRectangle(cornerRadius: 12).stroke(Color.appDivider, lineWidth: 1))

                Spacer()
            }
            .padding(20)
            .background(Color.appBackground.ignoresSafeArea())
            .navigationTitle("Name ändern")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Abbrechen") { showingNameEdit = false }
                        .foregroundColor(.appTextSecondary)
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Speichern") {
                        let trimmed = editedName.trimmingCharacters(in: .whitespaces)
                        if !trimmed.isEmpty {
                            appState.currentUser?.name = trimmed
                        }
                        showingNameEdit = false
                    }
                    .font(.appHeadline)
                    .foregroundColor(.appGreen)
                    .disabled(editedName.trimmingCharacters(in: .whitespaces).isEmpty)
                }
            }
        }
        .presentationDetents([.height(200)])
    }

    // MARK: - Notifications

    private var notificationsSection: some View {
        VStack(alignment: .leading, spacing: 0) {
            sectionHeader("Benachrichtigungen")

            VStack(spacing: 0) {
                // Toggle
                HStack {
                    Image(systemName: "bell.badge.fill")
                        .foregroundColor(.appGreen)
                        .frame(width: 28)
                    Text("Tägliche Erinnerung")
                        .font(.appBody)
                        .foregroundColor(.appText)
                    Spacer()
                    Toggle("", isOn: $notificationsEnabled)
                        .tint(.appGreen)
                        .onChange(of: notificationsEnabled) { _, enabled in
                            handleNotificationToggle(enabled)
                        }
                }
                .padding(16)

                if notificationsEnabled {
                    Divider().padding(.leading, 16)

                    HStack {
                        Image(systemName: "clock.fill")
                            .foregroundColor(.appGreen)
                            .frame(width: 28)
                        Text("Uhrzeit")
                            .font(.appBody)
                            .foregroundColor(.appText)
                        Spacer()
                        DatePicker("", selection: $reminderTime, displayedComponents: .hourAndMinute)
                            .labelsHidden()
                            .onChange(of: reminderTime) { _, newTime in
                                NotificationManager.shared.scheduleDailyReminders(at: newTime)
                            }
                    }
                    .padding(16)
                }
            }
            .appCard()
        }
    }

    // MARK: - App Info

    private var appInfoSection: some View {
        VStack(alignment: .leading, spacing: 0) {
            sectionHeader("App")

            VStack(spacing: 0) {
                infoRow(icon: "info.circle.fill", label: "Version", value: appVersion)
                Divider().padding(.leading, 44)
                infoRow(icon: "shield.lefthalf.filled", label: "Datenschutz", value: "")
                Divider().padding(.leading, 44)
                disclaimerRow
            }
            .appCard()
        }
    }

    private var disclaimerRow: some View {
        HStack(alignment: .top, spacing: 12) {
            Image(systemName: "exclamationmark.triangle.fill")
                .foregroundColor(.orange)
                .frame(width: 28)
            Text("Diese App ersetzt keine medizinische Beratung. Bei gesundheitlichen Fragen wende dich immer an dein Behandlungsteam.")
                .font(.appCaption)
                .foregroundColor(.appTextSecondary)
                .fixedSize(horizontal: false, vertical: true)
        }
        .padding(16)
    }

    private func infoRow(icon: String, label: String, value: String) -> some View {
        HStack {
            Image(systemName: icon)
                .foregroundColor(.appGreen)
                .frame(width: 28)
            Text(label)
                .font(.appBody)
                .foregroundColor(.appText)
            Spacer()
            Text(value)
                .font(.appCaption)
                .foregroundColor(.appTextSecondary)
        }
        .padding(16)
    }

    // MARK: - Debug

    #if DEBUG
    private var debugSection: some View {
        VStack(alignment: .leading, spacing: 0) {
            sectionHeader("Debug")

            VStack(spacing: 0) {
                Button {
                    appState.resetApp()
                } label: {
                    HStack {
                        Image(systemName: "arrow.counterclockwise")
                            .foregroundColor(.red)
                            .frame(width: 28)
                        Text("Onboarding zurücksetzen")
                            .font(.appBody)
                            .foregroundColor(.red)
                        Spacer()
                    }
                    .padding(16)
                }
            }
            .appCard()
        }
    }
    #endif

    // MARK: - Helpers

    private var profileSubtitle: String {
        var parts: [String] = []
        if let g = appState.currentUser?.gender { parts.append(g.rawValue) }
        if let a = appState.currentUser?.age    { parts.append("\(a) Jahre") }
        if parts.isEmpty { parts.append(appState.currentUser?.diagnosisDuration.rawValue ?? "–") }
        else { parts.append(appState.currentUser?.diagnosisDuration.rawValue ?? "") }
        return parts.filter { !$0.isEmpty }.joined(separator: " · ")
    }

    private func sectionHeader(_ text: String) -> some View {
        Text(text.uppercased())
            .font(.appCaption)
            .foregroundColor(.appTextSecondary)
            .padding(.horizontal, 4)
            .padding(.bottom, 6)
    }

    private var appVersion: String {
        let version = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String ?? "1.0"
        let build   = Bundle.main.infoDictionary?["CFBundleVersion"] as? String ?? "1"
        return "\(version) (\(build))"
    }

    private func loadNotificationStatus() {
        UNUserNotificationCenter.current().getNotificationSettings { settings in
            DispatchQueue.main.async {
                notificationsEnabled = settings.authorizationStatus == .authorized
            }
        }
    }

    private func handleNotificationToggle(_ enabled: Bool) {
        if enabled {
            NotificationManager.shared.requestPermission { granted in
                notificationsEnabled = granted
                if granted {
                    NotificationManager.shared.scheduleDailyReminders(at: reminderTime)
                }
            }
        } else {
            NotificationManager.shared.cancelDailyReminders()
        }
    }
}
