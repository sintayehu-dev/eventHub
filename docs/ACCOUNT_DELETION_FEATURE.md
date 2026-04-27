# Account Deletion Feature

## Overview
Implemented full account deletion functionality to give users complete ownership and control over their data, in compliance with GDPR and privacy regulations.

## What Gets Deleted

When a user deletes their account, the following data is permanently removed:

### 1. Firebase Authentication
- User authentication account
- Login credentials
- Google Sign-In association

### 2. Firestore Data
- User profile document (`users/{userId}`)
- All events created by the user (`events` where `organizerId == userId`)
- All event registrations (`eventRegistrations` where `userId == userId`)
- All staff assignments (`staff` where `userId == userId`)

### 3. Firebase Storage
- User profile images (`users/{userId}/`)
- Event images uploaded by user (`events/{userId}/`)
- All associated media files

### 4. Third-Party Services
- Google Sign-In session cleared
- Cloudinary images (if applicable)

## Implementation Details

### Files Modified/Created

1. **Domain Layer:**
   - `lib/features/auth/domain/repositories/auth_repository.dart` - Added `deleteAccount()` method
   - `lib/features/auth/domain/usecases/delete_account_usecase.dart` - New use case

2. **Infrastructure Layer:**
   - `lib/features/auth/infrastructure/auth/datasources/firebase_auth_data_source.dart`
     - Added `deleteAccount()` method
     - Added `_deleteUserData()` helper
     - Added `_deleteUserStorage()` helper
     - Added `_deleteStorageFolder()` helper
   - `lib/features/auth/infrastructure/auth/repositories/auth_repository_impl.dart`
     - Implemented `deleteAccount()` method
     - Added error handling for `requires-recent-login`

3. **Presentation Layer:**
   - `lib/features/attendee/profile/presentation/pages/attendee_profile_screen.dart`
     - Added `_showDeleteAccountDialog()` method
     - Added `_deleteAccount()` method
     - Added `_buildDeleteItem()` helper widget
   - `lib/features/attendee/profile/presentation/widgets/attendee_profile_menu.dart`
     - Added "Delete Account" menu item
     - Added "Danger Zone" section
     - Added `isDanger` styling parameter

## User Flow

1. User navigates to Profile screen
2. Scrolls to "Danger Zone" section
3. Taps "Delete Account" (styled in red)
4. Sees warning dialog with:
   - Warning icon
   - List of what will be deleted
   - "This action cannot be undone" message
   - Cancel and "Delete Forever" buttons
5. Confirms deletion
6. Loading indicator shown
7. Account and all data deleted
8. Success message shown
9. User automatically signed out
10. Redirected to login screen

## Security Features

### Re-authentication Required
If the user's session is old, Firebase may require re-authentication:
- Error code: `requires-recent-login`
- User-friendly message: "Please sign in again before deleting your account"
- User must sign out and sign in again, then retry deletion

### Confirmation Dialog
- Clear warning about permanent deletion
- Detailed list of what will be deleted
- Two-step confirmation (tap menu item, then confirm in dialog)
- Red/error styling to indicate danger

### Batch Operations
- Uses Firestore batch writes for atomic deletions
- Ensures data consistency
- Continues even if some deletions fail

## Error Handling

### Handled Errors:
- `requires-recent-login` - User needs to re-authenticate
- `no-current-user` - No user signed in
- Network errors - Graceful failure with error message
- Firestore errors - Logged but doesn't block account deletion
- Storage errors - Logged but doesn't block account deletion

### User Feedback:
- Loading dialog during deletion
- Success message on completion
- Error flash message if deletion fails
- Automatic sign-out on success

## Privacy Compliance

### GDPR Compliance:
✅ Right to erasure ("right to be forgotten")
✅ Complete data deletion
✅ User-initiated process
✅ Clear information about what's deleted
✅ Permanent and irreversible

### CCPA Compliance:
✅ User control over personal data
✅ Ability to delete all personal information
✅ Clear disclosure of deletion scope

## Testing Checklist

- [ ] Delete account with email/password authentication
- [ ] Delete account with Google Sign-In
- [ ] Verify all Firestore data is deleted
- [ ] Verify all Storage files are deleted
- [ ] Test with old session (requires-recent-login)
- [ ] Test with no internet connection
- [ ] Verify user is signed out after deletion
- [ ] Verify user cannot sign in with deleted account
- [ ] Test canceling the deletion dialog
- [ ] Verify error messages display correctly

## Future Enhancements

1. **Grace Period:**
   - Soft delete with 30-day recovery period
   - Schedule permanent deletion after grace period

2. **Data Export:**
   - Allow users to download their data before deletion
   - GDPR data portability compliance

3. **Deletion Confirmation Email:**
   - Send confirmation email after deletion
   - Include deletion timestamp

4. **Admin Notification:**
   - Notify admins of account deletions
   - Track deletion metrics

5. **Partial Deletion:**
   - Option to delete only certain data types
   - Keep event history but remove personal info

## Dependencies

Required packages (already in pubspec.yaml):
- `firebase_auth: ^5.3.3`
- `cloud_firestore: ^5.5.0`
- `firebase_storage: ^12.3.6`
- `google_sign_in: ^6.2.1`
- `injectable: ^2.5.0`
- `dartz: ^0.10.1`

## Notes

- Account deletion is permanent and cannot be undone
- Users should be encouraged to export their data first (future feature)
- The feature is currently implemented for Attendee profiles
- Similar implementation needed for Organizer and Staff profiles
- Consider adding a "Download My Data" feature before deletion
