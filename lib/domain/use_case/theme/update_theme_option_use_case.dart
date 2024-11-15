import 'package:lotura_v2/core/hive/theme_option.dart';
import 'package:lotura_v2/domain/repository/theme/theme_repository.dart';

class UpdateThemeOptionUseCase {
  final ThemeRepository _themeRepository;

  UpdateThemeOptionUseCase({
    required ThemeRepository themeRepository,
  }) : _themeRepository = themeRepository;

  Future<void> execute({
    required ThemeOption mode,
  }) async =>
      await _themeRepository.updateThemeOption(mode: mode);
}
