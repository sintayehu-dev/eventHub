import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:eventhub/core/theme/app_colors.dart';
import 'package:eventhub/features/shared/profile/domain/entities/user_profile_entity.dart';

class OrganizerProfileHeader extends StatelessWidget {
  final UserProfileEntity profile;

  const OrganizerProfileHeader({
    super.key,
    required this.profile,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        gradient: AppColors.heroGradient,
        borderRadius: BorderRadius.circular(32.r),
        boxShadow: [
          BoxShadow(
            color: AppColors.primaryDark.withValues(alpha: 0.25),
            blurRadius: 28,
            offset: const Offset(0, 14),
          ),
        ],
      ),
      child: Stack(
        children: [
          Positioned(
            right: -40.w,
            top: -50.h,
            child: Container(
              width: 140.w,
              height: 140.w,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.white.withValues(alpha: 0.06),
              ),
            ),
          ),
          Row(
            children: [
              Container(
                width: 68.w,
                height: 68.w,
                padding: EdgeInsets.all(3.w),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.accent,
                ),
                child: ClipOval(
                  child: profile.profileImageUrl != null
                      ? Image.network(
                          profile.profileImageUrl!,
                          fit: BoxFit.cover,
                          errorBuilder: (_, __, ___) => _initial(theme),
                        )
                      : _initial(theme),
                ),
              ),
              SizedBox(width: 16.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      profile.name,
                      style: theme.textTheme.titleLarge
                          ?.copyWith(color: AppColors.white),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 2.h),
                    Text(
                      profile.email,
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: AppColors.white.withValues(alpha: 0.75),
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 10.h),
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
                      decoration: BoxDecoration(
                        color: AppColors.white.withValues(alpha: 0.14),
                        borderRadius: BorderRadius.circular(14.r),
                      ),
                      child: Text(
                        'Organizer',
                        style: theme.textTheme.labelMedium
                            ?.copyWith(color: AppColors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _initial(ThemeData theme) {
    final name = profile.name.trim();
    return Container(
      color: AppColors.peach,
      alignment: Alignment.center,
      child: Text(
        name.isEmpty ? '?' : name.characters.first.toUpperCase(),
        style: theme.textTheme.headlineSmall?.copyWith(
          color: AppColors.primary,
          fontWeight: FontWeight.w800,
        ),
      ),
    );
  }
}
