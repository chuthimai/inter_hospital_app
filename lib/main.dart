import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:inter_hospital_app/features/auth/data/datasources/auth_local_data_source.dart';
import 'package:inter_hospital_app/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:inter_hospital_app/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:inter_hospital_app/features/auth/domain/repositories/auth_repository.dart';
import 'package:inter_hospital_app/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:inter_hospital_app/features/auth/presentation/cubit/user_session_cubit.dart';
import 'package:inter_hospital_app/splash_screen.dart';
import 'share/themes/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  final AuthRemoteDataSource remoteDataSource = AuthRemoteDataSourceImpl();
  final AuthLocalDataSource localDataSource = AuthLocalDataSourceImpl();
  final AuthRepository repo = AuthRepositoryImpl(
    remoteDataSource: remoteDataSource,
    localDataSource: localDataSource,
  );
  final userSession = UserSessionCubit();

  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(create: (context) => userSession),
      BlocProvider(
          create: (context) => AuthCubit(repo, userSession)..getCurrentUser())
    ],
    child: ScreenUtilInit(
      designSize: const Size(430, 932), // iphone 14 pro screen
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
    return MaterialApp(
      title: "Ứng dụng liên viện",
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: ThemeMode.system,
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
