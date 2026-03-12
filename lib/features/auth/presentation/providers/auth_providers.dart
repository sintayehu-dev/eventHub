import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:eventhub/features/auth/application/login/bloc/login_bloc.dart';
import 'package:eventhub/features/auth/application/registration/bloc/registration_bloc.dart';

class AuthProviders extends StatelessWidget {
  final Widget child;
  
  const AuthProviders({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LoginBloc>(
          create: (context) => GetIt.instance<LoginBloc>(),
        ),
        BlocProvider<RegistrationBloc>(
          create: (context) => GetIt.instance<RegistrationBloc>(),
        ),
      ],
      child: child,
    );
  }
}