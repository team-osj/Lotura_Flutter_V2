import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lotura_v2/domain/repository/theme/provider/theme_repository_provider.dart';
import 'package:lotura_v2/domain/use_case/theme/get_theme_option_use_case.dart';

final getThemeOptionUseCaseProvider = Provider<GetThemeOptionUseCase>(
  (ref) => GetThemeOptionUseCase(
    themeRepository: ref.watch(themeRepositoryProvider),
  ),
);
