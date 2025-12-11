import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:inter_hospital_app/features/auth/data/datasources/auth_local_data_source.dart';
import 'package:inter_hospital_app/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:inter_hospital_app/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:inter_hospital_app/features/auth/domain/repositories/auth_repository.dart';
import 'package:inter_hospital_app/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:inter_hospital_app/features/auth/presentation/cubit/auth_state.dart';
import 'package:inter_hospital_app/features/auth/presentation/view/login_screen.dart';
import 'package:inter_hospital_app/features/create_code/data/datasources/permission_local_data_source.dart';
import 'package:inter_hospital_app/features/create_code/data/datasources/permission_remote_data_source.dart';
import 'package:inter_hospital_app/features/create_code/data/repositories/permission_repository_impl.dart';
import 'package:inter_hospital_app/features/notification/data/datasource/notification_local_data_source.dart';
import 'package:inter_hospital_app/features/notification/data/repositories/notification_repository_impl.dart';
import 'package:inter_hospital_app/features/notification/domain/repositories/notification_repository.dart';
import 'package:inter_hospital_app/features/notification/presentation/cubit/dot_notification_cubit.dart';
import 'package:inter_hospital_app/features/notification/presentation/cubit/notification_cubit.dart';
import 'package:inter_hospital_app/features/setting/data/datasources/notification_setting_local_data_source.dart';
import 'package:inter_hospital_app/features/setting/data/datasources/theme_local_data_source.dart';
import 'package:inter_hospital_app/features/setting/data/repositories/notification_setting_repository_impl.dart';
import 'package:inter_hospital_app/features/setting/data/repositories/theme_repository_impl.dart';
import 'package:inter_hospital_app/features/setting/domain/repositories/notification_setting_repository.dart';
import 'package:inter_hospital_app/features/setting/domain/repositories/theme_repository.dart';
import 'package:inter_hospital_app/features/setting/presentation/cubit/notification_setting_cubit.dart';
import 'package:inter_hospital_app/features/setting/presentation/cubit/theme_cubit.dart';
import 'package:inter_hospital_app/features/view_medical_record/data/datasource/medical_record_local_data_source.dart';
import 'package:inter_hospital_app/firebase_options.dart';
import 'package:inter_hospital_app/share/dio/remote_service.dart';
import 'package:inter_hospital_app/share/navigation/push_screen_factory.dart';
import 'package:inter_hospital_app/share/notification/local_notification_service.dart';
import 'package:inter_hospital_app/share/notification/push_notification_service.dart';
import 'package:inter_hospital_app/share/types/push_screen_type.dart';
import 'package:inter_hospital_app/splash_screen.dart';
import 'share/themes/app_theme.dart';


final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Khởi tạo Firebase
  if (!Platform.isIOS && !Platform.isMacOS) {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  }

  runApp(const InitializerApp());
}

/// Ứng dụng khởi tạo: Hiện SplashScreen cho đến khi init xong
class InitializerApp extends StatelessWidget {
  const InitializerApp({super.key});

  Future<_AppDependencies> _initApp() async {
    // Auth
    final AuthRepository authRepository = AuthRepositoryImpl(
      remoteDataSource: AuthRemoteDataSourceImpl(),
      localDataSource: AuthLocalDataSourceImpl(),
      notificationLocalDataSource: NotificationLocalDataSourceImpl(),
      medicalRecordLocalDataSource: MedicalRecordLocalDataSourceImpl(),
    );
    final AuthCubit authCubit = AuthCubit(authRepository);

    // Theme
    final ThemeRepository themeRepository = ThemeRepositoryImpl(
      dataSource: ThemeLocalDataSourceImpl(),
    );

    // Notification
    final NotificationRepository notificationRepository =
    NotificationRepositoryImpl(NotificationLocalDataSourceImpl());
    final NotificationSettingRepository notificationSettingRepository =
    NotificationSettingRepositoryImpl(
        NotificationSettingLocalDataSourceImpl());

    // Permission
    final permissionRepository = PermissionRepositoryImpl(
      localDataSource: PermissionLocalDataSourceImpl(),
      remoteDataSource: PermissionRemoteDataSourceImpl(),
    );

    // Tạo RemoteService
    RemoteService(authCubit: authCubit);
    await Future.wait([
      // Khởi tạo Push Notification ở local
      LocalNotificationService.init(),

      // Chỉ có thể ở chiều đứng
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
      ]),

      // Khởi tạo Push Notification trước khi mở app
    if (!Platform.isIOS && !Platform.isMacOS)
      PushNotificationService.init(
        notificationRepository: notificationRepository,
        notificationSettingRepository: notificationSettingRepository,
      ),
    ]);

    return _AppDependencies(
      authCubit: authCubit,
      themeRepository: themeRepository,
      notificationRepository: notificationRepository,
      notificationSettingRepository: notificationSettingRepository,
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<_AppDependencies>(
      future: _initApp(),
      builder: (context, snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return const MaterialApp(
            home: SplashScreen(),
          );
        }

        if (snapshot.hasError) {
          return MaterialApp(
            home: Scaffold(
              body: Center(
                child: Text("Lỗi khởi tạo: ${snapshot.error}"),
              ),
            ),
          );
        }

        if (!snapshot.hasData) {
          return const MaterialApp(
            home: SplashScreen(),
          );
        }

        final dependency = snapshot.data!;

        return MultiBlocProvider(
            providers: [
              BlocProvider(create: (context) {
                final cubit = dependency.authCubit;
                Future.microtask(() => cubit.getCurrentUser());
                return cubit;
              }),
              BlocProvider(
                create: (context) =>
                ThemeCubit(dependency.themeRepository)..getCurrentTheme(),
              ),
              BlocProvider(
                create: (context) =>
                    NotificationCubit(dependency.notificationRepository),
              ),
              BlocProvider(
                create: (context) =>
                    DotNotificationCubit(dependency.notificationRepository),
              ),
              BlocProvider(
                create: (context) => NotificationSettingCubit(
                    dependency.notificationSettingRepository),
              ),
            ],
            child: ScreenUtilInit(
              designSize: const Size(430, 932), // màn hình iphone 14 pro
              minTextAdapt: true,
              builder: (context, child) {
                // Khởi tạo Push Notification trước khi mở app
                PushNotificationService.init(
                  notificationRepository: dependency.notificationRepository,
                  notificationSettingRepository: dependency.notificationSettingRepository,
                );
                return const MyApp();
              },
            ),
          );
      },
    );
  }
}

class _AppDependencies {
  final AuthCubit authCubit;
  final ThemeRepository themeRepository;
  final NotificationRepository notificationRepository;
  final NotificationSettingRepository notificationSettingRepository;

  _AppDependencies({
    required this.authCubit,
    required this.themeRepository,
    required this.notificationRepository,
    required this.notificationSettingRepository,
  });
}

/// App chính sau khi init xong
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeMode = context
        .watch<ThemeCubit>()
        .state;

    return MaterialApp(
      title: "Ứng dụng liên viện",
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: themeMode,
      navigatorKey: navigatorKey,
      routes: {
        '/login': (context) => const LoginScreen(),
      },
      home: BlocListener<AuthCubit, AuthState>(
        listenWhen: (previous, current) =>
        current is AuthSuccess || current is AuthInitial,
        listener: (context, state) {
          if (state is AuthSuccess) {
            PushScreenFactory().create(PushScreenType.home).push(context);
          } else if (state is AuthInitial) {
            PushScreenFactory().create(PushScreenType.login).push(context);
          }
        },
        child: const SplashScreen(),
      ),
    );
  }
}
