import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class LocalThemeDataSource {
  Box<ThemeMode>? _themeBox;

  Future<void> init() async {
    if (_themeBox != null && _themeBox!.isOpen) {
      // 이미 박스가 초기화되어 있으면 아무 작업도 하지 않음
      return;
    }
    _themeBox = await Hive.openBox<ThemeMode>("themeOption");
  }

  Future<void> updateThemeOption({
    required ThemeMode mode,
  }) async {
    await init();
    _themeBox!.add(mode);
  }

  Future<ThemeMode?> getThemeOption() async {
    await init();
    if (_themeBox!.isNotEmpty) {
      return _themeBox!.getAt(0);
    }
    return null;
  }
}
