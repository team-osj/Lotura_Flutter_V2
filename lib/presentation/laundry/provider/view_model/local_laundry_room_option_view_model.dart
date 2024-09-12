import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lotura_v2/domain/entity/laundry/laundry_room_option_entity.dart';
import 'package:lotura_v2/presentation/laundry/provider/state/local_laundry_room_option_state.dart';

class LocalLaundryRoomOptionViewModel extends StateNotifier<LaundryRoomOptionEntity<LocalLaundryRoomOptionState>> {

  LocalLaundryRoomOptionViewModel({required String storedOption})
      : super(
          LaundryRoomOptionEntity(
            state: LocalLaundryRoomOptionState.initial,
            option: storedOption,
          ),
        );

  void changeOption({
    required String option,
  }) {
    try {
      state = state.copyWith(state: LocalLaundryRoomOptionState.loading);
      if (option != state.option) {
        state = state.copyWith(option: option, state: LocalLaundryRoomOptionState.success);
      }
    } catch (err) {
      state = state.copyWith(state: LocalLaundryRoomOptionState.failure);
    }
  }
}
