import 'dart:math';
import 'package:flutter/material.dart';

class PasswordGenerator {
  static const String _lowercase = 'abcdefghijklmnopqrstuvwxyz';
  static const String _uppercase = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
  static const String _numbers = '0123456789';
  static const String _symbols = '!@#\$%^&*';
  
  /// Generates a secure password with specified length and character types
  static String generateSecurePassword({
    int length = 12,
    bool includeLowercase = true,
    bool includeUppercase = true,
    bool includeNumbers = true,
    bool includeSymbols = true,
  }) {
    if (length < 4) {
      throw ArgumentError('Password length must be at least 4 characters');
    }
    
    String chars = '';
    if (includeLowercase) chars += _lowercase;
    if (includeUppercase) chars += _uppercase;
    if (includeNumbers) chars += _numbers;
    if (includeSymbols) chars += _symbols;
    
    if (chars.isEmpty) {
      throw ArgumentError('At least one character type must be included');
    }
    
    final random = Random.secure();
    final password = List.generate(length, (index) => chars[random.nextInt(chars.length)]);
    
    // Ensure at least one character from each selected type is included
    int position = 0;
    if (includeLowercase && !password.any((char) => _lowercase.contains(char))) {
      password[position++] = _lowercase[random.nextInt(_lowercase.length)];
    }
    if (includeUppercase && !password.any((char) => _uppercase.contains(char))) {
      password[position++] = _uppercase[random.nextInt(_uppercase.length)];
    }
    if (includeNumbers && !password.any((char) => _numbers.contains(char))) {
      password[position++] = _numbers[random.nextInt(_numbers.length)];
    }
    if (includeSymbols && !password.any((char) => _symbols.contains(char))) {
      password[position++] = _symbols[random.nextInt(_symbols.length)];
    }
    
    // Shuffle the password to randomize positions
    password.shuffle(random);
    
    return password.join();
  }
  
  /// Generates a staff password with default settings (12 chars, mixed case, numbers, symbols)
  static String generateStaffPassword() {
    return generateSecurePassword(
      length: 12,
      includeLowercase: true,
      includeUppercase: true,
      includeNumbers: true,
      includeSymbols: true,
    );
  }
  
  /// Generates a simple password without symbols (easier to type)
  static String generateSimplePassword({int length = 10}) {
    return generateSecurePassword(
      length: length,
      includeLowercase: true,
      includeUppercase: true,
      includeNumbers: true,
      includeSymbols: false,
    );
  }
  
  /// Checks password strength
  static PasswordStrength checkPasswordStrength(String password) {
    if (password.length < 6) return PasswordStrength.weak;
    
    bool hasLower = password.contains(RegExp(r'[a-z]'));
    bool hasUpper = password.contains(RegExp(r'[A-Z]'));
    bool hasNumber = password.contains(RegExp(r'[0-9]'));
    bool hasSymbol = password.contains(RegExp(r'[!@#\$%^&*(),.?":{}|<>]'));
    
    int score = 0;
    if (hasLower) score++;
    if (hasUpper) score++;
    if (hasNumber) score++;
    if (hasSymbol) score++;
    if (password.length >= 8) score++;
    if (password.length >= 12) score++;
    
    if (score <= 2) return PasswordStrength.weak;
    if (score <= 4) return PasswordStrength.medium;
    return PasswordStrength.strong;
  }
}

enum PasswordStrength {
  weak,
  medium,
  strong,
}

extension PasswordStrengthExtension on PasswordStrength {
  String get displayName {
    switch (this) {
      case PasswordStrength.weak:
        return 'Weak';
      case PasswordStrength.medium:
        return 'Medium';
      case PasswordStrength.strong:
        return 'Strong';
    }
  }
  
  Color get color {
    switch (this) {
      case PasswordStrength.weak:
        return const Color(0xFFFF5252);
      case PasswordStrength.medium:
        return const Color(0xFFFF9800);
      case PasswordStrength.strong:
        return const Color(0xFF4CAF50);
    }
  }
}