import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lotura_v2/core/hive/laundry_room_option.dart';
import 'package:lotura_v2/domain/use_case/laundry/update_laundry_room_option_use_case.dart';
import 'package:lotura_v2/presentation/setting/provider/state/update_laundry_room_option_state.dart';

class UpdateLaundryRoomOptionViewModel
    extends StateNotifier<UpdateLaundryRoomOptionState> {
  final UpdateLaundryRoomOptionUseCase _updateLaundryRoomOptionUseCase;

  UpdateLaundryRoomOptionViewModel(
      UpdateLaundryRoomOptionUseCase updateLaundryRoomOptionUseCase)
      : _updateLaundryRoomOptionUseCase = updateLaundryRoomOptionUseCase,
        super(UpdateLaundryRoomOptionState.initial);

  Future<void> execute(LaundryRoomOption value) async {
    try {
      state = UpdateLaundryRoomOptionState.loading;

      _updateLaundryRoomOptionUseCase.execute(value: value);

      state = UpdateLaundryRoomOptionState.success;
    } catch (err) {
      state = UpdateLaundryRoomOptionState.failure;

      throw Exception(err.toString());
    }
  }
}
