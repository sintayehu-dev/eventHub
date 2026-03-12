import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';

/// Debug helper for Firebase Auth testing
/// Only use this in development/debug mode
class DebugAuthHelper {
  static final FirebaseAuth _auth = FirebaseAuth.instance;

  /// Create a test user for development
  static Future<void> createTestUser({
    required String email,
    required String password,
  }) async {
    try {
      log('Creating test user: $email');
      
      final credential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      
      if (credential.user != null) {
        log('Test user created successfully: ${credential.user!.uid}');
        log('Email: ${credential.user!.email}');
        log('Email verified: ${credential.user!.emailVerified}');
      }
    } on FirebaseAuthException catch (e) {
      log('Error creating test user: ${e.code} - ${e.message}');
      
      if (e.code == 'email-already-in-use') {
        log('User already exists, trying to sign in...');
        await signInTestUser(email: email, password: password);
      }
    } catch (e) {
      log('Unexpected error: $e');
    }
  }

  /// Sign in with test user
  static Future<void> signInTestUser({
    required String email,
    required String password,
  }) async {
    try {
      log('Signing in test user: $email');
      
      final credential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      
      if (credential.user != null) {
        log('Test user signed in successfully: ${credential.user!.uid}');
        log('Email: ${credential.user!.email}');
        log('Email verified: ${credential.user!.emailVerified}');
      }
    } on FirebaseAuthException catch (e) {
      log('Error signing in test user: ${e.code} - ${e.message}');
    } catch (e) {
      log('Unexpected error: $e');
    }
  }

  /// Get current user info
  static void getCurrentUserInfo() {
    final user = _auth.currentUser;
    if (user != null) {
      log('Current user: ${user.uid}');
      log('Email: ${user.email}');
      log('Email verified: ${user.emailVerified}');
      log('Display name: ${user.displayName}');
    } else {
      log('No current user');
    }
  }

  /// Sign out current user
  static Future<void> signOutCurrentUser() async {
    try {
      await _auth.signOut();
      log('User signed out successfully');
    } catch (e) {
      log('Error signing out: $e');
    }
  }
  
  /// Clear all local data and sign out
  static Future<void> clearSessionAndSignOut() async {
    try {
      // Sign out from Firebase
      await _auth.signOut();
      
      // Clear any local storage if needed
      // await LocalStorage.instance.clearUserSession();
      
      log('Session cleared and user signed out successfully');
    } catch (e) {
      log('Error clearing session and signing out: $e');
    }
  }
}