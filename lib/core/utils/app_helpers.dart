import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AppHelpers {
  AppHelpers._();

  static showNoConnectionSnackBar(BuildContext context) {
    Fluttertoast.showToast(
      msg: 'No internet connection',
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.TOP,
      backgroundColor: Colors.teal,
      textColor: Colors.white,
      fontSize: 14,
    );
  }

  static showCheckFlash(BuildContext context, String text) {
    Fluttertoast.showToast(
      msg: text,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.TOP,
      backgroundColor: Theme.of(context).colorScheme.primary,
      textColor: Theme.of(context).colorScheme.onPrimary,
      fontSize: 13,
    );
  }

  static showErrorFlash(BuildContext context, String text) {
    Fluttertoast.showToast(
      msg: text,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.TOP,
      backgroundColor: Theme.of(context).colorScheme.error,
      textColor: Theme.of(context).colorScheme.onError,
      fontSize: 13,
    );
  }

  // SnackBar helpers for consistent UI
  static void showSuccessSnackBar(BuildContext context, String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.TOP,
      backgroundColor: Theme.of(context).colorScheme.primary,
      textColor: Theme.of(context).colorScheme.onPrimary,
      fontSize: 14,
    );
  }

  static void showErrorSnackBar(BuildContext context, String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.TOP,
      backgroundColor: Theme.of(context).colorScheme.error,
      textColor: Theme.of(context).colorScheme.onError,
      fontSize: 14,
    );
  }

  static void showInfoSnackBar(BuildContext context, String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.TOP,
      backgroundColor: Theme.of(context).colorScheme.secondary,
      textColor: Theme.of(context).colorScheme.onSecondary,
      fontSize: 14,
    );
  }

  static void showWarningSnackBar(BuildContext context, String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.TOP,
      backgroundColor: Theme.of(context).colorScheme.tertiary,
      textColor: Theme.of(context).colorScheme.onTertiary,
      fontSize: 14,
    );
  }

  // Custom colored snackbars for specific use cases
  static void showCustomSnackBar(
    BuildContext context,
    String message, {
    Color? backgroundColor,
    Color? textColor,
    Duration? duration,
  }) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.TOP,
      backgroundColor: backgroundColor ?? Theme.of(context).colorScheme.primary,
      textColor: textColor ?? Theme.of(context).colorScheme.onPrimary,
      fontSize: 14,
    );
  }

  // Form validation helpers
  static void showValidationErrorSnackBar(
      BuildContext context, String message) {
    showErrorSnackBar(context, message);
  }

  static void showFormSuccessSnackBar(BuildContext context, String message) {
    showSuccessSnackBar(context, message);
  }

  // Network connectivity helpers
  static void showNetworkErrorSnackBar(BuildContext context) {
    showErrorSnackBar(
        context, 'No internet connection. Please check your network.');
  }

  static void showTimeoutErrorSnackBar(BuildContext context) {
    showErrorSnackBar(context, 'Request timed out. Please try again.');
  }

  // Authentication helpers
  static void showLoginSuccessSnackBar(BuildContext context) {
    showSuccessSnackBar(context, 'Login successful!');
  }

  static void showRegistrationSuccessSnackBar(BuildContext context) {
    showSuccessSnackBar(context, 'Registration successful!');
  }

  static void showLogoutSuccessSnackBar(BuildContext context) {
    showInfoSnackBar(context, 'You have been logged out successfully.');
  }

  static void showPasswordResetSnackBar(BuildContext context) {
    showInfoSnackBar(context, 'Password reset link sent to your email.');
  }
}
