import SwiftUI

/// Horizontal emoji mood selector used in NewJournalEntryView.
struct MoodPickerView: View {
    @Binding var selectedMood: Mood?

    var body: some View {
        HStack(spacing: 0) {
            ForEach(Mood.allCases) { mood in
                Button {
                    withAnimation(.spring(response: 0.3, dampingFraction: 0.65)) {
                        selectedMood = mood
                    }
                } label: {
                    moodButton(mood)
                }
                .frame(maxWidth: .infinity)
            }
        }
    }

    @ViewBuilder
    private func moodButton(_ mood: Mood) -> some View {
        let isSelected = selectedMood == mood

        VStack(spacing: 6) {
            Text(mood.emoji)
                .font(.system(size: isSelected ? 34 : 28))
                .scaleEffect(isSelected ? 1.1 : 1.0)
                .padding(8)
                .background(
                    Circle()
                        .fill(isSelected ? Color.appPurple.opacity(0.15) : Color.clear)
                )

            Text(mood.label)
                .font(.appCaption)
                .foregroundColor(isSelected ? .appPurple : .appTextSecondary)
                .fontWeight(isSelected ? .semibold : .regular)
        }
        .animation(.spring(response: 0.3, dampingFraction: 0.65), value: isSelected)
    }
}
