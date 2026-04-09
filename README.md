# PS DiabetesApp

A native iOS companion app for people living with Type 1 Diabetes (T1D). Built with SwiftUI, designed to be friendly, accessible, and educational — not clinical.

---

## Features

### 🏠 Home
- Personalised greeting based on time of day
- Streak tracker and lesson progress summary
- Daily tip carousel
- Quick-access cards to all main sections

### 📚 Learn
- 20 structured lessons across 3 categories: *Was ist T1D?*, *Alltag*, *Ernährung & Kohlenhydrate*
- Swipeable page-by-page reader
- **Language mode switcher** — toggle between easy everyday language and scientific/clinical terminology per lesson
- Lesson completion tracking

### 🍽️ Recipes
- Curated diabetes-friendly recipes with tags, prep times, and servings
- Full-text search and tag filtering
- Create custom recipes with emoji, ingredients, and step-by-step instructions

### 📓 Journal
- Mood-based daily entries (5 moods with emoji)
- Optional reflection prompts
- View, edit, and delete entries
- Swipe-to-delete in the list
- Entries grouped by month

### ⚙️ Settings
- Edit profile (name, gender, age)
- Toggle and schedule daily push notification reminders
- App version and medical disclaimer

### Onboarding
- 5-step flow: Welcome → Name → Profile (gender + age) → Diagnosis duration → Notification permission
- All personal fields are optional and skippable
- Warm, conversational tone throughout

---

## Tech Stack

| | |
|---|---|
| **Platform** | iOS 16+ |
| **Language** | Swift 5.9 |
| **UI Framework** | SwiftUI |
| **Architecture** | MVVM — `AppState` as a single `ObservableObject` passed via `.environmentObject` |
| **Notifications** | `UserNotifications` — 7 weekly-repeating local notifications for daily reminders |
| **Persistence** | In-memory only (demo build) — all data resets on relaunch |
| **Data** | Static mock data (`MockLessons`, `MockRecipes`, `MockJournalEntries`) |

---

## Project Structure

```
PS_DiabetesApp/
├── App/
│   ├── AppState.swift          # Single source of truth for all app state
│   ├── NotificationManager.swift
│   └── Theme.swift             # Colors, fonts, and shared view modifiers
├── Models/
│   ├── Lesson.swift            # Lesson, LessonPage, LessonCategory, LearningMode
│   ├── JournalEntry.swift      # JournalEntry, Mood, DayPrompt
│   ├── Recipe.swift            # Recipe, RecipeTag
│   └── User.swift              # User, DiagnosisDuration, Gender
├── ViewModels/
│   ├── OnboardingViewModel.swift
│   ├── HomeViewModel.swift
│   ├── LearnViewModel.swift
│   ├── RecipesViewModel.swift
│   └── JournalViewModel.swift
├── Views/
│   ├── Onboarding/             # WelcomeView → NameInputView → ProfileInputView
│   │                           #   → DiagnosisTimeView → NotificationPermissionView
│   ├── Home/                   # HomeView
│   ├── Learn/                  # LearnView, LessonDetailView, LessonPageView
│   ├── Recipes/                # RecipesView, RecipeDetailView, NewRecipeView
│   ├── Journal/                # JournalView, JournalEntryDetailView, NewJournalEntryView
│   ├── Settings/               # SettingsView
│   └── Components/             # CardView, MoodPickerView, ProgressBarView, …
├── MockData/
│   ├── MockLessons.swift       # 20 lessons, each with easy + scientific content
│   ├── MockRecipes.swift
│   └── MockJournalEntries.swift
└── ContentView.swift           # Root view — switches between onboarding and main tab bar
```

---

## Getting Started

1. Clone the repository
2. Open `PS_DiabetesApp.xcodeproj` in Xcode 15+
3. Select a simulator or device running iOS 16+
4. Build and run (`⌘R`)

No external dependencies, no package manager setup required.

> **To test onboarding again:** Go to Settings → Debug → *Onboarding zurücksetzen* (only visible in Debug builds), or reset the simulator via *Device → Erase All Content and Settings*.

---

## Notes

- **Language:** All user-facing text is in German.
- **Medical disclaimer:** This app is for educational purposes only and does not replace professional medical advice.
- **No persistence:** All data is in-memory. Nothing is saved between app launches — this is intentional for the current demo build.

---

## License

MIT — see [LICENSE](LICENSE).
