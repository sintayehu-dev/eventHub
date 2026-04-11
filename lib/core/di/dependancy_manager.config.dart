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

import '../../features/attendee/event_discovery/application/event_discovery/bloc/event_discovery_bloc.dart'
    as _i350;
import '../../features/attendee/event_discovery/domain/repositories/event_discovery_repository.dart'
    as _i818;
import '../../features/attendee/event_discovery/infrastructure/datasources/firebase_event_discovery_data_source.dart'
    as _i191;
import '../../features/attendee/event_discovery/infrastructure/repositories/event_discovery_repository_impl.dart'
    as _i872;
import '../../features/attendee/ticket_purchase/application/ticket_purchase/bloc/ticket_purchase_bloc.dart'
    as _i939;
import '../../features/attendee/ticket_purchase/domain/repositories/ticket_purchase_repository.dart'
    as _i805;
import '../../features/attendee/ticket_purchase/domain/repositories/ticket_repository.dart'
    as _i1005;
import '../../features/attendee/ticket_purchase/infrastructure/datasources/firebase_ticket_data_source.dart'
    as _i1021;
import '../../features/attendee/ticket_purchase/infrastructure/repositories/ticket_purchase_repository_impl.dart'
    as _i683;
import '../../features/attendee/ticket_purchase/infrastructure/repositories/ticket_repository_impl.dart'
    as _i699;
import '../../features/attendee/ticket_wallet/application/ticket_wallet/bloc/ticket_wallet_bloc.dart'
    as _i112;
import '../../features/attendee/ticket_wallet/domain/repositories/ticket_wallet_repository.dart'
    as _i743;
import '../../features/attendee/ticket_wallet/infrastructure/datasources/firebase_ticket_wallet_data_source.dart'
    as _i776;
import '../../features/attendee/ticket_wallet/infrastructure/repositories/ticket_wallet_repository_impl.dart'
    as _i820;
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
import '../../features/organizer/analytics/application/analytics/bloc/analytics_bloc.dart'
    as _i190;
import '../../features/organizer/analytics/domain/repositories/analytics_repository.dart'
    as _i106;
import '../../features/organizer/analytics/infrastructure/datasources/firebase_analytics_data_source.dart'
    as _i41;
import '../../features/organizer/analytics/infrastructure/repositories/analytics_repository_impl.dart'
    as _i908;
import '../../features/organizer/attendee_management/application/attendee_management/bloc/attendee_management_bloc.dart'
    as _i746;
import '../../features/organizer/attendee_management/domain/repositories/attendee_management_repository.dart'
    as _i455;
import '../../features/organizer/event_management/application/event_management/bloc/event_management_bloc.dart'
    as _i263;
import '../../features/organizer/event_management/domain/repositories/event_repository.dart'
    as _i520;
import '../../features/organizer/event_management/domain/services/staff_creation_service.dart'
    as _i395;
import '../../features/organizer/event_management/infrastructure/datasources/firebase_event_data_source.dart'
    as _i912;
import '../../features/organizer/event_management/infrastructure/repositories/event_repository_impl.dart'
    as _i413;
import '../../features/organizer/event_management/infrastructure/services/firebase_staff_user_creation_service.dart'
    as _i656;
import '../../features/organizer/staff_management/application/staff_management/bloc/staff_management_bloc.dart'
    as _i479;
import '../../features/organizer/staff_management/domain/repositories/staff_management_repository.dart'
    as _i547;
import '../../features/organizer/staff_management/infrastructure/datasources/firebase_staff_management_data_source.dart'
    as _i409;
import '../../features/shared/profile/application/user_profile/bloc/user_profile_bloc.dart'
    as _i237;
import '../../features/shared/profile/domain/repositories/user_profile_repository.dart'
    as _i75;
import '../../features/shared/profile/infrastructure/datasources/firebase_user_profile_data_source.dart'
    as _i607;
import '../../features/shared/profile/infrastructure/repositories/user_profile_repository_impl.dart'
    as _i920;
import '../../features/staff/attendee_management/application/attendee_management/bloc/attendee_management_bloc.dart'
    as _i1063;
import '../../features/staff/attendee_management/domain/repositories/attendee_management_repository.dart'
    as _i531;
import '../../features/staff/attendee_management/infrastructure/datasources/firebase_attendee_management_data_source.dart'
    as _i430;
import '../../features/staff/attendee_management/infrastructure/repositories/attendee_management_repository_impl.dart'
    as _i772;
import '../../features/staff/event_assignment/application/staff_event_assignment/bloc/staff_event_assignment_bloc.dart'
    as _i795;
import '../../features/staff/event_assignment/domain/repositories/staff_event_assignment_repository.dart'
    as _i170;
import '../../features/staff/event_assignment/domain/services/staff_assignment_service.dart'
    as _i935;
import '../../features/staff/event_assignment/infrastructure/datasources/firebase_staff_event_assignment_data_source.dart'
    as _i319;
import '../../features/staff/event_assignment/infrastructure/repositories/staff_event_assignment_repository_impl.dart'
    as _i576;
import '../../features/staff/event_assignment/infrastructure/services/firebase_staff_assignment_service.dart'
    as _i912;
import '../../features/staff/management/domain/repositories/staff_management_repository.dart'
    as _i202;
import '../../features/staff/management/infrastructure/datasources/firebase_staff_management_data_source.dart'
    as _i414;
import '../../features/staff/management/infrastructure/repositories/staff_management_repository_impl.dart'
    as _i279;
import '../../features/staff/reports/application/staff_reports/bloc/staff_reports_bloc.dart'
    as _i271;
import '../../features/staff/reports/domain/repositories/staff_reports_repository.dart'
    as _i1043;
import '../../features/staff/reports/infrastructure/datasources/firebase_staff_reports_data_source.dart'
    as _i964;
import '../../features/staff/reports/infrastructure/repositories/staff_reports_repository_impl.dart'
    as _i926;
import '../../features/staff/ticket_scanner/application/ticket_scanner/bloc/ticket_scanner_bloc.dart'
    as _i984;
import '../../features/staff/ticket_scanner/domain/repositories/ticket_scanner_repository.dart'
    as _i253;
import '../../features/staff/ticket_scanner/domain/services/staff_qr_scanner_service.dart'
    as _i37;
import '../../features/staff/ticket_scanner/infrastructure/datasources/firebase_ticket_scanner_data_source.dart'
    as _i967;
import '../../features/staff/ticket_scanner/infrastructure/repositories/ticket_scanner_repository_impl.dart'
    as _i807;
import '../../features/staff/ticket_scanner/infrastructure/services/firebase_staff_qr_scanner_service.dart'
    as _i158;
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
    gh.lazySingleton<_i837.CloudinaryService>(() => _i837.CloudinaryService());
    gh.lazySingleton<_i409.FirebaseStaffManagementDataSource>(() =>
        _i409.FirebaseStaffManagementDataSource(
            firestore: gh<_i974.FirebaseFirestore>()));
    gh.lazySingleton<_i319.FirebaseStaffEventAssignmentDataSource>(() =>
        _i319.FirebaseStaffEventAssignmentDataSource(
            firestore: gh<_i974.FirebaseFirestore>()));
    gh.lazySingleton<_i414.FirebaseStaffManagementDataSource>(() =>
        _i414.FirebaseStaffManagementDataSource(
            firestore: gh<_i974.FirebaseFirestore>()));
    gh.lazySingleton<_i964.FirebaseStaffReportsDataSource>(() =>
        _i964.FirebaseStaffReportsDataSource(
            firestore: gh<_i974.FirebaseFirestore>()));
    gh.lazySingleton<_i607.FirebaseUserProfileDataSource>(
        () => _i607.FirebaseUserProfileDataSource(
              firestore: gh<_i974.FirebaseFirestore>(),
              auth: gh<_i59.FirebaseAuth>(),
              cloudinaryService: gh<_i837.CloudinaryService>(),
            ));
    gh.lazySingleton<_i202.StaffManagementRepository>(() =>
        _i279.StaffManagementRepositoryImpl(
            gh<_i414.FirebaseStaffManagementDataSource>()));
    gh.lazySingleton<_i430.FirebaseAttendeeManagementDataSource>(
        () => _i430.FirebaseAttendeeManagementDataSource(
              firestore: gh<_i974.FirebaseFirestore>(),
              staffEventDataSource:
                  gh<_i319.FirebaseStaffEventAssignmentDataSource>(),
            ));
    gh.lazySingleton<_i531.AttendeeManagementRepository>(() =>
        _i772.AttendeeManagementRepositoryImpl(
            dataSource: gh<_i430.FirebaseAttendeeManagementDataSource>()));
    gh.lazySingleton<_i75.UserProfileRepository>(() =>
        _i920.UserProfileRepositoryImpl(
            gh<_i607.FirebaseUserProfileDataSource>()));
    gh.lazySingleton<_i935.StaffAssignmentService>(() =>
        _i912.FirebaseStaffAssignmentService(
            firestore: gh<_i974.FirebaseFirestore>()));
    gh.factory<_i746.AttendeeManagementBloc>(() =>
        _i746.AttendeeManagementBloc(gh<_i455.AttendeeManagementRepository>()));
    gh.factory<_i237.UserProfileBloc>(
        () => _i237.UserProfileBloc(gh<_i75.UserProfileRepository>()));
    gh.factory<_i479.StaffManagementBloc>(
        () => _i479.StaffManagementBloc(gh<_i547.StaffManagementRepository>()));
    gh.lazySingleton<_i1043.StaffReportsRepository>(() =>
        _i926.StaffReportsRepositoryImpl(
            gh<_i964.FirebaseStaffReportsDataSource>()));
    gh.factory<_i271.StaffReportsBloc>(
        () => _i271.StaffReportsBloc(gh<_i1043.StaffReportsRepository>()));
    gh.factory<_i470.UserFirestoreDataSource>(
        () => _i470.UserFirestoreDataSourceImpl(gh<_i974.FirebaseFirestore>()));
    gh.lazySingleton<_i967.FirebaseTicketScannerDataSource>(() =>
        _i967.FirebaseTicketScannerDataSource(
            firestore: gh<_i974.FirebaseFirestore>()));
    gh.factory<_i1021.FirebaseTicketDataSource>(() =>
        _i1021.FirebaseTicketDataSourceImpl(gh<_i974.FirebaseFirestore>()));
    gh.factory<_i516.UserService>(
        () => _i516.UserServiceImpl(gh<_i470.UserFirestoreDataSource>()));
    gh.lazySingleton<_i170.StaffEventAssignmentRepository>(() =>
        _i576.StaffEventAssignmentRepositoryImpl(
            gh<_i319.FirebaseStaffEventAssignmentDataSource>()));
    gh.factory<_i191.FirebaseEventDiscoveryDataSource>(() =>
        _i191.FirebaseEventDiscoveryDataSourceImpl(
            gh<_i974.FirebaseFirestore>()));
    gh.factory<_i818.EventDiscoveryRepository>(() =>
        _i872.EventDiscoveryRepositoryImpl(
            gh<_i191.FirebaseEventDiscoveryDataSource>()));
    gh.factory<_i413.FirebaseAuthDataSource>(
        () => _i413.FirebaseAuthDataSourceImpl(
              gh<_i59.FirebaseAuth>(),
              gh<_i116.GoogleSignIn>(),
            ));
    gh.factory<_i1005.TicketRepository>(() =>
        _i699.TicketRepositoryImpl(gh<_i1021.FirebaseTicketDataSource>()));
    gh.factory<_i776.FirebaseTicketWalletDataSource>(() =>
        _i776.FirebaseTicketWalletDataSourceImpl(
            firestore: gh<_i974.FirebaseFirestore>()));
    gh.factory<_i41.FirebaseAnalyticsDataSource>(() =>
        _i41.FirebaseAnalyticsDataSourceImpl(gh<_i974.FirebaseFirestore>()));
    gh.factory<_i795.StaffEventAssignmentBloc>(() =>
        _i795.StaffEventAssignmentBloc(
            gh<_i170.StaffEventAssignmentRepository>()));
    gh.factory<_i395.StaffCreationService>(
        () => _i656.FirebaseStaffUserCreationService(
              gh<_i974.FirebaseFirestore>(),
              gh<_i59.FirebaseAuth>(),
            ));
    gh.lazySingleton<_i253.TicketScannerRepository>(() =>
        _i807.TicketScannerRepositoryImpl(
            dataSource: gh<_i967.FirebaseTicketScannerDataSource>()));
    gh.factory<_i787.AuthRepository>(
        () => _i446.AuthRepositoryImpl(gh<_i413.FirebaseAuthDataSource>()));
    gh.factory<_i805.TicketPurchaseRepository>(() =>
        _i683.TicketPurchaseRepositoryImpl(
            gh<_i1021.FirebaseTicketDataSource>()));
    gh.factory<_i1063.AttendeeManagementBloc>(() =>
        _i1063.AttendeeManagementBloc(
            gh<_i531.AttendeeManagementRepository>()));
    gh.factory<_i106.AnalyticsRepository>(() =>
        _i908.AnalyticsRepositoryImpl(gh<_i41.FirebaseAnalyticsDataSource>()));
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
    gh.factory<_i743.TicketWalletRepository>(() =>
        _i820.TicketWalletRepositoryImpl(
            firebaseDataSource: gh<_i1021.FirebaseTicketDataSource>()));
    gh.factory<_i350.EventDiscoveryBloc>(() => _i350.EventDiscoveryBloc(
        repository: gh<_i818.EventDiscoveryRepository>()));
    gh.factory<_i912.FirebaseEventDataSource>(
        () => _i912.FirebaseEventDataSourceImpl(
              gh<_i974.FirebaseFirestore>(),
              gh<_i837.CloudinaryService>(),
              gh<_i395.StaffCreationService>(),
            ));
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
    gh.factory<_i190.AnalyticsBloc>(
        () => _i190.AnalyticsBloc(gh<_i106.AnalyticsRepository>()));
    gh.factory<_i939.TicketPurchaseBloc>(() => _i939.TicketPurchaseBloc(
        repository: gh<_i805.TicketPurchaseRepository>()));
    gh.factory<_i37.StaffQRScannerService>(
        () => _i158.FirebaseStaffQRScannerService(
              gh<_i974.FirebaseFirestore>(),
              gh<_i395.StaffCreationService>(),
            ));
    gh.factory<_i984.TicketScannerBloc>(() => _i984.TicketScannerBloc(
        repository: gh<_i253.TicketScannerRepository>()));
    gh.factory<_i520.EventRepository>(
        () => _i413.EventRepositoryImpl(gh<_i912.FirebaseEventDataSource>()));
    gh.factory<_i263.EventManagementBloc>(
        () => _i263.EventManagementBloc(gh<_i520.EventRepository>()));
    gh.factory<_i112.TicketWalletBloc>(() =>
        _i112.TicketWalletBloc(repository: gh<_i743.TicketWalletRepository>()));
    return this;
  }
}

class _$FirebaseModule extends _i616.FirebaseModule {}
