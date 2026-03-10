import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:eventhub/features/auth/application/login/bloc/login_bloc.dart';
import 'package:eventhub/features/auth/application/login/bloc/login_event.dart';
import 'package:eventhub/features/auth/application/login/bloc/login_state.dart';

/// Login button widget
class LoginButton extends StatelessWidget {
  const LoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        return Container(
          width: double.infinity,
          height: 56.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.r),
            gradient: const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color(0xFF3949AB),
                Color(0xFF3F51B5),
              ],
            ),
            boxShadow: [
              BoxShadow(
                color: const Color(0xFF3F51B5).withOpacity(0.3),
                blurRadius: 16,
                offset: const Offset(0, 8),
                spreadRadius: -4,
              ),
            ],
          ),
          child: ElevatedButton(
            onPressed: state.isLoading
                ? null
                : () {
                    context.read<LoginBloc>().add(
                      const LoginEvent.loginSubmitted(),
                    );
                  },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.transparent,
              foregroundColor: Colors.white,
              disabledBackgroundColor: Colors.transparent,
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.r),
              ),
              padding: EdgeInsets.symmetric(horizontal: 24.w),
            ),
            child: state.isLoading
                ? const _LoadingIndicator()
                : Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Sign In',
                        style: GoogleFonts.outfit(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 0.5,
                        ),
                      ),
                      SizedBox(width: 8.w),
                      Icon(
                        Icons.arrow_forward_rounded,
                        size: 20.sp,
                      ),
                    ],
                  ),
          ),
        );
      },
    );
  }
}

class _LoadingIndicator extends StatelessWidget {
  const _LoadingIndicator();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 24.w,
      height: 24.w,
      child: CircularProgressIndicator(
        strokeWidth: 2.5,
        valueColor: const AlwaysStoppedAnimation<Color>(Colors.white),
        backgroundColor: Colors.white.withOpacity(0.2),
      ),
    );
  }
} 
