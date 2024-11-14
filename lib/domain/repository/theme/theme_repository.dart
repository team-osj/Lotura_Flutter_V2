import 'package:lotura_v2/core/hive/theme_option.dart';

abstract class ThemeRepository {
  Future<void> updateThemeOption({required ThemeOption mode});

  Future<ThemeOption?> getThemeOption();
}
