import SwiftUI

/// Horizontal filled progress bar.
/// Used in LessonDetailView header and Learn overview.
struct ProgressBarView: View {
    /// Value between 0.0 and 1.0
    let progress: Double
    var color: Color = .appPrimary
    var height: CGFloat = 6

    var body: some View {
        GeometryReader { geo in
            ZStack(alignment: .leading) {
                // Track
                RoundedRectangle(cornerRadius: height / 2)
                    .fill(color.opacity(0.15))
                    .frame(height: height)

                // Fill
                RoundedRectangle(cornerRadius: height / 2)
                    .fill(color)
                    .frame(width: geo.size.width * min(max(progress, 0), 1), height: height)
                    .animation(.spring(response: 0.5, dampingFraction: 0.8), value: progress)
            }
        }
        .frame(height: height)
    }
}

/// A row of dots — one per lesson page — used inside LessonDetailView.
struct PageDotsView: View {
    let total: Int
    let current: Int
    var activeColor: Color = .appPrimary

    var body: some View {
        HStack(spacing: 6) {
            ForEach(0..<total, id: \.self) { index in
                Capsule()
                    .fill(index == current ? activeColor : activeColor.opacity(0.25))
                    .frame(width: index == current ? 20 : 7, height: 7)
                    .animation(.spring(response: 0.4, dampingFraction: 0.75), value: current)
            }
        }
    }
}
