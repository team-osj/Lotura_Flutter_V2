import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lotura_v2/core/dummy/laundry_room_locate_dummy.dart';
import 'package:lotura_v2/core/provider/state/device/device_array_type.dart';
import 'package:lotura_v2/domain/entity/laundry/laundry_room_option_entity.dart';
import 'package:lotura_v2/presentation/laundry/provider/state/local_laundry_room_option_state.dart';

class LocalLaundryRoomOptionViewModel extends StateNotifier<
    LaundryRoomOptionEntity<LocalLaundryRoomOptionState>> {
  LocalLaundryRoomOptionViewModel({
    required String storedOption,
    required List<Map<DeviceArrayType, List<int>>> storedLocate,
  }) : super(
    LaundryRoomOptionEntity(
      state: LocalLaundryRoomOptionState.initial,
      option: storedOption,
      locate: storedLocate,
    ),
  );

  void changeOption({
    required String option,
    required List<Map<DeviceArrayType, List<int>>> locate,
  }) {
    try {
      state = state.copyWith(state: LocalLaundryRoomOptionState.loading);
      if (option != state.option) {
        state = state.copyWith(
            state: LocalLaundryRoomOptionState.success,
            option: option,
            locate: locate
        );
      }
    } catch (err) {
      state = state.copyWith(state: LocalLaundryRoomOptionState.failure);
    }
  }
}
