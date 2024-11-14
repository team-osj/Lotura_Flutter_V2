import 'package:flutter/material.dart';

abstract class ThemeRepository {
  Future<void> updateThemeOption({required ThemeMode mode});

  Future<ThemeMode?> getThemeOption();
}
