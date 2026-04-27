# Package Name Change Summary

## Old Package Name
`com.eventhub.app`

## New Package Name
`com.ethioevent.app`

## Files Updated

### Android
1. ✅ `android/app/build.gradle`
   - Updated `namespace` to `com.ethioevent.app`
   - Updated `applicationId` to `com.ethioevent.app`

2. ✅ `android/app/src/main/AndroidManifest.xml`
   - Updated `package` attribute to `com.ethioevent.app`

3. ✅ `android/app/google-services.json`
   - Updated `package_name` to `com.ethioevent.app`

4. ✅ `android/app/src/main/kotlin/`
   - Moved `MainActivity.kt` from `com/eventhub/app/` to `com/ethioevent/app/`
   - Updated package declaration in `MainActivity.kt`

### iOS
5. ✅ `ios/Runner.xcodeproj/project.pbxproj`
   - Updated all `PRODUCT_BUNDLE_IDENTIFIER` references to `com.ethioevent.app`
   - Updated test bundle identifier to `com.ethioevent.app.RunnerTests`

## Important Notes

### Firebase Configuration
⚠️ **Action Required**: You need to update your Firebase project:

1. Go to [Firebase Console](https://console.firebase.google.com/)
2. Select your project: `eventhub-d5812`
3. Go to Project Settings → Your apps
4. For Android app:
   - Either add a new Android app with package name `com.ethioevent.app`
   - Or update the existing app's package name (if possible)
5. Download the new `google-services.json` and replace the current one
6. For iOS app (if applicable):
   - Update the bundle identifier to `com.ethioevent.app`
   - Download the new `GoogleService-Info.plist`

### Google Sign-In
⚠️ **Action Required**: Update OAuth credentials:

1. Go to [Google Cloud Console](https://console.cloud.google.com/)
2. Navigate to APIs & Services → Credentials
3. Update your OAuth 2.0 Client IDs with the new package name
4. Update SHA-1 fingerprints if needed:
   ```bash
   # Debug keystore
   keytool -list -v -keystore ~/.android/debug.keystore -alias androiddebugkey -storepass android -keypass android
   
   # Release keystore
   keytool -list -v -keystore android/eventhub-key.jks -alias eventhub -storepass EventHub2026SecureStore
   ```

### Clean Build Required
After changing the package name, you must clean and rebuild:

```bash
# Clean Flutter
flutter clean

# Get dependencies
flutter pub get

# Rebuild
flutter build apk --release
flutter build appbundle --release
```

### Uninstall Old App
Users with the old package name installed must uninstall it first before installing the new version, as Android treats different package names as different apps.

## Testing Checklist

- [ ] Clean build completes successfully
- [ ] App installs and launches
- [ ] Firebase authentication works
- [ ] Google Sign-In works
- [ ] All Firebase services (Firestore, Storage) work
- [ ] Push notifications work (if implemented)
- [ ] Deep links work (if implemented)

## Rollback

If you need to rollback to the old package name:

```bash
git checkout android/app/build.gradle
git checkout android/app/src/main/AndroidManifest.xml
git checkout android/app/google-services.json
git checkout ios/Runner.xcodeproj/project.pbxproj
# Manually move MainActivity.kt back to old location
```
