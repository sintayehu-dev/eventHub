import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:eventhub/core/router/route_name.dart';
import 'package:eventhub/core/utils/app_helpers.dart';

class OrganizerProfileMenuItems extends StatelessWidget {
  const OrganizerProfileMenuItems({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _MenuGroup(
          title: 'Manage',
          items: [
            _Entry('My events', Icons.event_outlined,
                () => context.goNamed(RouteName.organizerEvents)),
            _Entry('Create event', Icons.add_circle_outline,
                () => context.pushNamed(RouteName.createEventScreen)),
            _Entry('Revenue & analytics', Icons.bar_chart_outlined,
                () => context.goNamed(RouteName.organizerAnalytics)),
            _Entry('Staff management', Icons.people_outline, null),
            _Entry('Promotion tools', Icons.campaign_outlined, null),
            _Entry('Help & support', Icons.help_outline, null),
          ],
        ),
        SizedBox(height: 20.h),
        _MenuGroup(
          title: 'Legal & information',
          items: [
            _Entry('About Ethio Events', Icons.info_outline,
                () => context.pushNamed(RouteName.about)),
            _Entry('Terms & conditions', Icons.description_outlined,
                () => context.pushNamed(RouteName.terms)),
            _Entry('Privacy policy', Icons.privacy_tip_outlined,
                () => context.pushNamed(RouteName.privacyPolicy)),
          ],
        ),
      ],
    );
  }
}

class _Entry {
  final String title;
  final IconData icon;
  final VoidCallback? onTap;

  const _Entry(this.title, this.icon, this.onTap);
}

class _MenuGroup extends StatelessWidget {
  final String title;
  final List<_Entry> items;

  const _MenuGroup({required this.title, required this.items});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final scheme = theme.colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 8.w, bottom: 10.h),
          child: Text(title, style: theme.textTheme.titleSmall),
        ),
        Container(
          decoration: BoxDecoration(
            color: scheme.surface,
            borderRadius: BorderRadius.circular(28.r),
            boxShadow: [
              BoxShadow(
                color: scheme.shadow.withValues(alpha: 0.06),
                blurRadius: 24,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(28.r),
            child: Column(
              children: [
                for (var i = 0; i < items.length; i++) ...[
                  InkWell(
                    onTap: items[i].onTap ??
                        () => AppHelpers.showInfoSnackBar(
                            context, 'Feature to be implemented'),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 16.w, vertical: 14.h),
                      child: Row(
                        children: [
                          Container(
                            width: 38.w,
                            height: 38.w,
                            decoration: BoxDecoration(
                              color: scheme.secondaryContainer,
                              shape: BoxShape.circle,
                            ),
                            child: Icon(items[i].icon,
                                color: scheme.primary, size: 19.sp),
                          ),
                          SizedBox(width: 14.w),
                          Expanded(
                            child: Text(items[i].title,
                                style: theme.textTheme.titleSmall),
                          ),
                          Icon(Icons.chevron_right_rounded,
                              color: scheme.onSurfaceVariant, size: 22.sp),
                        ],
                      ),
                    ),
                  ),
                  if (i != items.length - 1)
                    Divider(indent: 68.w, endIndent: 20.w),
                ],
              ],
            ),
          ),
        ),
      ],
    );
  }
}
