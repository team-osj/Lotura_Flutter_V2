import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lotura_v2/domain/repository/theme/provider/theme_repository_provider.dart';
import 'package:lotura_v2/domain/use_case/theme/update_theme_option_use_case.dart';

final updateThemeOptionUseCaseProvider = Provider<UpdateThemeOptionUseCase>(
  (ref) => UpdateThemeOptionUseCase(
    themeRepository: ref.watch(themeRepositoryProvider),
  ),
);
