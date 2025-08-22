import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inter_hospital_app/features/setting/domain/repositories/theme_repository.dart';

class ThemeCubit extends Cubit<ThemeMode?> {
  final ThemeRepository repo;
  ThemeCubit(this.repo) : super(null);

  Future<void> getCurrentTheme() async {
    final isDarkMode = await repo.isCurrentDarkTheme();
    emit(isDarkMode ? ThemeMode.dark : ThemeMode.light);
  }

  void switchTheme() {
    state == ThemeMode.dark ? emit(ThemeMode.light) : emit(ThemeMode.dark);
    repo.switchTheme(state == ThemeMode.dark);
  }
}
