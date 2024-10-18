import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lotura_v2/core/hive/window_option.dart';
import 'package:lotura_v2/domain/entity/window/window_option_entity.dart';
import 'package:lotura_v2/domain/use_case/window/get_window_option_use_case.dart';
import 'package:lotura_v2/presentation/setting/provider/state/window/get_window_option_state.dart';

class GetWindowOptionViewModel
    extends StateNotifier<WindowOptionEntity<GetWindowOptionState>> {
  final GetWindowOptionUseCase _getWindowOptionUseCase;

  GetWindowOptionViewModel({
    required GetWindowOptionUseCase getWindowOptionUseCase,
  })
      : _getWindowOptionUseCase = getWindowOptionUseCase,
        super(
        WindowOptionEntity<GetWindowOptionState>(
          state: GetWindowOptionState.initial,
          option: null,
        ),
      );

  Future<void> execute() async {
    try {
      state = state.copyWith(state: GetWindowOptionState.loading);

      final response = await _getWindowOptionUseCase.execute();

      switch (response) {
        case WindowOption.apply :
          state = state.copyWith(option: "내 세탁실");
        default:
          state = state.copyWith(option: "세탁실 현황");
      }

      state = state.copyWith(state: GetWindowOptionState.success);
    } catch (err) {
      state = state.copyWith(state: GetWindowOptionState.failure);
      throw Exception(err.toString());
    }
  }
}
