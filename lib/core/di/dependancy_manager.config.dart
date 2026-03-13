// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:cloud_firestore/cloud_firestore.dart' as _i974;
import 'package:firebase_auth/firebase_auth.dart' as _i59;
import 'package:get_it/get_it.dart' as _i174;
import 'package:google_sign_in/google_sign_in.dart' as _i116;
import 'package:injectable/injectable.dart' as _i526;

import '../../features/auth/application/auth_status/bloc/auth_status_bloc.dart'
    as _i364;
import '../../features/auth/application/login/bloc/login_bloc.dart' as _i623;
import '../../features/auth/application/profile/bloc/profile_bloc.dart'
    as _i1003;
import '../../features/auth/application/registration/bloc/registration_bloc.dart'
    as _i859;
import '../../features/auth/domain/repositories/auth_repository.dart' as _i787;
import '../../features/auth/domain/usecases/get_current_user_usecase.dart'
    as _i17;
import '../../features/auth/domain/usecases/google_sign_in_usecase.dart'
    as _i91;
import '../../features/auth/domain/usecases/password_reset_usecase.dart'
    as _i876;
import '../../features/auth/domain/usecases/register_usecase.dart' as _i941;
import '../../features/auth/domain/usecases/sign_in_usecase.dart' as _i259;
import '../../features/auth/domain/usecases/sign_out_usecase.dart' as _i915;
import '../../features/auth/domain/user/user_service.dart' as _i516;
import '../../features/auth/infrastructure/auth/datasources/firebase_auth_data_source.dart'
    as _i413;
import '../../features/auth/infrastructure/auth/repositories/auth_repository_impl.dart'
    as _i446;
import '../../features/auth/infrastructure/firestore/datasources/user_firestore_data_source.dart'
    as _i470;
import '../../features/organizer/event_management/application/event_management/bloc/event_management_bloc.dart'
    as _i263;
import '../../features/organizer/event_management/domain/repositories/event_repository.dart'
    as _i520;
import '../../features/organizer/event_management/infrastructure/datasources/firebase_event_data_source.dart'
    as _i912;
import '../../features/organizer/event_management/infrastructure/repositories/event_repository_impl.dart'
    as _i413;
import '../handlers/http_service.dart' as _i350;
import '../services/cloudinary_service.dart' as _i837;
import 'firebase_module.dart' as _i616;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final firebaseModule = _$FirebaseModule();
    gh.lazySingleton<_i59.FirebaseAuth>(() => firebaseModule.firebaseAuth);
    gh.lazySingleton<_i974.FirebaseFirestore>(
        () => firebaseModule.firebaseFirestore);
    gh.lazySingleton<_i116.GoogleSignIn>(() => firebaseModule.googleSignIn);
    gh.lazySingleton<_i350.HttpService>(() => _i350.HttpService());
    gh.lazySingleton<_i837.CloudinaryService>(() => _i837.CloudinaryService());
    gh.factory<_i470.UserFirestoreDataSource>(
        () => _i470.UserFirestoreDataSourceImpl(gh<_i974.FirebaseFirestore>()));
    gh.factory<_i912.FirebaseEventDataSource>(
        () => _i912.FirebaseEventDataSourceImpl(
              gh<_i974.FirebaseFirestore>(),
              gh<_i837.CloudinaryService>(),
            ));
    gh.factory<_i516.UserService>(
        () => _i516.UserServiceImpl(gh<_i470.UserFirestoreDataSource>()));
    gh.factory<_i413.FirebaseAuthDataSource>(
        () => _i413.FirebaseAuthDataSourceImpl(
              gh<_i59.FirebaseAuth>(),
              gh<_i116.GoogleSignIn>(),
            ));
    gh.factory<_i787.AuthRepository>(
        () => _i446.AuthRepositoryImpl(gh<_i413.FirebaseAuthDataSource>()));
    gh.factory<_i520.EventRepository>(
        () => _i413.EventRepositoryImpl(gh<_i912.FirebaseEventDataSource>()));
    gh.factory<_i263.EventManagementBloc>(
        () => _i263.EventManagementBloc(gh<_i520.EventRepository>()));
    gh.factory<_i17.GetCurrentUserUseCase>(
        () => _i17.GetCurrentUserUseCase(gh<_i787.AuthRepository>()));
    gh.factory<_i91.GoogleSignInUseCase>(
        () => _i91.GoogleSignInUseCase(gh<_i787.AuthRepository>()));
    gh.factory<_i876.PasswordResetUseCase>(
        () => _i876.PasswordResetUseCase(gh<_i787.AuthRepository>()));
    gh.factory<_i941.RegisterUseCase>(
        () => _i941.RegisterUseCase(gh<_i787.AuthRepository>()));
    gh.factory<_i259.SignInUseCase>(
        () => _i259.SignInUseCase(gh<_i787.AuthRepository>()));
    gh.factory<_i915.SignOutUseCase>(
        () => _i915.SignOutUseCase(gh<_i787.AuthRepository>()));
    gh.factory<_i364.AuthStatusBloc>(() => _i364.AuthStatusBloc(
          gh<_i787.AuthRepository>(),
          gh<_i516.UserService>(),
        ));
    gh.factory<_i623.LoginBloc>(() => _i623.LoginBloc(
          gh<_i787.AuthRepository>(),
          gh<_i516.UserService>(),
        ));
    gh.factory<_i1003.ProfileBloc>(() => _i1003.ProfileBloc(
          gh<_i787.AuthRepository>(),
          gh<_i516.UserService>(),
        ));
    gh.factory<_i859.RegistrationBloc>(() => _i859.RegistrationBloc(
          gh<_i787.AuthRepository>(),
          gh<_i516.UserService>(),
        ));
    return this;
  }
}

class _$FirebaseModule extends _i616.FirebaseModule {}
