import 'package:flutter/material.dart';
import 'package:lotura_v2/domain/repository/theme/theme_repository.dart';

class GetThemeOptionUseCase {
  final ThemeRepository _themeRepository;

  GetThemeOptionUseCase({
    required ThemeRepository themeRepository,
  }) : _themeRepository = themeRepository;

  Future<ThemeMode?> execute() async => await _themeRepository.getThemeOption();
}
