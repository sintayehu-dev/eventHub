@echo off
REM Quick script to trigger test release workflow
REM Usage: test-release.bat <build_number> [release_notes]

if "%1"=="" (
    echo Usage: %0 ^<build_number^> [release_notes]
    echo Example: %0 4 "Testing release functionality"
    exit /b 1
)

set BUILD_NUMBER=%1
set RELEASE_NOTES=%2
if "%RELEASE_NOTES%"=="" set RELEASE_NOTES=Testing release creation

echo 🚀 Triggering test release for build #%BUILD_NUMBER%
echo 📝 Release notes: %RELEASE_NOTES%

REM Trigger the workflow using GitHub CLI
gh workflow run test-release.yml --field build_number="%BUILD_NUMBER%" --field release_notes="%RELEASE_NOTES%"

echo ✅ Test release workflow triggered!
echo 🔗 Check progress in GitHub Actions tab