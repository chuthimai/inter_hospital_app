import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:inter_hospital_app/features/auth/data/datasources/auth_local_data_source.dart';
import 'package:inter_hospital_app/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:inter_hospital_app/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:inter_hospital_app/features/auth/domain/repositories/auth_repository.dart';
import 'package:inter_hospital_app/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:inter_hospital_app/features/setting/data/datasources/theme_local_data_source.dart';
import 'package:inter_hospital_app/features/setting/data/repositories/theme_repository_impl.dart';
import 'package:inter_hospital_app/features/setting/domain/repositories/theme_repository.dart';
import 'package:inter_hospital_app/features/setting/presentation/cubit/theme_cubit.dart';
import 'package:inter_hospital_app/splash_screen.dart';
import 'share/themes/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  // Auth
  final AuthRemoteDataSource remoteDataSource = AuthRemoteDataSourceImpl();
  final AuthLocalDataSource localDataSource = AuthLocalDataSourceImpl();
  final AuthRepository authRepository = AuthRepositoryImpl(
    remoteDataSource: remoteDataSource,
    localDataSource: localDataSource,
  );

  // Theme
  final ThemeLocalDataSource themeLocalDataSource = ThemeLocalDataSourceImpl();
  final ThemeRepository themeRepository = ThemeRepositoryImpl(
    dataSource: themeLocalDataSource,
  );

  // Bọc State toàn app
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (context) =>
            AuthCubit(authRepository)..getCurrentUser(),
      ),
      BlocProvider(
        create: (context) => ThemeCubit(themeRepository)..getCurrentTheme(),
      ),
    ],
    child: ScreenUtilInit(
      designSize: const Size(430, 932), // màn hình iphone 14 pro
      minTextAdapt: true,
      builder: (context, child) {
        return const MyApp();
      },
    ),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeMode = context.watch<ThemeCubit>().state;

    return MaterialApp(
      title: "Ứng dụng liên viện",
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: themeMode,
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SplashScreen();
  }
}
