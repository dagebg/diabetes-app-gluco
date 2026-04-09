import SwiftUI

/// Sheet for creating a new custom recipe.
struct NewRecipeView: View {
    @ObservedObject var vm: RecipesViewModel
    let onSave: (Recipe) -> Void

    var body: some View {
        NavigationStack {
            ScrollView(showsIndicators: false) {
                VStack(alignment: .leading, spacing: 20) {

                    heroSection
                    timesSection
                    tagsSection
                    ingredientsSection
                    stepsSection

                    Spacer().frame(height: 16)
                }
                .padding(.horizontal, 20)
                .padding(.top, 16)
                .padding(.bottom, 32)
            }
            .background(Color.appBackground.ignoresSafeArea())
            .navigationTitle("Neues Rezept")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Abbrechen") { vm.isShowingNewRecipe = false }
                        .foregroundColor(.appTextSecondary)
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Speichern") {
                        if let recipe = vm.buildRecipe() { onSave(recipe) }
                    }
                    .font(.appHeadline)
                    .foregroundColor(vm.canSaveRecipe ? .appGreen : .appTextSecondary)
                    .disabled(!vm.canSaveRecipe)
                }
            }
        }
    }

    // MARK: - Hero (Emoji + Title + Description)

    private var heroSection: some View {
        VStack(alignment: .leading, spacing: 14) {
            // Emoji + Title row
            HStack(spacing: 14) {
                // Emoji picker
                ZStack {
                    RoundedRectangle(cornerRadius: 14)
                        .fill(Color.appGreen.opacity(0.12))
                        .frame(width: 64, height: 64)
                    TextField("", text: $vm.draftEmoji)
                        .font(.system(size: 34))
                        .multilineTextAlignment(.center)
                        .frame(width: 48)
                }

                // Title
                VStack(alignment: .leading, spacing: 4) {
                    sectionLabel("Rezeptname", required: true)
                    TextField("z.B. Overnight Oats", text: $vm.draftTitle)
                        .font(.appTitle2)
                        .foregroundColor(.appText)
                }
            }

            Divider()

            // Description
            VStack(alignment: .leading, spacing: 6) {
                sectionLabel("Kurzbeschreibung", required: false)
                TextField("Ein Satz über das Rezept…", text: $vm.draftDescription, axis: .vertical)
                    .font(.appBody)
                    .foregroundColor(.appText)
                    .lineLimit(2...4)
            }
        }
        .appCard()
    }

    // MARK: - Times & Servings

    private var timesSection: some View {
        VStack(alignment: .leading, spacing: 14) {
            sectionLabel("Zeit & Portionen", required: false)

            HStack(spacing: 12) {
                labeledField(label: "Vorbereitung", placeholder: "5 Min.", text: $vm.draftPrepTime)
                Divider().frame(height: 40)
                labeledField(label: "Kochen", placeholder: "20 Min.", text: $vm.draftCookTime)
                Divider().frame(height: 40)
                // Servings stepper
                VStack(spacing: 4) {
                    Text("Portionen")
                        .font(.appCaption)
                        .foregroundColor(.appTextSecondary)
                    HStack(spacing: 8) {
                        Button {
                            if vm.draftServings > 1 { vm.draftServings -= 1 }
                        } label: {
                            Image(systemName: "minus")
                                .font(.system(size: 13, weight: .semibold))
                                .foregroundColor(.appGreen)
                                .frame(width: 28, height: 28)
                                .background(Color.appGreen.opacity(0.12))
                                .clipShape(Circle())
                        }
                        Text("\(vm.draftServings)")
                            .font(.appBodyBold)
                            .foregroundColor(.appText)
                            .frame(minWidth: 20)
                        Button {
                            if vm.draftServings < 20 { vm.draftServings += 1 }
                        } label: {
                            Image(systemName: "plus")
                                .font(.system(size: 13, weight: .semibold))
                                .foregroundColor(.appGreen)
                                .frame(width: 28, height: 28)
                                .background(Color.appGreen.opacity(0.12))
                                .clipShape(Circle())
                        }
                    }
                }
                .frame(maxWidth: .infinity)
            }
        }
        .appCard()
    }

    private func labeledField(label: String, placeholder: String, text: Binding<String>) -> some View {
        VStack(spacing: 4) {
            Text(label)
                .font(.appCaption)
                .foregroundColor(.appTextSecondary)
            TextField(placeholder, text: text)
                .font(.appBodyBold)
                .foregroundColor(.appText)
                .multilineTextAlignment(.center)
        }
        .frame(maxWidth: .infinity)
    }

    // MARK: - Tags

    private var tagsSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            sectionLabel("Tags", required: false)
            // 2-column grid of tag toggles
            let columns = [GridItem(.flexible()), GridItem(.flexible())]
            LazyVGrid(columns: columns, spacing: 8) {
                ForEach(RecipeTag.allCases) { tag in
                    tagToggle(tag)
                }
            }
        }
        .appCard()
    }

    private func tagToggle(_ tag: RecipeTag) -> some View {
        let isOn = vm.draftTags.contains(tag)
        return Button {
            withAnimation(.spring(response: 0.25, dampingFraction: 0.7)) {
                vm.toggleDraftTag(tag)
            }
        } label: {
            Text(tag.rawValue)
                .font(.appCaptionBold)
                .foregroundColor(isOn ? .white : .appTextSecondary)
                .frame(maxWidth: .infinity)
                .padding(.vertical, 8)
                .background(isOn ? Color.appGreen : Color.appBackground)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(isOn ? Color.clear : Color.appDivider, lineWidth: 1)
                )
        }
    }

    // MARK: - Ingredients

    private var ingredientsSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            sectionLabel("Zutaten", required: true)

            ForEach(vm.draftIngredients.indices, id: \.self) { i in
                HStack(spacing: 10) {
                    Circle()
                        .fill(Color.appGreen)
                        .frame(width: 7, height: 7)

                    TextField("Zutat \(i + 1)", text: Binding(
                        get: { i < vm.draftIngredients.count ? vm.draftIngredients[i] : "" },
                        set: { if i < vm.draftIngredients.count { vm.draftIngredients[i] = $0 } }
                    ))
                    .font(.appBody)
                    .foregroundColor(.appText)

                    if vm.draftIngredients.count > 1 {
                        Button { vm.removeIngredient(at: i) } label: {
                            Image(systemName: "minus.circle.fill")
                                .foregroundColor(.appTextSecondary.opacity(0.5))
                        }
                    }
                }
            }

            Button {
                vm.addIngredient()
            } label: {
                Label("Zutat hinzufügen", systemImage: "plus.circle")
                    .font(.appCaptionBold)
                    .foregroundColor(.appGreen)
            }
            .padding(.top, 4)
        }
        .appCard()
    }

    // MARK: - Steps

    private var stepsSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            sectionLabel("Zubereitung", required: true)

            ForEach(vm.draftSteps.indices, id: \.self) { i in
                HStack(alignment: .top, spacing: 10) {
                    ZStack {
                        Circle()
                            .fill(Color.appGreen.opacity(0.15))
                            .frame(width: 26, height: 26)
                        Text("\(i + 1)")
                            .font(.appCaptionBold)
                            .foregroundColor(.appGreen)
                    }
                    .padding(.top, 2)

                    TextField("Schritt \(i + 1)", text: Binding(
                        get: { i < vm.draftSteps.count ? vm.draftSteps[i] : "" },
                        set: { if i < vm.draftSteps.count { vm.draftSteps[i] = $0 } }
                    ), axis: .vertical)
                    .font(.appBody)
                    .foregroundColor(.appText)
                    .lineLimit(2...6)

                    if vm.draftSteps.count > 1 {
                        Button { vm.removeStep(at: i) } label: {
                            Image(systemName: "minus.circle.fill")
                                .foregroundColor(.appTextSecondary.opacity(0.5))
                        }
                        .padding(.top, 4)
                    }
                }
            }

            Button {
                vm.addStep()
            } label: {
                Label("Schritt hinzufügen", systemImage: "plus.circle")
                    .font(.appCaptionBold)
                    .foregroundColor(.appGreen)
            }
            .padding(.top, 4)
        }
        .appCard()
    }

    // MARK: - Helpers

    private func sectionLabel(_ text: String, required: Bool) -> some View {
        HStack(spacing: 4) {
            Text(text)
                .font(.appHeadline)
                .foregroundColor(.appText)
            if required {
                Text("*")
                    .foregroundColor(.appGreen)
            }
        }
    }
}
