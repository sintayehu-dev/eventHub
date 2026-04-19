@echo off
echo Encoding keystore to Base64...
echo.

powershell -Command "[Convert]::ToBase64String([IO.File]::ReadAllBytes('android\eventhub-key.jks')) | Set-Clipboard"

if %ERRORLEVEL% EQU 0 (
    echo Success! Base64 string has been copied to clipboard.
    echo.
    echo Next steps:
    echo 1. Go to GitHub repository Settings ^> Secrets and variables ^> Actions
    echo 2. Click "New repository secret"
    echo 3. Name: KEYSTORE_BASE64
    echo 4. Value: Paste from clipboard (Ctrl+V)
    echo 5. Click "Add secret"
    echo.
    echo Also add:
    echo - Name: KEYSTORE_PASSWORD
    echo - Value: EventHub2026SecureStore
) else (
    echo Error: Failed to encode keystore file.
    echo Make sure android\eventhub-key.jks exists.
)

pause
