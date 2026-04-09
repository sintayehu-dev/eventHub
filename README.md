# EventHub 🎉

Your comprehensive event management platform built with Flutter. Create, manage, and coordinate events of all sizes with ease.

[![Flutter](https://img.shields.io/badge/Flutter-3%2B-blue?logo=flutter)](https://flutter.dev) [![Dart](https://img.shields.io/badge/Dart-3%2B-0175C2?logo=dart)](https://dart.dev) [![Firebase](https://img.shields.io/badge/Firebase-Enabled-orange?logo=firebase)](https://firebase.google.com) [![Architecture](https://img.shields.io/badge/Architecture-Clean-success)](#) [![License](https://img.shields.io/badge/License-MIT-black)](#)

## ✨ Features

- **Event Creation & Management**: Create and organize events with detailed information
- **QR Code Integration**: Generate and scan QR codes for event check-ins
- **Real-time Updates**: Firebase-powered real-time event updates
- **User Authentication**: Secure Firebase authentication system
- **Image Management**: Upload and manage event photos with Firebase Storage
- **Mobile Scanner**: Built-in QR/barcode scanning capabilities
- **Responsive Design**: Beautiful UI that works on all screen sizes

## 🏗️ Architecture

Built with Clean Architecture principles for maintainability and scalability:

```
lib/
├─ core/           # DI, routing, services, theme, utils
├─ features/       # Feature modules (auth, events, scanner, etc.)
│  ├─ auth/        # Authentication feature
│  ├─ events/      # Event management
│  └─ scanner/     # QR code scanning
└─ main.dart       # Entry point with Firebase initialization
```

## 🚀 Getting Started

### Prerequisites
- Flutter 3.5.4 or higher
- Dart 3.0 or higher
- Firebase project setup

### Installation

1. **Clone the repository**
   ```bash
   git clone <repository-url>
   cd eventhub
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Generate code**
   ```bash
   dart run build_runner build --delete-conflicting-outputs
   ```

4. **Firebase Setup**
   - Add your `google-services.json` to `android/app/`
   - Add your `GoogleService-Info.plist` to `ios/Runner/`
   - Ensure Firebase is configured for your project

5. **Run the app**
   ```bash
   flutter run
   ```

## 🛠️ Tech Stack

### Core Framework
- **Flutter**: Cross-platform mobile development
- **Dart**: Programming language

### State Management & Architecture
- **flutter_bloc**: State management with BLoC pattern
- **get_it**: Dependency injection
- **injectable**: Code generation for DI
- **freezed**: Immutable data classes
- **json_serializable**: JSON serialization

### Firebase Services
- **firebase_core**: Firebase initialization
- **firebase_auth**: User authentication
- **cloud_firestore**: NoSQL database
- **firebase_storage**: File storage

### Navigation & UI
- **go_router**: Declarative routing
- **google_fonts**: Custom fonts
- **flutter_screenutil**: Responsive design
- **flutter_svg**: SVG support
- **shimmer**: Loading animations

### Scanning & Media
- **mobile_scanner**: QR/barcode scanning
- **qr_flutter**: QR code generation
- **image_picker**: Image selection

### Additional Features
- **dio**: HTTP client
- **shared_preferences**: Local storage
- **permission_handler**: Device permissions
- **fluttertoast**: Toast notifications

## 📱 Key Features Implementation

### Event Management
- Create and edit events with rich details
- Upload event images and media
- Real-time event updates via Firestore

### QR Code System
- Generate unique QR codes for events
- Scan QR codes for quick event access
- Mobile scanner integration

### Authentication
- Firebase Authentication integration
- User registration and login
- Secure user session management

### Real-time Data
- Firestore real-time listeners
- Live event updates
- Synchronized data across devices

## 🔧 Configuration

### Firebase Configuration
1. Create a Firebase project at [Firebase Console](https://console.firebase.google.com)
2. Enable Authentication, Firestore, and Storage
3. Download configuration files:
   - `google-services.json` for Android
   - `GoogleService-Info.plist` for iOS
4. Place files in respective platform directories

### Environment Setup
- Update `lib/core/constants/app_constants.dart` with your API endpoints
- Configure Firebase security rules for your use case

## 🧪 Testing

```bash
# Run unit tests
flutter test

# Run integration tests
flutter test integration_test/
```

## 📦 Building

### Android
```bash
flutter build apk --release
# or
flutter build appbundle --release
```

### iOS
```bash
flutter build ios --release
```

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🙏 Acknowledgments

- Flutter team for the amazing framework
- Firebase for backend services
- Open source community for the packages used

---

Made with ❤️ for event organizers everywhere.
