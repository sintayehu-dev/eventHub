import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:eventhub/features/shared/profile/domain/entities/user_profile_entity.dart';

class AttendeeProfileHeader extends StatelessWidget {
  final UserProfileEntity profile;

  const AttendeeProfileHeader({
    super.key,
    required this.profile,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Container(
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainerHighest.withValues(alpha: 0.5),
        borderRadius: BorderRadius.circular(24.r),
        border: Border.all(
          color: colorScheme.outlineVariant.withValues(alpha: 0.3),
          width: 1,
        ),
      ),
      child: Column(
        children: [
          // Gradient banner
          ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(24.r),
              topRight: Radius.circular(24.r),
            ),
            child: Container(
              height: 90.h,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    colorScheme.tertiary,
                    colorScheme.secondary,
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
            ),
          ),

          // Avatar overlapping the banner
          Transform.translate(
            offset: Offset(0, -40.h),
            child: Column(
              children: [
                Container(
                  width: 88.w,
                  height: 88.h,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                      colors: [colorScheme.tertiary, colorScheme.secondary],
                    ),
                    border: Border.all(
                      color: colorScheme.surface,
                      width: 4,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: colorScheme.tertiary.withValues(alpha: 0.3),
                        blurRadius: 16,
                        offset: const Offset(0, 6),
                      ),
                    ],
                  ),
                  child: profile.profileImageUrl != null
                      ? ClipOval(
                          child: Image.network(
                            profile.profileImageUrl!,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) => Icon(
                              Icons.person,
                              color: colorScheme.onTertiary,
                              size: 36.sp,
                            ),
                          ),
                        )
                      : Icon(
                          Icons.person,
                          color: colorScheme.onTertiary,
                          size: 36.sp,
                        ),
                ),
                SizedBox(height: 8.h),
                Text(
                  profile.name,
                  style: theme.textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 6.h),
                Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 14.w, vertical: 5.h),
                  decoration: BoxDecoration(
                    color: colorScheme.tertiary.withValues(alpha: 0.15),
                    borderRadius: BorderRadius.circular(20.r),
                    border: Border.all(
                      color: colorScheme.tertiary.withValues(alpha: 0.4),
                      width: 1,
                    ),
                  ),
                  child: Text(
                    'Event Attendee',
                    style: theme.textTheme.labelMedium?.copyWith(
                      color: colorScheme.tertiary,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.4,
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Info rows below avatar (compensate for negative offset)
          Transform.translate(
            offset: Offset(0, -28.h),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                children: [
                  _buildHeaderInfoRow(
                      Icons.email_outlined, profile.email, theme, colorScheme),
                  if (profile.phone != null) ...[
                    SizedBox(height: 8.h),
                    _buildHeaderInfoRow(Icons.phone_outlined, profile.phone!,
                        theme, colorScheme),
                  ],
                  SizedBox(height: 16.h),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeaderInfoRow(
      IconData icon, String text, ThemeData theme, ColorScheme colorScheme) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon,
            size: 14.sp,
            color: colorScheme.onSurface.withValues(alpha: 0.5)),
        SizedBox(width: 6.w),
        Flexible(
          child: Text(
            text,
            style: theme.textTheme.bodyMedium?.copyWith(
              color: colorScheme.onSurface.withValues(alpha: 0.65),
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
