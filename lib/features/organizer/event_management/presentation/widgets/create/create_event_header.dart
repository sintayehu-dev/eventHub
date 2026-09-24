import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:eventhub/core/presentation/widgets/app_back_button.dart';

class CreateEventHeader extends StatelessWidget {
  const CreateEventHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leadingWidth: 64.w,
      leading: Padding(
        padding: EdgeInsets.only(left: 20.w),
        child: Center(
          child: AppBackButton(onPressed: () => Navigator.of(context).pop()),
        ),
      ),
      title: const Text('Create event'),
    );
  }
}
