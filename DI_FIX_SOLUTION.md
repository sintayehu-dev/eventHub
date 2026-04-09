# Dependency Injection Fix for FirebaseTicketScannerDataSource

## Problem
The error `[FirebaseTicketScannerDataSource] depends on unregistered type [FirebaseFirestore]` indicates that the dependency injection system cannot find the `FirebaseFirestore` registration.

## Root Cause
1. The code generation for dependency injection was out of sync
2. The `FirebaseTicketScannerDataSource` constructor had an optional parameter instead of required

## Solution Applied

### 1. Fixed Constructor Dependency Injection
Changed the constructor in `FirebaseTicketScannerDataSource` from:
```dart
FirebaseTicketScannerDataSource({
  FirebaseFirestore? firestore,
}) : _firestore = firestore ?? FirebaseFirestore.instance;
```

To:
```dart
FirebaseTicketScannerDataSource({
  required FirebaseFirestore firestore,
}) : _firestore = firestore;
```

### 2. Added FirebaseModule Import
Added the missing import in `lib/core/di/dependancy_manager.dart`:
```dart
import 'package:eventhub/core/di/firebase_module.dart';
```

### 3. Code Generation Fix
Run the provided `fix_di.bat` script to regenerate the dependency injection configuration:

```bash
flutter clean
dart pub get
dart run build_runner build --delete-conflicting-outputs
```

## Verification
After running the fix script, the following should be properly registered:
- `FirebaseFirestore` (from FirebaseModule)
- `FirebaseAuth` (from FirebaseModule)  
- `GoogleSignIn` (from FirebaseModule)
- `FirebaseTicketScannerDataSource` (with proper FirebaseFirestore injection)
- `TicketScannerRepository` (with proper FirebaseTicketScannerDataSource injection)

## Next Steps
1. Run `fix_di.bat`
2. Verify the build completes without DI errors
3. Test the ticket scanner functionality