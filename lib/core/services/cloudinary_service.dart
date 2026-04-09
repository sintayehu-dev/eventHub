import 'dart:io';
import 'package:cloudinary/cloudinary.dart';
import 'package:injectable/injectable.dart';
import 'dart:developer' as dev;

@lazySingleton
class CloudinaryService {
  late final Cloudinary _cloudinary;
  
  CloudinaryService() {
    _cloudinary = Cloudinary.signedConfig(
      apiKey: '574654384352583', // Replace with your actual API key
      apiSecret: 'qrbKtg46kbUtwQByyyAghHxLhks', // Replace with your actual API secret
      cloudName: 'dxdbs46r8', // Replace with your actual cloud name
    );
  }

  /// Upload image to Cloudinary
  /// Returns the secure URL of the uploaded image
  Future<String> uploadImage({
    required String imagePath,
    required String folder,
    String? publicId,
  }) async {
    try {
      dev.log('Cloudinary: Starting upload for image: $imagePath');
      
      final file = File(imagePath);
      if (!file.existsSync()) {
        throw Exception('Image file not found at path: $imagePath');
      }

      final fileSize = await file.length();
      dev.log('Cloudinary: File size: $fileSize bytes');

      // Upload to Cloudinary
      final response = await _cloudinary.upload(
        file: file.path,
        folder: folder,
        publicId: publicId,
        resourceType: CloudinaryResourceType.image,
      );

      if (response.isSuccessful) {
        final secureUrl = response.secureUrl!;
        dev.log('Cloudinary: Upload successful: $secureUrl');
        return secureUrl;
      } else {
        dev.log('Cloudinary: Upload failed: ${response.error}');
        throw Exception('Failed to upload image: ${response.error}');
      }
    } catch (e) {
      dev.log('Cloudinary: Upload error: $e');
      throw Exception('Failed to upload image to Cloudinary: $e');
    }
  }

  /// Delete image from Cloudinary
  Future<bool> deleteImage(String publicId) async {
    try {
      dev.log('Cloudinary: Deleting image with publicId: $publicId');
      
      final response = await _cloudinary.destroy(publicId);
      
      if (response.isSuccessful) {
        dev.log('Cloudinary: Delete successful');
        return true;
      } else {
        dev.log('Cloudinary: Delete failed: ${response.error}');
        return false;
      }
    } catch (e) {
      dev.log('Cloudinary: Delete error: $e');
      return false;
    }
  }

  /// Extract public ID from Cloudinary URL
  String? extractPublicId(String cloudinaryUrl) {
    try {
      final uri = Uri.parse(cloudinaryUrl);
      final pathSegments = uri.pathSegments;
      
      // Find the index after 'upload' or version
      int startIndex = 0;
      for (int i = 0; i < pathSegments.length; i++) {
        if (pathSegments[i] == 'upload') {
          startIndex = i + 1;
          // Skip version if present (starts with 'v')
          if (startIndex < pathSegments.length && 
              pathSegments[startIndex].startsWith('v')) {
            startIndex++;
          }
          break;
        }
      }
      
      if (startIndex < pathSegments.length) {
        final pathWithoutExtension = pathSegments
            .sublist(startIndex)
            .join('/')
            .replaceAll(RegExp(r'\.[^.]+$'), ''); // Remove file extension
        return pathWithoutExtension;
      }
      
      return null;
    } catch (e) {
      dev.log('Cloudinary: Error extracting public ID: $e');
      return null;
    }
  }
}