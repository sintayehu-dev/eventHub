@echo off
echo Fixing dependency injection registration...
echo.
echo Step 1: Cleaning build cache...
flutter clean
echo.
echo Step 2: Getting dependencies...
dart pub get
echo.
echo Step 3: Running code generation...
dart run build_runner build --delete-conflicting-outputs
echo.
echo Dependency injection should now be fixed!
echo You can now run: flutter run
pause