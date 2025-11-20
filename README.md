# CheckMe Todo

A premium, multi-platform Flutter productivity app that helps you capture, organize, and analyze your tasks with beautiful UI, rich animations, persistent local storage, and insightful analytics.

> Modern. Fast. Insightful. Built with Riverpod, SharedPreferences, and a custom design system.

---

## 🚀 Highlights

- **Multi-Platform**: Runs on Android, iOS, Web, macOS, Windows & Linux (Flutter).
- **Authentication (Local)**: Lightweight signup/login using stored accounts (SharedPreferences).
- **Task Management**: Create, edit, delete, categorize, search, filter, and complete todos.
- **Categories & Prioritization**: Personal, School, Work, Urgent with distinct colors & icons.
- **Due Dates & Overdue Detection**: Smart visual indicators and highlighting of overdue tasks.
- **Animated UI**: Polished motion (fade, slide, scale, tab transitions, premium navigation bar).
- **Analytics Dashboard**: Productivity score, category performance, weekly overview & distribution.
- **Achievements / Badges**: Dynamic unlocks based on completion milestones & behavior.
- **Light / Dark Themes**: Fully themed with a custom design system (colors, spacing, typography).
- **Persistent State**: Per-user task isolation and storage using `SharedPreferences`.
- **Search & Filtering**: Real-time search plus category filter bottom sheet.
- **Responsive Layout**: Adaptive styling suitable for different form factors.

---

## 📹 Demo Video (Placeholder)

> Embed your walkthrough or promo video here.

<!-- Replace this block with an actual embed or thumbnail -->
<p align="center">
  <a href="https://your-video-link.example" target="_blank">
    <img src="docs/media/demo-placeholder.png" alt="Demo Video" width="600" style="border-radius:12px;">
  </a>
</p>

```
<!-- Example Markdown for YouTube Embed (GitHub doesn't render iframe, so use thumbnail link): -->
[![Watch the demo](https://img.youtube.com/vi/VIDEO_ID/maxresdefault.jpg)](https://youtu.be/VIDEO_ID)
```

---

## 🧩 Architecture Overview

The app follows a **layered, provider-driven architecture** emphasizing declarative UI and reactive state.

| Layer | Responsibility | Implementation |
|-------|----------------|----------------|
| Models | Immutable domain entities & helpers | `Todo`, `User`, `UserBadge` enums/classes |
| State | Business logic & persistence | Riverpod `StateNotifier` (`AuthNotifier`, `TodoNotifier`, `ThemeNotifier`) |
| Persistence | Local storage per user | `SharedPreferences` (JSON encode/decode) |
| Presentation | Screens, widgets, theming | `screens/*`, `widgets/*`, `theme/app_theme.dart` |
| Derived State | Computed filters & projections | Providers: `filteredTodosProvider`, `completedTodosProvider`, etc. |

### Data Flow
1. UI reads reactive providers via `ref.watch(...)`.
2. User actions call notifier methods (`addTodo`, `login`, `setTheme`, etc.).
3. Notifiers mutate in-memory state & persist snapshots to `SharedPreferences`.
4. Derived providers recompute filtered views automatically.

### State Management: Why Riverpod?
- No need for BuildContext to access state.
- Compile-time safety & testability.
- Separation of concerns between UI & logic.

### Navigation
- Root: `MyApp` decides between `LandingScreen` (guest) vs `MainNavigation` (authenticated).
- `MainNavigation`: Animated bottom tab bar (Home / Analytics / Profile) using `IndexedStack`.

---

## 🛠 Tech Stack

| Category | Tools |
|----------|-------|
| Framework | Flutter (Material 3 + Google Fonts) |
| State Management | Riverpod (`flutter_riverpod`) |
| Persistence | `shared_preferences` |
| Internationalization / Formatting | `intl` (date formatting) |
| Theming & Fonts | Custom design tokens + `google_fonts` |
| Animations | Implicit & explicit animations (Controllers, Tweens, transitions) |

---

## 📂 Folder Structure

```
lib/
  main.dart               # App entry point & root MaterialApp
  models/                 # Core domain entities (todo, user, badges)
  providers/              # Riverpod notifiers & computed state providers
  screens/                # Feature screens (home, analytics, profile, auth, CRUD)
  theme/                  # Design system & themed configurations
  widgets/                # Reusable UI components (e.g., todo item)
  ...
```
Other platform directories (`android/`, `ios/`, `web/`, `macos/`, `windows/`, `linux/`) are auto-generated/managed by Flutter.

---

## ✅ Features In Detail

| Area | Details |
|------|---------|
| Auth | Local signup/login (email/password stored as plain text – NOT for production) |
| Todos | CRUD operations, per-user isolation, unique IDs, categories & due dates |
| Filters | Category selection bottom sheet, live search, overdue detection |
| Analytics | Weekly overview, productivity score, category performance, distribution charts |
| Achievements | Dynamic badges (Beginner → Organizer + streak & category mastery placeholders) |
| UI/UX | Animated transitions, gradient headers, premium navigation & stat cards |
| Theming | Light/Dark, semantic color tokens, design system spacing/radius/elevation |
| Persistence | JSON serialization into `SharedPreferences`, per-user keys |
| Extensibility | Modular providers simplify adding remote sync or notifications later |

---

## 🚧 Current Limitations / Security Notes
- Passwords stored in plain text (demo only). Replace with secure hashing & backend auth.
- No real-time sync or multi-device consistency.
- Streak & time-based badges partially stubbed (needs date tracking).
- Notifications & reminders not yet implemented.
- No accessibility audit performed (contrast, semantics, screen reader hints).

---

## 🗺 Roadmap / Future Improvements

| Priority | Idea |
|----------|------|
| High | Integrate secure backend (Firebase / Supabase) for auth & sync |
| High | Push/local notifications for due tasks |
| Medium | Real streak tracking & calendar history |
| Medium | Attachments or checklist subtasks per todo |
| Medium | Tagging & custom categories |
| Medium | Export/import data (JSON/CSV) |
| Low | Offline-first sync conflict resolution |
| Low | Localization & multi-language support |
| Low | Advanced analytics (trends, velocity, focus areas) |

Add or adjust these as the project evolves.

---

## 🔧 Getting Started

### Prerequisites
- Flutter SDK >= 3.0.0
- Dart >= 3.0.0
- A device/emulator or browser for Web

### Setup

```bash
# Clone the repository
git clone https://github.com/your-org/checkme_todo.git
cd checkme_todo

# Install dependencies
flutter pub get

# Run on a connected device or emulator
flutter run

# Run tests
flutter test
```

### Platform-Specific
- Web: `flutter run -d chrome`
- macOS/Linux/Windows: Ensure desktop support is enabled (`flutter config --enable-<platform>-desktop`).

---

## 🧪 Testing
- Includes default Flutter `widget_test.dart` (placeholder).
- Recommended additions:
  - Provider unit tests (`AuthNotifier`, `TodoNotifier`).
  - Golden tests for complex widgets.
  - Integration flow (signup → add → analytics).

---

## 🎨 Theming & Design System
Defined centrally in `theme/app_theme.dart`:
- Color primitives & gradients (`AppColors`).
- Spacing scale (`AppSpacing`).
- Radius, elevation, durations (`AppRadius`, `AppElevation`, `AppDuration`).
- Typography via Inter font (`google_fonts`).

Easily extendable for brand customization or dynamic theming.

---

## 🧠 State Management Summary
- Riverpod `StateNotifier` for mutable lists & user session.
- Derived providers project filtered/computed views (pending, completed, overdue, search, category).
- Separation of raw vs derived state encourages maintainable logic & testability.

---

## 📦 Persistence Strategy
- `SharedPreferences` stores:
  - Current user JSON
  - Account list JSON array
  - Per-user todo list (array of serialized todos)
- All serialization handled in model `toJson()` / `fromJson()` factories.

---

## 👥 Contributing

Contributions are welcome! Suggested workflow:
1. Fork the repo
2. Create a feature branch (`feat/your-feature-name`)
3. Commit with conventional messages (`feat: add overdue badge logic`)
4. Write/update tests where relevant
5. Open a Pull Request with a clear description & screenshots

Please also consider adding documentation for new providers or architectural changes.

---

## 📄 License

> No license file currently detected. Choose a license (e.g., MIT, Apache-2.0) and add a `LICENSE` file at the root.

Example MIT snippet:
```
MIT License
Copyright (c) YEAR YOUR NAME
Permission is hereby granted, free of charge, to any person obtaining a copy ...
```

---

## 🏷 Badges (Placeholders)

Add CI & quality badges once pipelines are configured:

```
![Flutter Analyze](https://img.shields.io/badge/analyze-passing-brightgreen)
![License](https://img.shields.io/badge/license-TBD-lightgrey)
![Platform](https://img.shields.io/badge/platform-Flutter-blue)
```

---

## 🔌 Extensibility Ideas
- Swap `SharedPreferences` for remote repository abstraction
- Add `AbstractTodoRepository` interface + implementations
- Introduce domain services (streak tracking, reminders)
- Feature flags for experimental widgets

---

## 🙌 Acknowledgements
- Flutter & Dart teams
- Riverpod maintainers
- Google Fonts (Inter)

---

## 📬 Contact
Add your contact or support channel here:
- Email: you@example.com
- Portfolio: https://your-portfolio.example
- LinkedIn: https://linkedin.com/in/your-handle

---

## ✅ Quick Checklist Before Publishing
- [ ] Add real LICENSE file
- [ ] Replace demo video placeholder
- [ ] Configure CI (format, analyze, test) & add badges
- [ ] Add secure auth backend (if going public)
- [ ] Expand tests beyond widget placeholder

---

Made with 💙 using Flutter & Riverpod.
