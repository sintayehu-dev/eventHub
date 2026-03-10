# EventHub Authentication Feature Implementation Guide

## Overview

The EventHub authentication system is built using Clean Architecture principles with Firebase integration. This guide provides a comprehensive overview of the authentication feature implementation, including architecture, components, and usage patterns.

## Architecture Overview

The authentication feature follows Clean Architecture with clear separation of concerns:

```
lib/features/auth/
├── application/          # BLoC state management
│   ├── login/
│   ├── registration/
│   ├── verification/
│   └── splash/
├── domain/              # Business logic & entities
│   ├── entities/
│   ├── repositories/
│   └── user/
├── infrastructure/      # External services & data sources
│   └── auth/
└── presentation/        # UI components
    └── pages/
```

## Core Components

### 1. Domain Layer

#### Entities

**LoginRequest**
```dart
@freezed
class LoginRequest with _$LoginRequest {
  const factory LoginRequest({
    required String email,
    required String password,
  }) = _LoginRequest;
}
```

**LoginResponse & LoginUser**
```dart
@freezed
class LoginResponse with _$LoginResponse {
  const factory LoginResponse({
    required String session_id,
    required String access_token,
    required DateTime access_token_expires_at,
    required String refresh_token,
    required DateTime refresh_token_expires_at,
    required LoginUser user,
  }) = _LoginResponse;
}

@freezed
class LoginUser with _$LoginUser {
  const factory LoginUser({
    required String email,
    required String first_name,
    required String last_name,
    required String avatar,
    required DateTime created_at,
  }) = _LoginUser;
}
```

**RegistrationRequest**
```dart
@freezed
class RegistrationRequest with _$RegistrationRequest {
  const factory RegistrationRequest({
    required Name firstName,
    required Name lastName,
    required EmailAddress email,
    required Password password,
    required ConfirmPassword confirmPassword,
    required TermsAcceptance termsAcceptance,
    required ProfilePhoto profilePhoto,
  }) = _Registration;
}
```

#### Repository Interface

```dart
abstract class AuthRepository {
  Future<Either<NetworkExceptions, RegistrationResponse>> register(RegistrationRequest registration);
  Future<Either<NetworkExceptions, VerificationCodeResponse>> sendVerificationCode(String phoneNumber);
  Future<Either<NetworkExceptions, VerificationConfirmResponse>> verifyOtp(String phoneNumber, String otp);
  Future<Either<NetworkExceptions, LoginResponse>> login(LoginRequest loginRequest);
  Future<Either<NetworkExceptions, LoginResponse>> googleLogin(String idToken);
}
```

#### User Service

```dart
abstract class UserService {
  LoginUser? getCurrentUser();
  bool isFirstTimeOpeningApp();
  void setFirstTimeOpeningApp();
  bool isLoggedIn();
  Future<void> logout();
}
```

### 2. Application Layer (BLoC)

#### Login BLoC Structure
```dart
// Events
abstract class LoginEvent {}
class LoginSubmitted extends LoginEvent {
  final String email;
  final String password;
}
class GoogleLoginRequested extends LoginEvent {}

// States
abstract class LoginState {}
class LoginInitial extends LoginState {}
class LoginLoading extends LoginState {}
class LoginSuccess extends LoginState {
  final LoginResponse response;
}
class LoginFailure extends LoginState {
  final String message;
}

// BLoC
class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthRepository _authRepository;
  final UserService _userService;
  
  LoginBloc(this._authRepository, this._userService) : super(LoginInitial()) {
    on<LoginSubmitted>(_onLoginSubmitted);
    on<GoogleLoginRequested>(_onGoogleLoginRequested);
  }
}
```

#### Registration BLoC Structure
```dart
// Events
abstract class RegistrationEvent {}
class RegistrationFormChanged extends RegistrationEvent {
  final RegistrationRequest registration;
}
class RegistrationSubmitted extends RegistrationEvent {}

// States
abstract class RegistrationState {}
class RegistrationInitial extends RegistrationState {}
class RegistrationInProgress extends RegistrationState {}
class RegistrationSuccess extends RegistrationState {}
class RegistrationFailure extends RegistrationState {
  final String message;
}
```

### 3. Infrastructure Layer

#### Repository Implementation
```dart
@Injectable(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource _remoteDataSource;
  
  AuthRepositoryImpl(this._remoteDataSource);

  @override
  Future<Either<NetworkExceptions, LoginResponse>> login(LoginRequest loginRequest) async {
    try {
      final response = await _remoteDataSource.login(
        loginRequest.email, 
        loginRequest.password
      );
      return right(response);
    } on DioException catch (e) {
      return left(NetworkExceptions.getDioException(e));
    }
  }
}
```

#### Firebase Integration Points
```dart
// Firebase Auth integration
class FirebaseAuthDataSource {
  final FirebaseAuth _firebaseAuth;
  
  Future<UserCredential> signInWithEmailAndPassword(String email, String password) {
    return _firebaseAuth.signInWithEmailAndPassword(
      email: email, 
      password: password
    );
  }
  
  Future<UserCredential> createUserWithEmailAndPassword(String email, String password) {
    return _firebaseAuth.createUserWithEmailAndPassword(
      email: email, 
      password: password
    );
  }
  
  Future<UserCredential> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;
    
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    
    return await _firebaseAuth.signInWithCredential(credential);
  }
}
```

### 4. Presentation Layer

#### Login Screen Structure
```dart
class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<LoginBloc>(),
      child: BlocConsumer<LoginBloc, LoginState>(
        listener: (context, state) {
          if (state is LoginSuccess) {
            context.go('/home');
          } else if (state is LoginFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message)),
            );
          }
        },
        builder: (context, state) {
          return Scaffold(
            body: LoginForm(),
          );
        },
      ),
    );
  }
}
```

## Implementation Steps

### Step 1: Firebase Setup

1. **Add Firebase Configuration**
   ```dart
   // In bootstrap.dart
   await Firebase.initializeApp();
   ```

2. **Configure Firebase Auth**
   ```dart
   // Add to dependency injection
   @module
   abstract class FirebaseModule {
     @lazySingleton
     FirebaseAuth get firebaseAuth => FirebaseAuth.instance;
     
     @lazySingleton
     FirebaseFirestore get firebaseFirestore => FirebaseFirestore.instance;
   }
   ```

### Step 2: Update Domain Layer

1. **Create Firebase-specific entities**
   ```dart
   @freezed
   class FirebaseUser with _$FirebaseUser {
     const factory FirebaseUser({
       required String uid,
       required String email,
       String? displayName,
       String? photoURL,
       required bool emailVerified,
     }) = _FirebaseUser;
   }
   ```

2. **Update AuthRepository interface**
   ```dart
   abstract class AuthRepository {
     // Existing methods...
     
     // Firebase-specific methods
     Future<Either<NetworkExceptions, FirebaseUser>> signInWithFirebase(String email, String password);
     Future<Either<NetworkExceptions, FirebaseUser>> registerWithFirebase(String email, String password);
     Future<Either<NetworkExceptions, FirebaseUser>> signInWithGoogle();
     Future<Either<NetworkExceptions, void>> signOut();
     Stream<FirebaseUser?> get authStateChanges;
   }
   ```

### Step 3: Implement Firebase Integration

1. **Create Firebase Data Source**
   ```dart
   @Injectable()
   class FirebaseAuthDataSource {
     final FirebaseAuth _firebaseAuth;
     
     FirebaseAuthDataSource(this._firebaseAuth);
     
     Future<User?> signInWithEmailAndPassword(String email, String password) async {
       final credential = await _firebaseAuth.signInWithEmailAndPassword(
         email: email,
         password: password,
       );
       return credential.user;
     }
     
     Future<User?> createUserWithEmailAndPassword(String email, String password) async {
       final credential = await _firebaseAuth.createUserWithEmailAndPassword(
         email: email,
         password: password,
       );
       return credential.user;
     }
     
     Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();
   }
   ```

2. **Update Repository Implementation**
   ```dart
   @Injectable(as: AuthRepository)
   class AuthRepositoryImpl implements AuthRepository {
     final AuthRemoteDataSource _remoteDataSource;
     final FirebaseAuthDataSource _firebaseDataSource;
     
     AuthRepositoryImpl(this._remoteDataSource, this._firebaseDataSource);
     
     @override
     Future<Either<NetworkExceptions, FirebaseUser>> signInWithFirebase(
       String email, 
       String password
     ) async {
       try {
         final user = await _firebaseDataSource.signInWithEmailAndPassword(email, password);
         if (user != null) {
           return right(FirebaseUser(
             uid: user.uid,
             email: user.email!,
             displayName: user.displayName,
             photoURL: user.photoURL,
             emailVerified: user.emailVerified,
           ));
         }
         return left(const NetworkExceptions.unauthorisedRequest());
       } catch (e) {
         return left(NetworkExceptions.getDioException(e));
       }
     }
   }
   ```

### Step 4: Update BLoCs

1. **Enhanced Login BLoC**
   ```dart
   class LoginBloc extends Bloc<LoginEvent, LoginState> {
     final AuthRepository _authRepository;
     final UserService _userService;
     
     LoginBloc(this._authRepository, this._userService) : super(LoginInitial()) {
       on<LoginWithEmailPassword>(_onLoginWithEmailPassword);
       on<LoginWithGoogle>(_onLoginWithGoogle);
       on<AuthStateChanged>(_onAuthStateChanged);
     }
     
     Future<void> _onLoginWithEmailPassword(
       LoginWithEmailPassword event,
       Emitter<LoginState> emit,
     ) async {
       emit(LoginLoading());
       
       final result = await _authRepository.signInWithFirebase(
         event.email,
         event.password,
       );
       
       result.fold(
         (failure) => emit(LoginFailure(failure.toString())),
         (user) => emit(LoginSuccess(user)),
       );
     }
   }
   ```

### Step 5: Authentication Flow

1. **App-level Authentication Check**
   ```dart
   class AuthWrapper extends StatelessWidget {
     @override
     Widget build(BuildContext context) {
       return StreamBuilder<User?>(
         stream: FirebaseAuth.instance.authStateChanges(),
         builder: (context, snapshot) {
           if (snapshot.connectionState == ConnectionState.waiting) {
             return const SplashScreen();
           }
           
           if (snapshot.hasData) {
             return const MainApp();
           }
           
           return const AuthFlow();
         },
       );
     }
   }
   ```

2. **Route Protection**
   ```dart
   final router = GoRouter(
     redirect: (context, state) {
       final isLoggedIn = FirebaseAuth.instance.currentUser != null;
       final isAuthRoute = state.location.startsWith('/auth');
       
       if (!isLoggedIn && !isAuthRoute) {
         return '/auth/login';
       }
       
       if (isLoggedIn && isAuthRoute) {
         return '/home';
       }
       
       return null;
     },
     routes: [
       // Auth routes
       GoRoute(
         path: '/auth/login',
         builder: (context, state) => const LoginScreen(),
       ),
       // Protected routes
       GoRoute(
         path: '/home',
         builder: (context, state) => const HomeScreen(),
       ),
     ],
   );
   ```

## Security Considerations

### 1. Token Management
```dart
class TokenManager {
  static const String _accessTokenKey = 'access_token';
  static const String _refreshTokenKey = 'refresh_token';
  
  Future<void> saveTokens(String accessToken, String refreshToken) async {
    await LocalStorage.instance.setAccessToken(accessToken);
    await LocalStorage.instance.setRefreshToken(refreshToken);
  }
  
  Future<void> clearTokens() async {
    await LocalStorage.instance.clearUserSession();
  }
}
```

### 2. Biometric Authentication
```dart
class BiometricAuthService {
  final LocalAuthentication _localAuth = LocalAuthentication();
  
  Future<bool> isBiometricAvailable() async {
    return await _localAuth.canCheckBiometrics;
  }
  
  Future<bool> authenticateWithBiometrics() async {
    try {
      return await _localAuth.authenticate(
        localizedReason: 'Authenticate to access EventHub',
        options: const AuthenticationOptions(
          biometricOnly: true,
          stickyAuth: true,
        ),
      );
    } catch (e) {
      return false;
    }
  }
}
```

### 3. Session Management
```dart
class SessionManager {
  Timer? _sessionTimer;
  
  void startSessionTimer() {
    _sessionTimer?.cancel();
    _sessionTimer = Timer.periodic(
      const Duration(minutes: 30),
      (timer) => _checkSessionValidity(),
    );
  }
  
  void _checkSessionValidity() {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      _handleSessionExpired();
    }
  }
  
  void _handleSessionExpired() {
    // Navigate to login screen
    // Clear local data
  }
}
```

## Testing Strategy

### 1. Unit Tests
```dart
group('LoginBloc', () {
  late LoginBloc loginBloc;
  late MockAuthRepository mockAuthRepository;
  
  setUp(() {
    mockAuthRepository = MockAuthRepository();
    loginBloc = LoginBloc(mockAuthRepository, mockUserService);
  });
  
  blocTest<LoginBloc, LoginState>(
    'emits [LoginLoading, LoginSuccess] when login succeeds',
    build: () => loginBloc,
    act: (bloc) => bloc.add(LoginWithEmailPassword('test@test.com', 'password')),
    expect: () => [
      LoginLoading(),
      isA<LoginSuccess>(),
    ],
  );
});
```

### 2. Integration Tests
```dart
void main() {
  group('Authentication Flow', () {
    testWidgets('should navigate to home after successful login', (tester) async {
      await tester.pumpWidget(MyApp());
      
      // Enter credentials
      await tester.enterText(find.byKey(Key('email_field')), 'test@test.com');
      await tester.enterText(find.byKey(Key('password_field')), 'password');
      
      // Tap login button
      await tester.tap(find.byKey(Key('login_button')));
      await tester.pumpAndSettle();
      
      // Verify navigation to home
      expect(find.byType(HomeScreen), findsOneWidget);
    });
  });
}
```

## Error Handling

### 1. Network Exceptions
```dart
class NetworkExceptions with _$NetworkExceptions {
  const factory NetworkExceptions.requestCancelled() = RequestCancelled;
  const factory NetworkExceptions.unauthorisedRequest() = UnauthorisedRequest;
  const factory NetworkExceptions.badRequest() = BadRequest;
  const factory NetworkExceptions.notFound(String reason) = NotFound;
  const factory NetworkExceptions.methodNotAllowed() = MethodNotAllowed;
  const factory NetworkExceptions.notAcceptable() = NotAcceptable;
  const factory NetworkExceptions.requestTimeout() = RequestTimeout;
  const factory NetworkExceptions.sendTimeout() = SendTimeout;
  const factory NetworkExceptions.conflict() = Conflict;
  const factory NetworkExceptions.internalServerError() = InternalServerError;
  const factory NetworkExceptions.notImplemented() = NotImplemented;
  const factory NetworkExceptions.serviceUnavailable() = ServiceUnavailable;
  const factory NetworkExceptions.noInternetConnection() = NoInternetConnection;
  const factory NetworkExceptions.formatException() = FormatException;
  const factory NetworkExceptions.unableToProcess() = UnableToProcess;
  const factory NetworkExceptions.defaultError(String error) = DefaultError;
  const factory NetworkExceptions.unexpectedError() = UnexpectedError;
}
```

### 2. Firebase Error Handling
```dart
class FirebaseExceptionHandler {
  static String getErrorMessage(FirebaseAuthException e) {
    switch (e.code) {
      case 'user-not-found':
        return 'No user found with this email address.';
      case 'wrong-password':
        return 'Incorrect password. Please try again.';
      case 'email-already-in-use':
        return 'An account already exists with this email address.';
      case 'weak-password':
        return 'Password is too weak. Please choose a stronger password.';
      case 'invalid-email':
        return 'Please enter a valid email address.';
      case 'user-disabled':
        return 'This account has been disabled.';
      case 'too-many-requests':
        return 'Too many failed attempts. Please try again later.';
      default:
        return 'An unexpected error occurred. Please try again.';
    }
  }
}
```

## Performance Optimizations

### 1. Lazy Loading
```dart
// Use lazy singletons for expensive operations
@lazySingleton
class AuthService {
  // Heavy initialization
}
```

### 2. Caching
```dart
class AuthCache {
  static LoginUser? _cachedUser;
  
  static LoginUser? getCachedUser() => _cachedUser;
  
  static void setCachedUser(LoginUser user) {
    _cachedUser = user;
  }
  
  static void clearCache() {
    _cachedUser = null;
  }
}
```

## Conclusion

This authentication implementation provides:

- **Clean Architecture**: Clear separation of concerns
- **Firebase Integration**: Modern authentication with Firebase Auth
- **State Management**: Robust BLoC pattern implementation
- **Security**: Token management and session handling
- **Testing**: Comprehensive testing strategy
- **Error Handling**: Graceful error management
- **Performance**: Optimized for mobile applications

The implementation is scalable, maintainable, and follows Flutter best practices while providing a secure and user-friendly authentication experience.