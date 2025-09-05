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
import 'package:inter_hospital_app/features/create_code/data/datasources/smart_contract_local_data_source.dart';
import 'package:inter_hospital_app/features/create_code/data/datasources/smart_contract_remote_data_source.dart';
import 'package:inter_hospital_app/features/create_code/data/repositories/smart_contract_repository_impl.dart';
import 'package:inter_hospital_app/features/create_code/presentation/cubit/qr_code_cubit.dart';
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
import 'package:inter_hospital_app/features/view_health_insurance/data/datasources/health_insurance_local_data_source.dart';
import 'package:inter_hospital_app/firebase_options.dart';
import 'package:inter_hospital_app/share/notification/local_notification_service.dart';
import 'package:inter_hospital_app/share/notification/push_notification_service.dart';
import 'package:inter_hospital_app/splash_screen.dart';
import 'share/themes/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Khởi tạo Firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // Khởi tạo Push Notification ở local
  await LocalNotificationService.init();

  // Chỉ có thể ở chiều đứng
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  // Auth
  final AuthRepository authRepository = AuthRepositoryImpl(
    remoteDataSource: AuthRemoteDataSourceImpl(),
    localDataSource: AuthLocalDataSourceImpl(),
    smartContractLocalDataSource: SmartContractLocalDataSourceImpl(),
    healthInsuranceLocalDataSource: HealthInsuranceLocalDataSourceImpl(),
    notificationLocalDataSource: NotificationLocalDataSourceImpl(),
  );

  // Theme
  final ThemeRepository themeRepository = ThemeRepositoryImpl(
    dataSource: ThemeLocalDataSourceImpl(),
  );

  // Notification
  final NotificationRepository notificationRepository =
  NotificationRepositoryImpl(NotificationLocalDataSourceImpl());
  final NotificationSettingRepository notificationSettingRepository =
  NotificationSettingRepositoryImpl(
      NotificationSettingLocalDataSourceImpl(),
  );

  // QR Code
  final smartContractRepository = SmartContractRepositoryImpl(
    localDataSource: SmartContractLocalDataSourceImpl(),
    remoteDataSource: SmartContractRemoteDataSourceImpl(),
  );

  // Bọc State toàn app
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (context) =>
        AuthCubit(authRepository)
          ..getCurrentUser(),
      ),
      BlocProvider(
        create: (context) =>
        ThemeCubit(themeRepository)
          ..getCurrentTheme(),
      ),
      BlocProvider(create: (context) => QrCodeCubit(smartContractRepository)),
      BlocProvider(
          create: (context) =>
              NotificationCubit(notificationRepository)),
      BlocProvider(
          create: (context) =>
              DotNotificationCubit(notificationRepository)),
      BlocProvider(
          create: (context) =>
              NotificationSettingCubit(notificationSettingRepository)),
    ],
    child: ScreenUtilInit(
      designSize: const Size(430, 932), // màn hình iphone 14 pro
      minTextAdapt: true,
      builder: (context, child) {
        // Khởi tạo Push Notification trước khi mở app
        PushNotificationService.init(
            context: context,
            notificationRepository: notificationRepository,
            notificationSettingRepository: notificationSettingRepository,
        );
        return const MyApp();
      },
    ),
  ));
}

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
      home: const SplashScreen(),
    );
  }
}
