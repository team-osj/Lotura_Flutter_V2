import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lotura_v2/domain/use_case/theme/provider/update_theme_option_use_case_provider.dart';
import 'package:lotura_v2/core/theme/view_model/state/update_theme_option_state.dart';
import 'package:lotura_v2/core/theme/view_model/update_theme_option_view_model.dart';

final updateThemeOptionViewModelProvider =
    StateNotifierProvider<UpdateThemeOptionViewModel, UpdateThemeOptionState>(
  (ref) => UpdateThemeOptionViewModel(
    updateThemeOptionUseCase: ref.watch(updateThemeOptionUseCaseProvider),
  ),
);
