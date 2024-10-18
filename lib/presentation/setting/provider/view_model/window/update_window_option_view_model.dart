import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lotura_v2/core/hive/window_option.dart';
import 'package:lotura_v2/domain/use_case/window/update_window_option_use_case.dart';
import 'package:lotura_v2/presentation/setting/provider/state/window/update_window_option_state.dart';

class UpdateWindowOptionViewModel
    extends StateNotifier<UpdateWindowOptionState> {
  final UpdateWindowOptionUseCase _updateWindowOptionUseCase;

  UpdateWindowOptionViewModel({
    required UpdateWindowOptionUseCase updateWindowOptionUseCase,
  })  : _updateWindowOptionUseCase = updateWindowOptionUseCase,
        super(UpdateWindowOptionState.initial);

  Future<void> execute({
    required WindowOption option,
  }) async {
    try {
      state = UpdateWindowOptionState.loading;

      await _updateWindowOptionUseCase.execute(option: option);

      state = UpdateWindowOptionState.success;
    } catch (err) {
      state = UpdateWindowOptionState.failure;
      throw Exception(err.toString());
    }
  }
}
