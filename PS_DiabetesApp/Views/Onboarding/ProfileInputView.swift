import SwiftUI

/// Step 3: Optional gender + age.
/// Both fields are skippable — "Weiter" is always enabled.
struct ProfileInputView: View {
    @ObservedObject var vm: OnboardingViewModel
    let onContinue: () -> Void

    @State private var appeared = false
    // 0 = no selection, 1…100 = actual age
    @State private var ageIndex: Int = 0

    private let ageLabels: [String] = ["–"] + (1...100).map { "\($0)" }

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
                stepDots(current: 2)
            }
            .padding(.horizontal, 24)
            .padding(.top, 16)

            ScrollView(showsIndicators: false) {
                VStack(alignment: .leading, spacing: 28) {

                    // Heading
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Fast geschafft, \(vm.firstName)!")
                            .font(.appTitle2)
                            .foregroundColor(.appTextSecondary)
                        Text("Erzähl uns etwas\nüber dich.")
                            .font(.appLargeTitle)
                            .foregroundColor(.appText)
                    }
                    .padding(.top, 28)
                    .opacity(appeared ? 1 : 0)
                    .offset(y: appeared ? 0 : 20)

                    // Gender
                    VStack(alignment: .leading, spacing: 12) {
                        fieldLabel("Geschlecht")
                        HStack(spacing: 10) {
                            ForEach(Gender.allCases) { g in
                                genderChip(g)
                            }
                        }
                    }
                    .opacity(appeared ? 1 : 0)
                    .offset(y: appeared ? 0 : 16)

                    // Age
                    VStack(alignment: .leading, spacing: 12) {
                        fieldLabel("Alter")

                        VStack(spacing: 0) {
                            // Selected value display
                            HStack {
                                Text(ageIndex == 0 ? "Kein Alter angegeben" : "\(ageIndex) Jahre")
                                    .font(.appBody)
                                    .foregroundColor(ageIndex == 0 ? .appTextSecondary : .appText)
                                Spacer()
                                if ageIndex != 0 {
                                    Button {
                                        withAnimation { ageIndex = 0; vm.draftAge = nil }
                                    } label: {
                                        Image(systemName: "xmark.circle.fill")
                                            .foregroundColor(.appTextSecondary.opacity(0.5))
                                    }
                                }
                            }
                            .padding(.horizontal, 16)
                            .padding(.vertical, 14)

                            Divider()

                            // Native wheel picker
                            Picker("Alter", selection: $ageIndex) {
                                ForEach(0..<ageLabels.count, id: \.self) { i in
                                    Text(ageLabels[i]).tag(i)
                                }
                            }
                            .pickerStyle(.wheel)
                            .frame(height: 140)
                            .clipped()
                            .onChange(of: ageIndex) { _, new in
                                vm.draftAge = new == 0 ? nil : new
                            }
                        }
                        .background(Color.appCard)
                        .clipShape(RoundedRectangle(cornerRadius: 14))
                        .overlay(
                            RoundedRectangle(cornerRadius: 14)
                                .stroke(Color.appDivider, lineWidth: 1)
                        )
                    }
                    .opacity(appeared ? 1 : 0)
                    .offset(y: appeared ? 0 : 16)

                    Spacer().frame(height: 8)
                }
                .padding(.horizontal, 24)
            }

            // Single CTA — always enabled since both fields are optional
            VStack(spacing: 12) {
                Button(action: onContinue) {
                    Text("Weiter →")
                }
                .primaryButtonStyle()

                Text("Beide Felder sind freiwillig.")
                    .font(.appCaption)
                    .foregroundColor(.appTextSecondary)
            }
            .padding(.horizontal, 24)
            .padding(.bottom, 32)
        }
        .background(Color.appBackground.ignoresSafeArea())
        .onAppear {
            // Restore state if user navigates back
            ageIndex = vm.draftAge ?? 0
            withAnimation(.easeOut(duration: 0.45).delay(0.1)) { appeared = true }
        }
    }

    // MARK: - Gender Chip

    private func genderChip(_ gender: Gender) -> some View {
        let isSelected = vm.draftGender == gender
        return Button {
            withAnimation(.spring(response: 0.25, dampingFraction: 0.7)) {
                vm.draftGender = isSelected ? nil : gender
            }
        } label: {
            HStack(spacing: 8) {
                if isSelected {
                    Image(systemName: "checkmark.circle.fill")
                        .font(.system(size: 14, weight: .semibold))
                        .foregroundColor(.appPrimary)
                        .transition(.scale.combined(with: .opacity))
                }
                Text(gender.rawValue)
                    .font(.appCaptionBold)
                    .foregroundColor(isSelected ? .appPrimary : .appTextSecondary)
            }
            .frame(maxWidth: .infinity)
            .padding(.vertical, 13)
            .background(isSelected ? Color.appPrimary.opacity(0.1) : Color.appCard)
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .overlay(
                RoundedRectangle(cornerRadius: 12)
                    .stroke(isSelected ? Color.appPrimary : Color.appDivider, lineWidth: 1.5)
            )
        }
        .animation(.spring(response: 0.25, dampingFraction: 0.7), value: isSelected)
    }

    // MARK: - Helpers

    private func fieldLabel(_ text: String) -> some View {
        HStack(spacing: 6) {
            Text(text)
                .font(.appHeadline)
                .foregroundColor(.appText)
            Text("(optional)")
                .font(.appCaption)
                .foregroundColor(.appTextSecondary)
        }
    }
}
