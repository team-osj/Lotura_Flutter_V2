import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lotura_v2/domain/use_case/window/provider/update_window_option_use_case_provider.dart';
import 'package:lotura_v2/presentation/setting/provider/state/window/update_window_option_state.dart';
import 'package:lotura_v2/presentation/setting/provider/view_model/window/update_window_option_view_model.dart';

final updateWindowOptionViewModelProvider =
    StateNotifierProvider<UpdateWindowOptionViewModel, UpdateWindowOptionState>(
  (ref) => UpdateWindowOptionViewModel(
    updateWindowOptionUseCase: ref.watch(updateWindowOptionUseCaseProvider),
  ),
);
