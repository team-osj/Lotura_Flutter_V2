import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lotura_v2/domain/entity/window/window_option_entity.dart';
import 'package:lotura_v2/domain/use_case/window/provider/get_window_option_use_case_provider.dart';
import 'package:lotura_v2/presentation/setting/provider/state/window/get_window_option_state.dart';
import 'package:lotura_v2/presentation/setting/provider/view_model/window/get_window_option_view_model.dart';

final getWindowOptionViewModelProvider = StateNotifierProvider<
    GetWindowOptionViewModel, WindowOptionEntity<GetWindowOptionState>>(
  (ref) => GetWindowOptionViewModel(
    getWindowOptionUseCase: ref.watch(getWindowOptionUseCaseProvider),
  ),
);
