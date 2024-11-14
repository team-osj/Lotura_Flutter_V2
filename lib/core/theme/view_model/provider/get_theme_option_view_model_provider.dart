import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lotura_v2/core/theme/view_model/model/theme_model.dart';
import 'package:lotura_v2/domain/use_case/theme/provider/get_theme_option_use_case_provider.dart';
import 'package:lotura_v2/core/theme/view_model/get_theme_option_view_model.dart';

final getThemeOptionViewModelProvider = StateNotifierProvider<GetThemeOptionViewModel, ThemeModel>(
  (ref) => GetThemeOptionViewModel(
    getThemeOptionUseCase: ref.watch(getThemeOptionUseCaseProvider),
  ),
);
