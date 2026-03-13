import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:device_info_plus/device_info_plus.dart';

/// A utility class to handle permissions throughout the app
class PermissionHandlerUtil {
  /// Check and request camera permission
  static Future<bool> requestCameraPermission(BuildContext context) async {
    if (!context.mounted) return false;
    
    PermissionStatus status = await Permission.camera.status;
    
    if (status.isGranted) {
      return true;
    }
    
    if (status.isDenied) {
      status = await Permission.camera.request();
      return status.isGranted;
    }
    
    if (status.isPermanentlyDenied) {
      if (context.mounted) {
        _showPermissionDeniedDialog(
          context,
          'Camera access is required',
          'Please enable camera access in your device settings to continue.',
        );
      }
      return false;
    }
    
    if (status.isRestricted || status.isLimited) {
      if (context.mounted) {
        _showPermissionDeniedDialog(
          context,
          'Camera access is restricted',
          'Camera permissions are restricted on your device.',
        );
      }
      return false;
    }
    
    return false;
  }
  
  /// Check and request photo library/storage permission
  static Future<bool> requestPhotoLibraryPermission(BuildContext context) async {
    if (!context.mounted) return false;
    
    PermissionStatus status;
    
    if (Platform.isIOS) {
      status = await Permission.photos.status;
      
      if (status.isGranted) {
        return true;
      }
      
      if (status.isDenied) {
        status = await Permission.photos.request();
        return status.isGranted;
      }
    } else if (Platform.isAndroid) {
      // For Android 13 (API 33) and above, we need to request media permissions
      if (await _isAndroid13OrAbove()) {
        // Try READ_MEDIA_IMAGES permission for Android 13+
        status = await Permission.mediaLibrary.status;

        if (status.isGranted) {
          return true;
        }

        if (status.isDenied) {
          status = await Permission.mediaLibrary.request();
          return status.isGranted;
        }
      } else {
        // For older Android versions, use storage permission
        status = await Permission.storage.status;

        if (status.isGranted) {
          return true;
        }

        if (status.isDenied) {
          status = await Permission.storage.request();
          return status.isGranted;
        }
      }
    } else {
      // Fallback for other platforms
      status = await Permission.storage.status;

      if (status.isGranted) {
        return true;
      }

      if (status.isDenied) {
        status = await Permission.storage.request();
        return status.isGranted;
      }
    }
    
    if (status.isPermanentlyDenied) {
      if (context.mounted) {
        _showPermissionDeniedDialog(
          context,
          'Storage access is required',
          'Please enable storage/photos access in your device settings to continue.',
        );
      }
      return false;
    }
    
    if (status.isRestricted || status.isLimited) {
      if (context.mounted) {
        _showPermissionDeniedDialog(
          context,
          'Storage access is restricted',
          'Storage/photos permissions are restricted on your device.',
        );
      }
      return false;
    }
    
    return false;
  }

  static Future<bool> requestMicPermission(BuildContext context) async {
    if (!context.mounted) return false;
    
    var status = await Permission.microphone.status;
    // If permission is undetermined (not granted, not denied, not permanently denied)
    if (!status.isGranted && !status.isDenied && !status.isPermanentlyDenied) {
      if (!context.mounted) return false;
      
      final proceed = await showDialog<bool>(
        context: context,
        barrierDismissible: false,
        builder: (context) => AlertDialog(
          title: Text(
            'Microphone Access Needed',
            style: GoogleFonts.outfit(fontWeight: FontWeight.w600),
          ),
          content: Text(
            'EventHub needs access to your microphone to enable voice notes for events. Your voice will be converted to text in real time. Tap Continue to allow access.',
            style: GoogleFonts.outfit(),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: Text(
                'Cancel',
                style: GoogleFonts.outfit(color: Colors.grey),
              ),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pop(true),
              child: Text(
                'Continue',
                style: GoogleFonts.outfit(
                  color: Theme.of(context).colorScheme.primary,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      );
      if (proceed != true) {
        return false;
      }
      // Now trigger the OS permission sheet
      status = await Permission.microphone.request();
    } else if (!status.isGranted) {
      // If not granted (but not undetermined), trigger OS permission sheet
      status = await Permission.microphone.request();
    }
    if (status.isPermanentlyDenied) {
      if (context.mounted) {
        _showPermissionDeniedDialog(
          context,
          'Microphone access is required',
          'Please enable microphone access in your device settings to continue.',
        );
      }
      return false;
    }
    return status.isGranted;
  }
  
  /// Helper method to check if the device is running Android 13 (API 33) or higher
  static Future<bool> _isAndroid13OrAbove() async {
    if (Platform.isAndroid) {
      final deviceInfo = DeviceInfoPlugin();
      final androidInfo = await deviceInfo.androidInfo;
      return androidInfo.version.sdkInt >= 33; // Android 13 is API level 33
    }
    return false;
  }
  
  /// Show a dialog when permission is permanently denied
  static void _showPermissionDeniedDialog(
    BuildContext context, 
    String title, 
    String message,
  ) {
    showDialog<void>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          title,
          style: GoogleFonts.outfit(
            fontWeight: FontWeight.w600,
          ),
        ),
        content: Text(
          message,
          style: GoogleFonts.outfit(),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text(
              'Cancel',
              style: GoogleFonts.outfit(
                color: Colors.grey,
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              openAppSettings();
            },
            child: Text(
              'Open Settings',
              style: GoogleFonts.outfit(
                color: Theme.of(context).colorScheme.primary,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
  
  /// Show error dialog for permission-related errors
  static void showErrorDialog(
    BuildContext context, 
    String title, 
    String message,
  ) {
    showDialog<void>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          title,
          style: GoogleFonts.outfit(
            fontWeight: FontWeight.w600,
          ),
        ),
        content: Text(
          message,
          style: GoogleFonts.outfit(),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text(
              'OK',
              style: GoogleFonts.outfit(
                color: Theme.of(context).colorScheme.primary,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Check and request activity recognition and body sensors permissions for health data
  static Future<bool> requestHealthPermissions(BuildContext context) async {
    if (!context.mounted) return false;
    
    bool granted = true;
    // Request ACTIVITY_RECOGNITION
    var activityStatus = await Permission.activityRecognition.status;
    if (!activityStatus.isGranted) {
      activityStatus = await Permission.activityRecognition.request();
      if (!activityStatus.isGranted) {
        granted = false;
        if (context.mounted) {
          showErrorDialog(
            context,
            'Activity Recognition Required',
            'EventHub needs access to your physical activity to track event-related activities and provide insights.',
          );
        }
      }
    }
    // Request BODY_SENSORS
    var sensorsStatus = await Permission.sensors.status;
    if (!sensorsStatus.isGranted) {
      sensorsStatus = await Permission.sensors.request();
      if (!sensorsStatus.isGranted) {
        granted = false;
        if (context.mounted) {
          showErrorDialog(
            context,
            'Body Sensors Required',
            'EventHub needs access to your device sensors to provide location-based event features.',
          );
        }
      }
    }
    return granted;
  }
} 
