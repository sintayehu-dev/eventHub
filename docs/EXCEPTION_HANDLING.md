# Centralized Exception Handling in EventHub

## Overview

EventHub implements a comprehensive centralized exception handling system that provides consistent error management across the entire application. The system is designed with multiple layers to handle different types of errors gracefully.

## Architecture Overview

```
┌─────────────────────────────────────────────────────────────┐
│                    Presentation Layer                        │
│  ┌─────────────────┐  ┌─────────────────┐  ┌──────────────┐ │
│  │   BLoC States   │  │  Error Widgets  │  │  UI Feedback │ │
│  └─────────────────┘  └─────────────────┘  └──────────────┘ │
└─────────────────────────────────────────────────────────────┘
                                │
┌─────────────────────────────────────────────────────────────┐
│                   Application Layer                          │
│  ┌─────────────────┐  ┌─────────────────┐  ┌──────────────┐ │
│  │  BLoC Handlers  │  │ Error Mapping   │  │ State Mgmt   │ │
│  └─────────────────┘  └─────────────────┘  └──────────────┘ │
└─────────────────────────────────────────────────────────────┘
                                │
┌─────────────────────────────────────────────────────────────┐
│                   Infrastructure Layer                       │
│  ┌─────────────────┐  ┌─────────────────┐  ┌──────────────┐ │
│  │  Repositories   │  │  Data Sources   │  │ HTTP Service │ │
│  └─────────────────┘  └─────────────────┘  └──────────────┘ │
└─────────────────────────────────────────────────────────────┘
                                │
┌─────────────────────────────────────────────────────────────┐
│                      Core Layer                             │
│  ┌─────────────────┐  ┌─────────────────┐  ┌──────────────┐ │
│  │NetworkExceptions│  │ Value Failures  │  │ Interceptors │ │
│  └─────────────────┘  └─────────────────┘  └──────────────┘ │
└─────────────────────────────────────────────────────────────┘
```

## Core Exception Types

### 1. NetworkExceptions (Network Layer)

**Location**: `lib/core/handlers/network_exceptions.dart`

This is the primary exception handling class for all network-related errors:

```dart
@freezed
class NetworkExceptions with _$NetworkExceptions {
  // Connection Issues
  const factory NetworkExceptions.connectionError() = ConnectionError;
  const factory NetworkExceptions.noInternetConnection() = NoInternetConnection;
  const factory NetworkExceptions.requestTimeout() = RequestTimeout;
  const factory NetworkExceptions.sendTimeout() = SendTimeout;
  
  // HTTP Status Codes
  const factory NetworkExceptions.unauthorisedRequest() = UnauthorisedRequest;
  const factory NetworkExceptions.badRequest() = BadRequest;
  const factory NetworkExceptions.notFound(String reason) = NotFound;
  const factory NetworkExceptions.internalServerError() = InternalServerError;
  const factory NetworkExceptions.serviceUnavailable() = ServiceUnavailable;
  
  // Request Issues
  const factory NetworkExceptions.requestCancelled() = RequestCancelled;
  const factory NetworkExceptions.methodNotAllowed() = MethodNotAllowed;
  const factory NetworkExceptions.conflict() = Conflict;
  
  // Data Processing
  const factory NetworkExceptions.formatException() = FormatException;
  const factory NetworkExceptions.unableToProcess() = UnableToProcess;
  
  // Security
  const factory NetworkExceptions.badCertificate() = BadCertificate;
  
  // Generic
  const factory NetworkExceptions.defaultError(String error) = DefaultError;
  const factory NetworkExceptions.unexpectedError() = UnexpectedError;
}
```

### 2. ValueFailures (Domain Layer)

**Location**: `lib/core/value_failures/value_failures.dart`

Handles validation and business logic errors:

```dart
@freezed
class ValueFailure<T> with _$ValueFailure<T> {
  // Input Validation
  const factory ValueFailure.empty({required T failedValue}) = Empty<T>;
  const factory ValueFailure.exceedingLength({required T failedValue, required int max}) = ExceedingLength<T>;
  const factory ValueFailure.multiline({required T failedValue}) = Multiline<T>;
  
  // Email & Authentication
  const factory ValueFailure.invalidEmail({required T failedValue}) = InvalidEmail<T>;
  const factory ValueFailure.shortPassword({required T failedValue}) = ShortPassword<T>;
  const factory ValueFailure.passwordMismatch({required T failedValue}) = PasswordMismatch<T>;
  
  // Personal Information
  const factory ValueFailure.invalidName({required T failedValue}) = InvalidName<T>;
  const factory ValueFailure.invalidPhoneNumber({required T failedValue}) = InvalidPhoneNumber<T>;
  
  // Business Logic
  const factory ValueFailure.invalidAmount({required T failedValue}) = InvalidAmount<T>;
  const factory ValueFailure.numberTooLarge({required T failedValue, required num max}) = NumberTooLarge<T>;
}
```

### 3. Custom Errors (Application Layer)

**Location**: `lib/core/errors/errors.dart`

```dart
class NotAuthenticatedError extends Error {}

class UnexpectedValueError extends Error {
  final ValueFailure valueFailure;
  
  UnexpectedValueError(this.valueFailure);
  
  @override
  String toString() {
    const explanation = 'Encountered a ValueFailure at an unrecoverable point. Terminating.';
    return Error.safeToString('$explanation Failure was: $valueFailure');
  }
}
```

## Exception Flow & Processing

### 1. Network Exception Processing

The `NetworkExceptions.getDioException()` method is the central processor for all network errors:

```dart
static NetworkExceptions getDioException(error) {
  if (error is Exception) {
    try {
      if (error is DioException) {
        switch (error.type) {
          case DioExceptionType.connectionError:
            return const NetworkExceptions.connectionError();
          case DioExceptionType.cancel:
            return const NetworkExceptions.requestCancelled();
          case DioExceptionType.connectionTimeout:
            return const NetworkExceptions.requestTimeout();
          case DioExceptionType.unknown:
            return const NetworkExceptions.noInternetConnection();
          case DioExceptionType.receiveTimeout:
            return const NetworkExceptions.sendTimeout();
          case DioExceptionType.badCertificate:
            return const NetworkExceptions.badCertificate();
          case DioExceptionType.sendTimeout:
            return const NetworkExceptions.sendTimeout();
          case DioExceptionType.badResponse:
            // Extract backend error message
            String backendError = _extractBackendErrorMessage(error.response?.data);
            return NetworkExceptions.defaultError(backendError);
        }
      } else if (error is SocketException) {
        return const NetworkExceptions.noInternetConnection();
      }
    } on FormatException catch (_) {
      return const NetworkExceptions.formatException();
    } catch (_) {
      return const NetworkExceptions.unexpectedError();
    }
  }
  return const NetworkExceptions.unexpectedError();
}
```

### 2. Backend Error Message Extraction

The system intelligently extracts error messages from backend responses:

```dart
static String _extractBackendErrorMessage(dynamic data) {
  if (data == null) return "Unknown error occurred";
  
  try {
    // For JSON error responses
    if (data is Map<String, dynamic>) {
      if (data.containsKey('error')) {
        return data['error'].toString();
      } else if (data.containsKey('message')) {
        return data['message'].toString();
      } else {
        return json.encode(data);
      }
    }
    // For string error responses
    else if (data is String && data.isNotEmpty) {
      try {
        final jsonData = json.decode(data);
        if (jsonData is Map<String, dynamic>) {
          if (jsonData.containsKey('error')) {
            return jsonData['error'].toString();
          } else if (jsonData.containsKey('message')) {
            return jsonData['message'].toString();
          }
        }
        return data;
      } catch (_) {
        return data;
      }
    }
  } catch (_) {
    return "Error processing response";
  }
}
```

## Interceptor-Based Error Handling

### 1. Token Interceptor

**Location**: `lib/core/handlers/token_interceptor.dart`

Handles authentication-related errors automatically:

```dart
class TokenInterceptor extends Interceptor {
  final bool requireAuth;
  
  TokenInterceptor({required this.requireAuth});

  @override
  Future<void> onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    final accessToken = LocalStorage.instance.getAccessToken();
    if (requireAuth && accessToken != null) {
      options.headers.addAll({'Authorization': 'Bearer $accessToken'});
    }
    super.onRequest(options, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (err.response?.statusCode == 401) {
      // Clear tokens
      LocalStorage.instance.clearUserSession();
      
      final context = NavigationService.currentContext;
      if (context != null) {
        // Show error message
        AppHelpers.showCheckFlash(
          context,
          'Session expired. Please login again.',
        );

        // Navigate to login
        context.goNamed(RouteName.login);
      }
    }
    return handler.next(err);
  }
}
```

### 2. HTTP Service Configuration

**Location**: `lib/core/handlers/http_service.dart`

Centralized HTTP client configuration with interceptors:

```dart
@lazySingleton
class HttpService {
  Dio client({bool requireAuth = false, bool isMultipart = false}) {
    return Dio(
      BaseOptions(
        baseUrl: AppConstants.baseUrl,
        connectTimeout: const Duration(seconds: 60),
        receiveTimeout: const Duration(seconds: 60),
        sendTimeout: const Duration(seconds: 60),
        headers: {
          'accept': 'application/json',
          'Content-Type': isMultipart ? 'multipart/form-data' : 'application/json',
        },
      ),
    )
      ..interceptors.add(TokenInterceptor(requireAuth: requireAuth))
      ..interceptors.add(LogInterceptor());
  }
}
```

## Repository Layer Error Handling

### Example: AuthRepository Implementation

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

  @override
  Future<Either<NetworkExceptions, RegistrationResponse>> register(RegistrationRequest registration) async {
    try {
      final response = await _remoteDataSource.register(registration);
      return right(response);
    } on DioException catch (e) {
      return left(NetworkExceptions.getDioException(e));
    }
  }
}
```

## BLoC Layer Error Handling

### Example: Login BLoC

```dart
class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthRepository _authRepository;
  
  LoginBloc(this._authRepository) : super(LoginInitial()) {
    on<LoginSubmitted>(_onLoginSubmitted);
  }

  Future<void> _onLoginSubmitted(
    LoginSubmitted event,
    Emitter<LoginState> emit,
  ) async {
    emit(LoginLoading());
    
    final loginRequest = LoginRequest(
      email: event.email,
      password: event.password,
    );
    
    final result = await _authRepository.login(loginRequest);
    
    result.fold(
      (networkException) {
        // Convert NetworkException to user-friendly message
        final errorMessage = NetworkExceptions.getRawErrorMessage(networkException);
        emit(LoginFailure(errorMessage));
      },
      (loginResponse) {
        // Save user data and tokens
        LocalStorage.instance.setUserData(loginResponse.user.toJson());
        LocalStorage.instance.setAccessToken(loginResponse.access_token);
        emit(LoginSuccess(loginResponse));
      },
    );
  }
}
```

## UI Layer Error Handling

### 1. Error Retry Widget

**Location**: `lib/core/utils/app_error_retry_widget.dart`

Reusable widget for displaying errors with retry functionality:

```dart
class AppErrorRetryWidget extends StatelessWidget {
  final String errorMessage;
  final VoidCallback onRetry;
  final String? buttonText;
  final IconData? icon;
  final Color? iconColor;
  final Color? textColor;

  const AppErrorRetryWidget({
    super.key,
    required this.errorMessage,
    required this.onRetry,
    this.buttonText,
    this.icon,
    this.iconColor,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon ?? Icons.error_outline,
            color: iconColor ?? Colors.grey[400],
            size: 32.sp,
          ),
          SizedBox(height: 8.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Text(
              errorMessage.isNotEmpty ? errorMessage : 'Failed to fetch data',
              style: GoogleFonts.outfit(
                fontSize: 14.sp,
                color: textColor ?? Colors.grey[600],
              ),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: 12.h),
          TextButton.icon(
            onPressed: onRetry,
            icon: Icon(
              Icons.refresh_rounded,
              color: iconColor ?? Theme.of(context).colorScheme.secondary,
              size: 20.sp,
            ),
            label: Text(
              buttonText ?? 'Try Again',
              style: GoogleFonts.outfit(
                fontSize: 14.sp,
                color: iconColor ?? Theme.of(context).colorScheme.secondary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
```

### 2. BLoC Consumer Error Handling

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
            // Show error using centralized error display
            AppHelpers.showCheckFlash(
              context,
              state.message,
              isError: true,
            );
          }
        },
        builder: (context, state) {
          if (state is LoginFailure) {
            return AppErrorRetryWidget(
              errorMessage: state.message,
              onRetry: () {
                // Retry login logic
                context.read<LoginBloc>().add(
                  LoginSubmitted(email: email, password: password),
                );
              },
            );
          }
          
          return Scaffold(
            body: LoginForm(),
          );
        },
      ),
    );
  }
}
```

## Error Message Extraction Utilities

### Raw Error Message Extraction

```dart
static String getRawErrorMessage(dynamic error) {
  if (error is DioException && error.response?.data != null) {
    try {
      // For JSON error responses
      if (error.response!.data is Map<String, dynamic>) {
        final errorData = error.response!.data as Map<String, dynamic>;
        if (errorData.containsKey('error')) {
          return errorData['error'].toString();
        } else if (errorData.containsKey('message')) {
          return errorData['message'].toString();
        } else {
          return json.encode(errorData);
        }
      }
      // For string error responses
      else if (error.response!.data is String) {
        return error.response!.data as String;
      } else {
        return error.response!.data.toString();
      }
    } catch (e) {
      return error.toString();
    }
  } else if (error is NetworkExceptions) {
    return _extractMessageFromNetworkExceptions(error);
  }
  
  return error.toString();
}
```

### NetworkExceptions Message Extraction

```dart
static String _extractMessageFromNetworkExceptions(NetworkExceptions networkExceptions) {
  return networkExceptions.when(
    connectionError: () => "Connection error",
    requestCancelled: () => "Request cancelled",
    unauthorisedRequest: () => "Unauthorized request",
    badRequest: () => "Bad request",
    notFound: (reason) => reason,
    methodNotAllowed: () => "Method not allowed",
    notAcceptable: () => "Not acceptable",
    requestTimeout: () => "Request timeout",
    sendTimeout: () => "Send timeout",
    conflict: () => "Conflict",
    internalServerError: () => "Internal server error",
    notImplemented: () => "Not implemented",
    serviceUnavailable: () => "Service unavailable",
    noInternetConnection: () => "No internet connection",
    formatException: () => "Format exception",
    unableToProcess: () => "Unable to process",
    defaultError: (error) => error,
    unexpectedError: () => "Unexpected error",
    badCertificate: () => "Bad certificate",
  );
}
```

## Firebase Exception Integration

### Firebase Auth Error Handling

```dart
class FirebaseExceptionHandler {
  static String getFirebaseAuthErrorMessage(FirebaseAuthException e) {
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
      case 'operation-not-allowed':
        return 'This sign-in method is not enabled.';
      case 'network-request-failed':
        return 'Network error. Please check your connection.';
      default:
        return 'An unexpected error occurred. Please try again.';
    }
  }
}
```

### Firebase Repository Error Handling

```dart
@Injectable(as: AuthRepository)
class FirebaseAuthRepositoryImpl implements AuthRepository {
  final FirebaseAuth _firebaseAuth;
  
  FirebaseAuthRepositoryImpl(this._firebaseAuth);

  @override
  Future<Either<NetworkExceptions, FirebaseUser>> signInWithFirebase(
    String email, 
    String password
  ) async {
    try {
      final credential = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      
      if (credential.user != null) {
        return right(FirebaseUser.fromFirebaseUser(credential.user!));
      }
      
      return left(const NetworkExceptions.unauthorisedRequest());
    } on FirebaseAuthException catch (e) {
      final errorMessage = FirebaseExceptionHandler.getFirebaseAuthErrorMessage(e);
      return left(NetworkExceptions.defaultError(errorMessage));
    } catch (e) {
      return left(NetworkExceptions.defaultError(e.toString()));
    }
  }
}
```

## Best Practices

### 1. Consistent Error Handling Pattern

```dart
// Repository Layer
Future<Either<NetworkExceptions, T>> someOperation() async {
  try {
    final result = await dataSource.performOperation();
    return right(result);
  } on DioException catch (e) {
    return left(NetworkExceptions.getDioException(e));
  } on FirebaseException catch (e) {
    return left(NetworkExceptions.defaultError(e.message ?? 'Firebase error'));
  } catch (e) {
    return left(NetworkExceptions.defaultError(e.toString()));
  }
}

// BLoC Layer
Future<void> _onEventHandler(Event event, Emitter<State> emit) async {
  emit(LoadingState());
  
  final result = await repository.someOperation();
  
  result.fold(
    (error) => emit(ErrorState(NetworkExceptions.getRawErrorMessage(error))),
    (data) => emit(SuccessState(data)),
  );
}

// UI Layer
BlocConsumer<SomeBloc, SomeState>(
  listener: (context, state) {
    if (state is ErrorState) {
      AppHelpers.showCheckFlash(context, state.message, isError: true);
    }
  },
  builder: (context, state) {
    if (state is ErrorState) {
      return AppErrorRetryWidget(
        errorMessage: state.message,
        onRetry: () => context.read<SomeBloc>().add(RetryEvent()),
      );
    }
    // ... other states
  },
)
```

### 2. Error Logging

```dart
class ErrorLogger {
  static void logError(String operation, dynamic error, [StackTrace? stackTrace]) {
    // Log to console in debug mode
    if (kDebugMode) {
      print('Error in $operation: $error');
      if (stackTrace != null) {
        print('Stack trace: $stackTrace');
      }
    }
    
    // Log to crash analytics in production
    // FirebaseCrashlytics.instance.recordError(error, stackTrace);
  }
}

// Usage in repository
Future<Either<NetworkExceptions, T>> someOperation() async {
  try {
    final result = await dataSource.performOperation();
    return right(result);
  } catch (e, stackTrace) {
    ErrorLogger.logError('someOperation', e, stackTrace);
    return left(NetworkExceptions.getDioException(e));
  }
}
```

## Summary

The EventHub centralized exception handling system provides:

1. **Consistent Error Types**: Standardized error categories across the app
2. **Automatic Error Processing**: Intelligent extraction of backend error messages
3. **Layered Error Handling**: Each layer handles errors appropriately
4. **User-Friendly Messages**: Raw technical errors converted to user-friendly messages
5. **Retry Mechanisms**: Built-in retry functionality for failed operations
6. **Authentication Handling**: Automatic session management and re-authentication
7. **Firebase Integration**: Seamless handling of Firebase-specific errors
8. **Logging & Analytics**: Comprehensive error tracking and reporting

This system ensures that users always receive meaningful error messages while developers get detailed error information for debugging and monitoring.