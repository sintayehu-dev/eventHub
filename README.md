<div align="center">

# 🎪 Ethio Events

**A Comprehensive Event Management Ecosystem**

*Built with Flutter • Powered by Firebase • Designed for Scale*

[![Flutter](https://img.shields.io/badge/Flutter-3.5.4+-02569B?style=for-the-badge&logo=flutter)](https://flutter.dev) 
[![Dart](https://img.shields.io/badge/Dart-3.0+-0175C2?style=for-the-badge&logo=dart)](https://dart.dev) 
[![Firebase](https://img.shields.io/badge/Firebase-FFCA28?style=for-the-badge&logo=firebase&logoColor=black)](https://firebase.google.com)
[![Clean Architecture](https://img.shields.io/badge/Architecture-Clean-4CAF50?style=for-the-badge)](https://blog.cleancoder.com/uncle-bob/2012/08/13/the-clean-architecture.html)
[![BLoC](https://img.shields.io/badge/State-BLoC-FF6B6B?style=for-the-badge)](https://bloclibrary.dev/)

</div>

---

## 📖 Table of Contents

- [🌟 Project Overview](#-project-overview)
- [✨ Implemented Features](#-implemented-features)
- [🎯 User Roles & Authentication](#-user-roles--authentication)
- [🏗️ Architecture](#️-architecture)
- [🛠️ Technology Stack](#️-technology-stack)
- [🚀 Getting Started](#-getting-started)
- [📱 Current Implementation](#-current-implementation)
- [🧪 Testing](#-testing)
- [📦 Build & Deploy](#-build--deploy)
- [🎯 Skills Demonstrated](#-skills-demonstrated)
- [📊 Project Metrics](#-project-metrics)
- [🤝 Contributing](#-contributing)
- [📄 License](#-license)

---

## 🌟 Project Overview

Ethio Events is a **Flutter-based event management platform** that demonstrates advanced mobile development skills through clean architecture, multi-role authentication, and real-time data management. The application serves three distinct user types with role-based interfaces and functionality.

### 🎯 What's Currently Implemented

- **🏢 Multi-Role Authentication**: Complete registration and login system for Attendees, Organizers, and Staff
- **🏗️ Clean Architecture**: Domain-driven design with clear separation of concerns
- **🔥 Firebase Integration**: Authentication, Firestore database, and Cloud Storage
- **🎨 Modern UI**: Material Design 3 with custom theming and responsive design
- **📱 Profile Management**: User profiles with Cloudinary image uploads
- **🎪 Event Management**: Full CRUD operations for events with image uploads

---

## ✨ Implemented Features

### 🔐 **Authentication System**
- ✅ **Multi-Role Registration** - Users can register as Attendee, Organizer, or Staff
- ✅ **Secure Login** - Email/password authentication with Firebase Auth
- ✅ **Password Reset** - Forgot password functionality
- ✅ **Role-Based Routing** - Automatic navigation based on user role
- ✅ **Profile Management** - Edit name, email, and profile pictures

### 👥 **For Attendees**
- ✅ **Event Discovery** - Browse and search available events
- ✅ **Event Details** - View comprehensive event information
- ✅ **Ticket Purchase** - Purchase tickets with Ethiopian Birr pricing
- ✅ **Digital Wallet** - Manage purchased tickets with QR codes
- ✅ **Profile Management** - Personal profile with image upload

### 🎪 **For Organizers**
- ✅ **Event Creation** - Create events with banner images and details
- ✅ **Event Management** - Edit and manage existing events
- ✅ **Analytics Dashboard** - View event statistics and insights
- ✅ **Staff Management** - Manage staff assignments and roles
- ✅ **Attendee Management** - Track event registrations
- ✅ **Profile Management** - Organizer profile with customization

### 👨‍💼 **For Staff**
- ✅ **Event Assignment** - View assigned events and tasks
- ✅ **Profile Management** - Staff profile management
- 🚧 **QR Scanner** - Ticket validation (UI implemented, scanning in progress)
- 🚧 **Check-In System** - Attendee check-in management (in development)
- 🚧 **Reports** - Generate operational reports (planned)

---

## 🎯 User Roles & Authentication

### 🔐 Authentication Flow
```
Registration → Role Selection (Attendee/Organizer/Staff) → Profile Setup → Role-Based Dashboard
```

### 👥 User Capabilities

| Feature | Attendee | Organizer | Staff |
|---------|----------|-----------|-------|
| **Event Discovery** | ✅ Browse & Search | ✅ View All Events | ✅ View Assigned Events |
| **Event Management** | ❌ | ✅ Full CRUD | ❌ |
| **Ticket Purchase** | ✅ | ❌ | ❌ |
| **Staff Management** | ❌ | ✅ | ❌ |
| **Analytics** | ❌ | ✅ | ✅ Limited |
| **Profile Management** | ✅ | ✅ | ✅ |

---

## 🏗️ Architecture

Built with **Clean Architecture** principles ensuring maintainability, testability, and scalability.

### 📁 Project Structure

```
lib/
├── 🔧 core/                     # Shared Infrastructure
│   ├── di/                      # Dependency Injection (GetIt + Injectable)
│   ├── theme/                   # Material 3 Design System
│   ├── router/                  # GoRouter Navigation
│   ├── services/                # External Services (Cloudinary)
│   ├── widgets/                 # Reusable UI Components
│   └── utils/                   # Helper Functions
│
├── 🎪 features/                 # Feature Modules
│   ├── 🔐 auth/                 # Authentication & Registration
│   │   ├── presentation/        # Login/Register UI
│   │   ├── application/         # BLoC State Management
│   │   ├── domain/              # User Entities & Use Cases
│   │   └── infrastructure/      # Firebase Auth Implementation
│   │
│   ├── 👥 attendee/             # Attendee Features
│   │   ├── event_discovery/     # Browse & Search Events
│   │   ├── ticket_purchase/     # Purchase Tickets
│   │   ├── ticket_wallet/       # Digital Ticket Management
│   │   └── profile/             # Attendee Profile
│   │
│   ├── 🎪 organizer/            # Organizer Features
│   │   ├── event_management/    # Create & Manage Events
│   │   ├── analytics/           # Event Analytics Dashboard
│   │   ├── staff_management/    # Staff Coordination
│   │   ├── attendee_management/ # Attendee Tracking
│   │   └── profile/             # Organizer Profile
│   │
│   ├── 👨‍💼 staff/               # Staff Features
│   │   ├── event_assignment/    # View Assigned Events
│   │   ├── ticket_scanner/      # QR Code Scanning (in progress)
│   │   ├── attendee_management/ # Check-In System (in progress)
│   │   ├── reports/             # Report Generation (planned)
│   │   └── profile/             # Staff Profile
│   │
│   └── 🤝 shared/               # Shared Components
│       ├── event_details/       # Common Event UI Components
│       └── profile/             # Shared Profile Management
│
└── 🚀 main.dart                # Application Entry Point
```

### 🔄 Architecture Layers

1. **🎨 Presentation Layer** - UI components, pages, and BLoC consumers
2. **⚙️ Application Layer** - BLoC state management and business logic
3. **🏛️ Domain Layer** - Core business entities, use cases, and repository contracts
4. **🔌 Infrastructure Layer** - Firebase services, Cloudinary integration, and data sources

---

## 🛠️ Technology Stack

### 🎯 Core Technologies

| Category | Technology | Version |
|----------|------------|---------|
| **Framework** | Flutter | 3.5.4+ |
| **Language** | Dart | 3.5.4+ |
| **State Management** | BLoC Pattern | 8.1.6 |
| **Backend** | Firebase | Latest |
| **Navigation** | GoRouter | 14.7.2 |
| **Dependency Injection** | GetIt + Injectable | 8.0.3 |
| **Image Management** | Cloudinary | 1.1.0 |

### 📦 Key Dependencies

<details>
<summary><strong>🎨 UI & Design (4 packages)</strong></summary>

- `flutter_screenutil` (5.9.3) - Responsive design system
- `google_fonts` (6.2.1) - Typography management
- `smooth_page_indicator` (1.2.1) - Page indicators
- `qr_flutter` (4.1.0) - QR code generation

</details>

<details>
<summary><strong>🏗️ Architecture & State (6 packages)</strong></summary>

- `flutter_bloc` (8.1.6) - BLoC pattern implementation
- `bloc` (8.1.4) - Core BLoC library
- `get_it` (8.0.3) - Service locator
- `injectable` (2.5.0) - DI code generation
- `freezed_annotation` (2.4.4) - Immutable data classes
- `dartz` (0.10.1) - Functional programming

</details>

<details>
<summary><strong>🔥 Firebase & Backend (4 packages)</strong></summary>

- `firebase_core` (3.8.0) - Firebase initialization
- `firebase_auth` (5.3.3) - Authentication
- `cloud_firestore` (5.5.0) - NoSQL database
- `firebase_storage` (12.3.6) - File storage

</details>

<details>
<summary><strong>📱 Device & Platform (6 packages)</strong></summary>

- `mobile_scanner` (5.2.3) - QR/Barcode scanning
- `image_picker` (1.0.7) - Camera/gallery access
- `permission_handler` (11.3.0) - Device permissions
- `device_info_plus` (9.1.1) - Device information
- `connectivity_plus` (6.1.2) - Network monitoring
- `cloudinary` (1.1.0) - Image management service

</details>

<details>
<summary><strong>🔧 Utilities (5 packages)</strong></summary>

- `go_router` (14.7.2) - Declarative routing
- `shared_preferences` (2.5.1) - Local storage
- `dio` (5.8.0+1) - HTTP client
- `fluttertoast` (8.2.11) - Toast notifications
- `json_annotation` (4.9.0) - JSON serialization

</details>

---

## 🚀 Getting Started

### 📋 Prerequisites

```bash
Flutter SDK: >=3.5.4
Dart SDK: >=3.5.4
Android Studio / VS Code
Git
Firebase Account
Cloudinary Account
```

### ⚡ Quick Setup

1. **Clone Repository**
   ```bash
   git clone https://github.com/yourusername/ethio-events.git
   cd ethio-events
   ```

2. **Install Dependencies**
   ```bash
   flutter pub get
   ```

3. **Generate Code**
   ```bash
   dart run build_runner build --delete-conflicting-outputs
   ```

4. **Firebase Setup**
   - Create Firebase project at [console.firebase.google.com](https://console.firebase.google.com)
   - Enable Authentication, Firestore, and Storage
   - Download config files:
     - `android/app/google-services.json`
     - `ios/Runner/GoogleService-Info.plist`

5. **Cloudinary Setup**
   - Create account at [cloudinary.com](https://cloudinary.com)
   - Configure your credentials in the app

6. **Run Application**
   ```bash
   flutter run
   ```

### 🔧 Development Commands

```bash
# Run with hot reload
flutter run --hot

# Run tests
flutter test

# Build for production
flutter build apk --release

# Analyze code
flutter analyze

# Format code
dart format .

# Generate dependency injection
dart run build_runner build
```

---

## 📱 Current Implementation

### ✅ **Fully Implemented**
- Multi-role authentication system
- User registration and login
- Profile management with image uploads
- Event creation and management
- Event discovery and browsing
- Ticket purchase system
- Digital ticket wallet
- Role-based navigation
- Responsive UI design
- Firebase integration
- Cloudinary image management

### 🚧 **In Progress**
- QR code ticket scanning
- Staff check-in system
- Advanced analytics dashboard
- Real-time notifications

### 📋 **Planned Features**
- Staff report generation
- Event sharing functionality
- Broadcast messaging
- Export data functionality
- Advanced search filters
- Payment gateway integration

---

## 🧪 Testing

### 📊 Test Setup

```bash
# Run all tests
flutter test

# Run with coverage
flutter test --coverage

# Run specific test files
flutter test test/unit/
flutter test test/widget/
```

### 🔬 Testing Dependencies

- `flutter_test` - Widget and unit testing
- `bloc_test` (9.1.7) - BLoC testing utilities
- `mocktail` (1.0.4) - Mocking framework
- `very_good_analysis` (6.0.0) - Linting rules

---

## 📦 Build & Deploy

### 🤖 Android

```bash
# Debug build
flutter build apk --debug

# Release build
flutter build apk --release
flutter build appbundle --release
```

### 🍎 iOS

```bash
# Debug build
flutter build ios --debug

# Release build
flutter build ios --release
```

### 🌐 Web

```bash
# Web build
flutter build web --release
```

---

## 🎯 Skills Demonstrated

### 💻 **Technical Expertise**

- ✅ **Flutter Framework** - Advanced widget composition and state management
- ✅ **Clean Architecture** - Scalable code organization and separation of concerns
- ✅ **BLoC Pattern** - Complex state management with real-time updates
- ✅ **Firebase Integration** - Authentication, Firestore, and Cloud Storage
- ✅ **Multi-Role Systems** - Role-based authentication and navigation
- ✅ **Image Management** - Cloudinary integration for optimized image handling
- ✅ **Responsive Design** - Multi-device compatibility with ScreenUtil
- ✅ **Code Generation** - Automated code generation with build_runner

### 🎨 **Design & UX**

- ✅ **Material Design 3** - Modern UI implementation
- ✅ **Custom Theming** - Consistent brand experience
- ✅ **Responsive Layout** - Adaptive design for different screen sizes
- ✅ **User Experience** - Intuitive navigation and user flows
- ✅ **Visual Hierarchy** - Clear information architecture

### 🏗️ **Software Engineering**

- ✅ **Domain-Driven Design** - Business logic modeling
- ✅ **SOLID Principles** - Clean code practices
- ✅ **Dependency Injection** - Loose coupling and testability
- ✅ **Repository Pattern** - Data access abstraction
- ✅ **Error Handling** - Comprehensive error management
- ✅ **Code Quality** - Linting and static analysis

---

## 📊 Project Metrics

<div align="center">

| Metric | Value |
|--------|-------|
| 📁 **Total Files** | 300+ |
| 📝 **Lines of Code** | 15,000+ |
| 🎯 **Features** | 25+ |
| 👥 **User Roles** | 3 |
| 📱 **Screens** | 30+ |
| 🔧 **Dependencies** | 25+ |
| 🏗️ **Architecture Layers** | 4 |
| 📦 **Feature Modules** | 5 |

</div>

---

## 🤝 Contributing

### 🌟 **How to Contribute**

1. **🍴 Fork** the repository
2. **🌿 Create** feature branch (`git checkout -b feature/amazing-feature`)
3. **💻 Commit** changes (`git commit -m 'Add amazing feature'`)
4. **🚀 Push** to branch (`git push origin feature/amazing-feature`)
5. **📝 Open** Pull Request

### 📋 **Development Guidelines**

- Follow [Effective Dart](https://dart.dev/guides/language/effective-dart) guidelines
- Use conventional commit messages
- Ensure code passes `flutter analyze`
- Add tests for new features
- Update documentation as needed

---

## 📄 License

This project is licensed under the **MIT License** - see the [LICENSE](LICENSE) file for details.

---

<div align="center">

## 🌟 **About This Project**

*Ethio Events demonstrates production-ready Flutter development skills, showcasing clean architecture, multi-role authentication, and modern mobile development practices.*

---

**Made with ❤️ by a passionate Flutter developer**

*"Building scalable mobile solutions with clean architecture and modern practices."*

</div>