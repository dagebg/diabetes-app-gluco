import SwiftUI

/// Recipe browser with tag filtering and text search.
struct RecipesView: View {
    @EnvironmentObject var appState: AppState
    @StateObject private var vm = RecipesViewModel()

    var filtered: [Recipe] {
        vm.filteredRecipes(from: appState.recipes)
    }

    var body: some View {
        NavigationStack {
            ZStack(alignment: .bottomTrailing) {
                VStack(spacing: 0) {

                    // Search bar
                    searchBar
                        .padding(.horizontal, 20)
                        .padding(.top, 8)
                        .padding(.bottom, 4)

                    // Tag filter chips
                    tagFilterRow
                        .padding(.bottom, 12)

                    Divider()

                    // Recipe list
                    if filtered.isEmpty {
                        emptyState
                    } else {
                        recipeList
                    }
                }

                // Floating add button
                addButton
                    .padding(24)
            }
            .background(Color.appBackground.ignoresSafeArea())
            .navigationTitle("Rezepte")
            .navigationBarTitleDisplayMode(.large)
            .sheet(isPresented: $vm.isShowingNewRecipe, onDismiss: vm.resetNewRecipeDraft) {
                NewRecipeView(vm: vm) { recipe in
                    appState.addRecipe(recipe)
                    vm.isShowingNewRecipe = false
                }
            }
        }
    }

    // MARK: - Add Button (FAB)

    private var addButton: some View {
        Button {
            vm.isShowingNewRecipe = true
        } label: {
            Image(systemName: "plus")
                .font(.system(size: 22, weight: .semibold))
                .foregroundColor(.white)
                .frame(width: 58, height: 58)
                .background(Color.appGreen)
                .clipShape(Circle())
                .shadow(color: Color.appGreen.opacity(0.4), radius: 12, x: 0, y: 5)
        }
    }

    // MARK: - Search Bar

    private var searchBar: some View {
        HStack(spacing: 10) {
            Image(systemName: "magnifyingglass")
                .foregroundColor(.appTextSecondary)
            TextField("Rezepte suchen…", text: $vm.searchText)
                .font(.appBody)
        }
        .padding(12)
        .background(Color.appCard)
        .clipShape(RoundedRectangle(cornerRadius: 12))
        .overlay(
            RoundedRectangle(cornerRadius: 12)
                .stroke(Color.appDivider, lineWidth: 1)
        )
    }

    // MARK: - Tag Filter Row

    private var tagFilterRow: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 8) {
                Spacer().frame(width: 12)

                // "All" pill
                filterPill(label: "Alle", isSelected: vm.selectedTags.isEmpty) {
                    vm.selectedTags.removeAll()
                }

                ForEach(vm.availableTags(from: appState.recipes)) { tag in
                    filterPill(label: tag.rawValue, isSelected: vm.selectedTags.contains(tag)) {
                        vm.toggleTag(tag)
                    }
                }

                Spacer().frame(width: 12)
            }
            .padding(.vertical, 8)
        }
    }

    private func filterPill(label: String, isSelected: Bool, action: @escaping () -> Void) -> some View {
        Button(action: action) {
            Text(label)
                .font(.appCaptionBold)
                .foregroundColor(isSelected ? .white : .appTextSecondary)
                .padding(.horizontal, 14)
                .padding(.vertical, 7)
                .background(isSelected ? Color.appGreen : Color.appCard)
                .clipShape(Capsule())
                .overlay(
                    Capsule().stroke(isSelected ? Color.clear : Color.appDivider, lineWidth: 1)
                )
        }
        .animation(.spring(response: 0.3, dampingFraction: 0.7), value: isSelected)
    }

    // MARK: - Recipe List

    private var recipeList: some View {
        ScrollView(showsIndicators: false) {
            LazyVStack(spacing: 12) {
                ForEach(filtered) { recipe in
                    NavigationLink {
                        RecipeDetailView(recipe: recipe)
                    } label: {
                        RecipeCard(recipe: recipe)
                    }
                    .buttonStyle(.plain)
                }
                Spacer().frame(height: 80) // space for FAB
            }
            .padding(.horizontal, 20)
            .padding(.top, 16)
        }
    }

    // MARK: - Empty State

    private var emptyState: some View {
        VStack(spacing: 16) {
            Text("🍽️")
                .font(.system(size: 48))
            Text("Keine Rezepte für diesen Filter.")
                .font(.appHeadline)
                .foregroundColor(.appText)
            Button("Filter zurücksetzen") {
                vm.selectedTags.removeAll()
                vm.searchText = ""
            }
            .secondaryButtonStyle()
            .frame(width: 180)
        }
        .frame(maxHeight: .infinity)
    }
}
