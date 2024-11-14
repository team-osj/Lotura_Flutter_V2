import 'package:flutter/src/material/app.dart';
import 'package:lotura_v2/data/data_source/theme/local/local_theme_data_source.dart';
import 'package:lotura_v2/domain/repository/theme/theme_repository.dart';

class ThemeRepositoryImpl implements ThemeRepository {
  final LocalThemeDataSource _localThemeDataSource;

  ThemeRepositoryImpl({
    required LocalThemeDataSource localThemeDataSource,
  }) : _localThemeDataSource = localThemeDataSource;

  @override
  Future<ThemeMode?> getThemeOption() async =>
      await _localThemeDataSource.getThemeOption();

  @override
  Future<void> updateThemeOption({
    required ThemeMode mode,
  }) async =>
      await _localThemeDataSource.updateThemeOption(mode: mode);
}
