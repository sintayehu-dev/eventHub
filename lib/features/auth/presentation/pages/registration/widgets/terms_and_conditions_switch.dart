import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:eventhub/core/router/route_name.dart';
import 'package:eventhub/features/auth/application/registration/bloc/registration_bloc.dart';
import 'package:eventhub/features/auth/application/registration/bloc/registration_event.dart';
import 'package:eventhub/features/auth/application/registration/bloc/registration_state.dart';

class TermsAndConditionsSwitch extends StatelessWidget {
  const TermsAndConditionsSwitch({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegistrationBloc, RegistrationState>(
      builder: (context, state) {
        final theme = Theme.of(context);
        final colorScheme = theme.colorScheme;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Switch(
                  value: state.termsAcceptance.value.getOrElse(() => false),
                  onChanged: (value) {
                    context.read<RegistrationBloc>().add(
                      TermsAcceptedChanged(value),
                    );
                  },
                  activeColor: colorScheme.primary,
                ),
                SizedBox(width: 8.w),
                Expanded(
                  child: RichText(
                    text: TextSpan(
                      text: 'I agree to the ',
                      style: GoogleFonts.outfit(
                        fontSize: 14.sp,
                        color: colorScheme.onSurfaceVariant,
                      ),
                      children: [
                        TextSpan(
                          text: 'Terms & Conditions',
                          style: GoogleFonts.outfit(
                            fontSize: 14.sp,
                            color: colorScheme.primary,
                            fontWeight: FontWeight.w500,
                            decoration: TextDecoration.underline,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              context.pushNamed(RouteName.termsAndConditionsScreen);
                            },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            if (state.showErrorMessages && !state.termsAcceptance.isValid())
              Padding(
                padding: EdgeInsets.only(left: 16.w, top: 4.h),
                child: Text(
                  state.termsAcceptance.value.fold(
                    (failure) => failure.failedValue.toString(),
                    (_) => '',
                  ),
                  style: GoogleFonts.outfit(
                    fontSize: 12.sp,
                    color: Colors.red,
                  ),
                ),
              ),
          ],
        );
      },
    );
  }
}
