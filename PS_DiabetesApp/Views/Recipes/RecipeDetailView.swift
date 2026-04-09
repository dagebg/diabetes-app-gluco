import SwiftUI

/// Full recipe detail — ingredients, steps, disclaimer.
/// No nutritional data or carb counts — educational/inspirational only.
struct RecipeDetailView: View {
    let recipe: Recipe

    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(alignment: .leading, spacing: 24) {

                // Hero
                heroHeader

                // Disclaimer — shown near the top so it's not missed
                DisclaimerBannerView(
                    message: "Diese Rezepte dienen der allgemeinen Inspiration. Sprich immer mit deinem Behandlungsteam über deine Ernährung."
                )

                // Info row
                infoRow

                // Tags
                tagsRow

                Divider()

                // Ingredients
                ingredientsSection

                Divider()

                // Steps
                stepsSection

                Spacer().frame(height: 16)
            }
            .padding(.horizontal, 20)
            .padding(.top, 8)
            .padding(.bottom, 24)
        }
        .background(Color.appBackground.ignoresSafeArea())
        .navigationTitle(recipe.title)
        .navigationBarTitleDisplayMode(.inline)
    }

    // MARK: - Hero Header

    private var heroHeader: some View {
        VStack(spacing: 12) {
            Text(recipe.emoji)
                .font(.system(size: 72))

            Text(recipe.title)
                .font(.appTitle)
                .foregroundColor(.appText)
                .multilineTextAlignment(.center)

            Text(recipe.shortDescription)
                .font(.appBody)
                .foregroundColor(.appTextSecondary)
                .multilineTextAlignment(.center)
                .lineSpacing(4)
        }
        .frame(maxWidth: .infinity)
        .padding(20)
        .background(Color.appGreen.opacity(0.07))
        .clipShape(RoundedRectangle(cornerRadius: 20))
    }

    // MARK: - Info Row

    private var infoRow: some View {
        HStack(spacing: 0) {
            infoCell(label: "Vorbereitung", value: recipe.prepTime, icon: "clock")
            Divider().frame(height: 40)
            infoCell(label: "Kochen", value: recipe.cookTime, icon: "flame")
            Divider().frame(height: 40)
            infoCell(label: "Portionen", value: "\(recipe.servings)", icon: "person.2.fill")
        }
        .appCard(padding: 0)
        .fixedSize(horizontal: false, vertical: true)
    }

    private func infoCell(label: String, value: String, icon: String) -> some View {
        VStack(spacing: 4) {
            Image(systemName: icon)
                .font(.system(size: 16))
                .foregroundColor(.appGreen)
            Text(value)
                .font(.appBodyBold)
                .foregroundColor(.appText)
            Text(label)
                .font(.appCaption)
                .foregroundColor(.appTextSecondary)
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, 14)
    }

    // MARK: - Tags Row

    private var tagsRow: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 8) {
                ForEach(recipe.tags) { tag in
                    TagChip(label: tag.rawValue, color: .appGreen)
                }
            }
        }
    }

    // MARK: - Ingredients

    private var ingredientsSection: some View {
        VStack(alignment: .leading, spacing: 14) {
            Text("Zutaten")
                .font(.appTitle2)
                .foregroundColor(.appText)

            ForEach(recipe.ingredients, id: \.self) { ingredient in
                HStack(alignment: .top, spacing: 12) {
                    Circle()
                        .fill(Color.appGreen)
                        .frame(width: 7, height: 7)
                        .padding(.top, 6)

                    Text(ingredient)
                        .font(.appBody)
                        .foregroundColor(.appText)
                        .fixedSize(horizontal: false, vertical: true)
                }
            }
        }
        .appCard()
    }

    // MARK: - Steps

    private var stepsSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("So wird's gemacht")
                .font(.appTitle2)
                .foregroundColor(.appText)

            ForEach(Array(recipe.steps.enumerated()), id: \.offset) { index, step in
                HStack(alignment: .top, spacing: 14) {
                    // Step number bubble
                    ZStack {
                        Circle()
                            .fill(Color.appGreen.opacity(0.15))
                            .frame(width: 30, height: 30)
                        Text("\(index + 1)")
                            .font(.appCaptionBold)
                            .foregroundColor(.appGreen)
                    }

                    Text(step)
                        .font(.appBody)
                        .foregroundColor(.appText)
                        .lineSpacing(4)
                        .fixedSize(horizontal: false, vertical: true)
                        .padding(.top, 4)
                }
            }
        }
        .appCard()
    }
}
