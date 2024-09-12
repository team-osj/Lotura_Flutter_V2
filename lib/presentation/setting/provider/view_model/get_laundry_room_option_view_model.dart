import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lotura_v2/core/provider/state/laundry/laundry_room_option.dart';
import 'package:lotura_v2/domain/entity/laundry/laundry_room_option_entity.dart';
import 'package:lotura_v2/domain/use_case/laundry/get_laundry_room_option_use_case.dart';
import 'package:lotura_v2/presentation/setting/provider/state/get_laundry_room_option_state.dart';

class GetLaundryRoomOptionViewModel
    extends StateNotifier<LaundryRoomOptionEntity<GetLaundryRoomOptionState>> {
  final GetLaundryRoomOptionUseCase _getLaundryRoomOptionUseCase;

  GetLaundryRoomOptionViewModel(
      GetLaundryRoomOptionUseCase getLaundryRoomOptionUseCase)
      : _getLaundryRoomOptionUseCase = getLaundryRoomOptionUseCase,
        super(
          LaundryRoomOptionEntity<GetLaundryRoomOptionState>(
            state: GetLaundryRoomOptionState.initial,
            option: null,
          ),
        );

  Future<void> execute() async {
    try {
      state = state.copyWith(state: GetLaundryRoomOptionState.loading);

      final response = await _getLaundryRoomOptionUseCase.execute();

      switch (response) {
        case LaundryRoomOption.maleDormitory:
          state = state.copyWith(option: "남자 기숙사측");
        case LaundryRoomOption.female:
          state = state.copyWith(option: "여자 기숙사측");
        default:
          /// option이 null일 경우(앱이 설치되고 처음 실행되었을 때)에도 기본값은 "남자 학교측"
          state = state.copyWith(option: "남자 학교측");
      }

      state = state.copyWith(state: GetLaundryRoomOptionState.success);
    } catch (err) {
      state = state.copyWith(state: GetLaundryRoomOptionState.failure);

      throw Exception(err.toString());
    }
  }
}
