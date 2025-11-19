# 📱 CheckMe Todo - Premium Task Management App# checkme_todo



<div align="center">A new Flutter project.



![Flutter](https://img.shields.io/badge/Flutter-3.0%2B-02569B?style=for-the-badge&logo=flutter&logoColor=white)## Getting Started

![Dart](https://img.shields.io/badge/Dart-3.0%2B-0175C2?style=for-the-badge&logo=dart&logoColor=white)

![Riverpod](https://img.shields.io/badge/Riverpod-2.4.9-00ACC1?style=for-the-badge)This project is a starting point for a Flutter application.

![License](https://img.shields.io/badge/License-MIT-green?style=for-the-badge)

A few resources to get you started if this is your first Flutter project:

**A beautiful, feature-rich todo application built with Flutter featuring real authentication, user-specific data, and a premium UI/UX design.**

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)

[Features](#-features) • [Screenshots](#-screenshots) • [Demo Video](#-demo-video) • [Installation](#-installation) • [Architecture](#-architecture) • [Technologies](#-technologies)- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)



</div>For help getting started with Flutter development, view the

[online documentation](https://docs.flutter.dev/), which offers tutorials,

---samples, guidance on mobile development, and a full API reference.


## ✨ Features

### 🔐 **Authentication System**
- **Real User Accounts** - Create actual accounts with email and password
- **Secure Login** - Credential verification with error handling
- **Data Isolation** - Each user has completely isolated, personal todo data
- **Persistent Sessions** - Stay logged in across app restarts
- **Multiple Account Support** - Switch between different user accounts

### ✅ **Todo Management**
- **Create & Edit Todos** - Rich todo creation with titles, descriptions, and due dates
- **Category Organization** - Organize tasks by Personal, Work, School, or Urgent
- **Smart Filtering** - Filter todos by category and search by keywords
- **Due Date Tracking** - Set and track due dates with overdue indicators
- **Status Management** - Mark todos as complete/incomplete with visual feedback
- **Detailed View** - View full todo details with edit and delete options

### 📊 **Analytics & Insights**
- **Productivity Score** - Real-time calculation of your productivity
- **Category Performance** - Visualize task distribution across categories
- **Weekly Progress** - Track completed tasks throughout the week
- **Task Distribution** - See breakdown of completed, pending, and overdue tasks
- **Completion Rate** - Monitor your overall task completion percentage
- **Smart Insights** - Get personalized productivity insights

### 👤 **User Profile**
- **Achievement Badges** - Unlock badges for milestones (First Task, 10 Tasks, 25 Tasks, etc.)
- **Statistics Dashboard** - View total, completed, and pending task counts
- **Theme Switching** - Toggle between Light, Dark, and System themes
- **Profile Customization** - Personalized avatars and user information
- **Data Management** - Clear insights into your productivity journey

### 🎨 **Premium UI/UX**
- **Modern Design** - Clean, professional interface with gradient accents
- **Smooth Animations** - Fluid transitions and micro-interactions
- **Dark Mode Support** - Beautiful dark theme with optimized colors
- **Responsive Layout** - Adapts perfectly to different screen sizes
- **Custom Navigation** - Sleek bottom navigation with gradient highlights
- **Consistent Theming** - Unified color palette across all screens

### 🔔 **Smart Features**
- **Overdue Detection** - Automatic identification of overdue tasks
- **Daily Quotes** - Motivational quotes to keep you inspired
- **Greeting System** - Time-based greetings (Good Morning, Afternoon, Evening)
- **Empty States** - Helpful messages when no tasks exist
- **Search Functionality** - Quickly find tasks with real-time search
- **Batch Operations** - Efficiently manage multiple tasks

---

## 📸 Screenshots

<div align="center">

### Landing & Authentication
| Landing Screen | Login Screen | Signup Screen |
|:---:|:---:|:---:|
| Beautiful onboarding | Secure login | Easy registration |

### Main Features
| Home Screen | Analytics | Profile |
|:---:|:---:|:---:|
| Task overview | Productivity insights | User dashboard |

### Task Management
| Add Todo | Todo Details | Category Filter |
|:---:|:---:|:---:|
| Create new tasks | View & edit | Filter by category |

### Themes
| Light Mode | Dark Mode |
|:---:|:---:|
| Clean & bright | Easy on the eyes |

</div>

---

## 🎥 Demo Video

<!-- Replace this section with your demo video -->
<div align="center">

### 📹 Watch the App in Action

*Coming Soon - Video demonstration showing all features and user flow*

<!-- When ready, embed your video like this:
[![CheckMe Todo Demo](thumbnail.png)](your-video-link)

Or use direct video embed:
<video width="100%" controls>
  <source src="demo-video.mp4" type="video/mp4">
</video>
-->

**Video will showcase:**
- 🎬 User authentication flow (signup & login)
- ✅ Creating and managing todos
- 🔍 Filtering and searching tasks
- 📊 Analytics dashboard with insights
- 👤 Profile customization
- 🌓 Theme switching (light/dark mode)
- ✨ Overall user experience and animations

</div>

---

## 🚀 Installation

### Prerequisites
- Flutter SDK (3.0 or higher)
- Dart SDK (3.0 or higher)
- Android Studio / VS Code with Flutter extension
- An Android emulator or iOS simulator

### Steps

1. **Clone the repository**
   ```bash
   git clone https://github.com/yourusername/checkme-todo.git
   cd checkme-todo
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Run the app**
   ```bash
   # For Android
   flutter run
   
   # For iOS
   flutter run -d ios
   
   # For Web
   flutter run -d chrome
   ```

4. **Build for production**
   ```bash
   # Android APK
   flutter build apk --release
   
   # iOS
   flutter build ios --release
   
   # Web
   flutter build web --release
   ```

---

## 🏗️ Architecture

### Project Structure

```
lib/
├── main.dart                 # App entry point
├── models/                   # Data models
│   ├── user.dart            # User model
│   ├── todo.dart            # Todo model with categories
│   └── badge.dart           # Achievement badge system
├── providers/               # State management (Riverpod)
│   ├── auth_provider.dart   # Authentication logic
│   ├── todo_provider.dart   # Todo CRUD operations
│   └── theme_provider.dart  # Theme management
├── screens/                 # UI screens
│   ├── landing_screen.dart  # Onboarding
│   ├── login_screen.dart    # User login
│   ├── signup_screen.dart   # User registration
│   ├── main_navigation.dart # Bottom navigation
│   ├── home_screen.dart     # Todo list view
│   ├── add_todo_screen.dart # Create/edit todo
│   ├── todo_detail_screen.dart # Todo details
│   ├── analytics_screen.dart   # Statistics
│   └── profile_screen.dart     # User profile
├── widgets/                 # Reusable components
│   └── todo_item.dart       # Todo list item widget
└── theme/                   # App theming
    └── app_theme.dart       # Colors, styles, themes
```

### State Management

**Riverpod** is used for robust, testable state management:

- `authProvider` - Manages user authentication state
- `todoProvider` - Handles todo CRUD operations and user-specific data
- `themeModeProvider` - Controls app theme (light/dark/system)
- `filteredTodosProvider` - Computed state for filtered/searched todos
- `completedTodosProvider` - Derived state for completed tasks
- `pendingTodosProvider` - Derived state for pending tasks
- `overdueTodosProvider` - Derived state for overdue tasks

### Data Persistence

**SharedPreferences** is used for local data storage:

- User accounts: `user_accounts` (JSON array)
- Current user session: `current_user` (JSON object)
- User-specific todos: `todos_{userEmail}` (JSON array per user)
- Theme preference: `theme_mode` (string)

---

## 💻 Technologies

### Core
- **Flutter** - Cross-platform UI framework
- **Dart** - Programming language
- **Material Design 3** - Modern UI components

### State Management
- **Riverpod 2.4.9** - Robust state management solution
- **StateNotifier** - Managing complex state logic

### Data & Storage
- **SharedPreferences 2.2.2** - Local data persistence
- **JSON Serialization** - Data encoding/decoding

### UI/UX
- **Google Fonts 6.1.0** - Custom typography
- **Intl 0.19.0** - Date formatting and localization
- **Custom Animations** - Smooth transitions and interactions

### Development
- **Flutter Lints 3.0.0** - Code quality and best practices

---

## 🎨 Design System

### Color Palette

- **Primary**: Vibrant Teal (#00ACC1) - Energy and productivity
- **Accent**: Warm Coral (#FF6F61) - Highlights and CTAs
- **Success**: Green (#10B981) - Completed tasks
- **Warning**: Amber (#F59E0B) - Urgent items
- **Error**: Red (#EF4444) - Overdue/delete actions
- **Info**: Blue (#3B82F6) - Information and tips

### Typography

Custom Google Fonts with carefully chosen weights for hierarchy and readability.

### Spacing Scale

Consistent spacing using multiples of 4px (xs: 4, sm: 8, md: 16, lg: 24, xl: 32, xxl: 48, xxxl: 64)

---

## 🔑 Key Features Explained

### User Authentication Flow

1. **Signup**: User creates account → Email validation → Password security check → Account stored locally
2. **Login**: Email verification → Password verification → Session creation → Redirect to app
3. **Data Isolation**: Each user's todos stored separately using email as unique identifier
4. **Logout**: Session cleared → Return to landing screen

### Todo Categories

- **Personal** 💜 - Personal tasks and errands
- **Work** ❤️ - Professional and work-related tasks
- **School** 💙 - Academic and learning tasks
- **Urgent** 🧡 - Time-sensitive priorities

### Achievement System

Unlock badges as you progress:
- 🚀 **Getting Started** - Complete your first todo
- 🏆 **Task Master** - Complete 10 todos
- 📈 **Productivity Pro** - Complete 25 todos
- 👑 **Super Organizer** - Complete 50 todos
- 🔥 **7-Day Streak** - Complete todos for 7 consecutive days
- ⭐ **Category Expert** - Complete tasks in all categories

---

## 📱 Platform Support

| Platform | Status |
|----------|--------|
| Android  | ✅ Fully Supported |
| iOS      | ✅ Fully Supported |
| Web      | ✅ Supported |
| Windows  | ⚠️ Experimental |
| macOS    | ⚠️ Experimental |
| Linux    | ⚠️ Experimental |

---

## 🤝 Contributing

Contributions are welcome! Please follow these steps:

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

---

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---

## 👨‍💻 Author

**Your Name**
- GitHub: [@yourusername](https://github.com/yourusername)
- Email: your.email@example.com

---

## 🙏 Acknowledgments

- Flutter team for the amazing framework
- Riverpod community for excellent state management
- Material Design for design inspiration
- All open-source contributors

---

## 📞 Support

If you encounter any issues or have questions:
- Open an issue on GitHub
- Email: support@yourapp.com
- Documentation: [Wiki](https://github.com/yourusername/checkme-todo/wiki)

---

<div align="center">

### ⭐ Star this repository if you find it helpful!

**Made with ❤️ using Flutter**

</div>
