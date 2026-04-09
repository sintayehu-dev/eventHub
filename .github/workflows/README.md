# GitHub Actions Workflow for EventHub

This directory contains a single comprehensive GitHub Actions workflow for automated building, testing, and releasing of the EventHub Flutter application.

## 📋 Single Workflow: `ci-cd.yml`

This unified workflow handles all scenarios based on different triggers:

### 🔄 **Automatic Triggers**

#### 1. **Development Builds** (Push/PR to `ft/clean`)
- ✅ Builds debug APK automatically
- ✅ Runs tests and code analysis
- ✅ Uploads APK as artifact (7-day retention)
- ✅ Comments on PRs with download link

#### 2. **Tag-based Releases** (Push tags like `v1.0.1`)
- ✅ Builds release APK and AAB
- ✅ Creates GitHub release automatically
- ✅ Generates changelog from commits

### 🎛️ **Manual Triggers** (Workflow Dispatch)

#### 3. **Manual Debug Build**
- **Build Type**: Select "debug"
- **Purpose**: Test specific commits manually

#### 4. **Manual Release**
- **Version**: e.g., `1.0.1`
- **Release Notes**: Custom description
- **Pre-release**: Mark as beta/alpha
- **Build Type**: Select "release"

## 🚀 How to Use

### For Development
```bash
# Push to ft/clean branch
git push origin ft/clean

# Or create PR to ft/clean
gh pr create --base ft/clean
```
→ **Result**: Debug APK available in Actions artifacts

### For Releases

#### Option 1: Manual Release (Recommended)
1. Go to **Actions** tab → **EventHub CI/CD Pipeline**
2. Click **"Run workflow"**
3. Fill in the form:
   ```
   Version: 1.0.1
   Release notes: Added new features and bug fixes
   Pre-release: ☐ (uncheck for stable release)
   Build type: release
   ```
4. Click **"Run workflow"**

#### Option 2: Tag-based Release
```bash
# Create and push version tag
git tag v1.0.1
git push origin v1.0.1
```

## 📱 What You Get

### Debug Builds
```
Artifacts:
└── eventhub-ft-clean-debug-{run_number}.apk
```

### Release Builds
```
GitHub Release:
├── eventhub-v{version}-release.apk    # Direct installation
└── eventhub-v{version}-release.aab    # Play Store submission
```

## 🔧 Environment Configuration

Matches your local development setup:
- **Flutter**: 3.27.4 (stable)
- **Java**: 17 (Temurin)
- **Android**: compileSdk 35, minSdk 24

## 📋 Workflow Features

### ✅ **Build Process**
- Sets up Flutter 3.27.4 and Java 17
- Runs `flutter pub get`
- Generates code with `build_runner`
- Analyzes code with `flutter analyze`
- Runs tests (continues on failure)
- Builds APK/AAB based on trigger

### ✅ **Smart Logic**
- **Debug builds** for development pushes/PRs
- **Release builds** for tags or manual releases
- **Version management** from pubspec.yaml or manual input
- **Automatic changelog** generation

### ✅ **Notifications**
- **PR comments** with APK download links
- **Build status** notifications
- **Release announcements** with detailed info

## 🎯 Usage Examples

### Scenario 1: Testing a Feature
```bash
# Work on feature
git checkout ft/clean
git add .
git commit -m "Add new feature"
git push origin ft/clean
```
→ **Auto-build** → **Download APK** → **Test on device**

### Scenario 2: Creating a Release
1. **Manual**: Actions → Run workflow → Fill form → Release created
2. **Tag**: `git tag v1.0.1 && git push origin v1.0.1` → Auto-release

### Scenario 3: PR Review
```bash
# Create PR
gh pr create --title "New feature" --base ft/clean
```
→ **Auto-build** → **PR comment with APK** → **Review & test**

## 📊 Monitoring

### Build Status Indicators
- ✅ **Green**: Build successful, APK ready
- ❌ **Red**: Build failed, check logs  
- 🟡 **Yellow**: Build in progress

### Artifact Retention
- **Debug APKs**: 7 days
- **Release artifacts**: 30 days
- **GitHub releases**: Permanent

## 🛠️ Customization

### Adding APK Signing
Add these repository secrets:
- `KEYSTORE_BASE64`
- `KEYSTORE_PASSWORD` 
- `KEY_ALIAS`
- `KEY_PASSWORD`

### Adding Notifications
Add Slack/Discord webhook URLs to secrets for build notifications.

## 🐛 Troubleshooting

### Common Issues
1. **Build fails**: Check Flutter/Java versions match (3.27.4/17)
2. **APK won't install**: Ensure Android 7.0+ and unknown sources enabled
3. **Missing artifacts**: Check if build completed successfully

### Debug Steps
1. Check **Actions** tab for detailed logs
2. Verify `pubspec.yaml` version format
3. Test locally with same environment
4. Check repository permissions

---

## 🎉 Quick Start

1. **Push code** to `ft/clean` → Get debug APK
2. **Run manual workflow** → Create release
3. **Download APK** → Install and test
4. **Report issues** → Improve and repeat

**Need help?** Check the Actions logs or create an issue!