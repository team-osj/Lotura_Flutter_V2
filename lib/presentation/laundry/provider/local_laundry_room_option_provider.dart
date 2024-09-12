import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lotura_v2/domain/entity/laundry/laundry_room_option_entity.dart';
import 'package:lotura_v2/presentation/laundry/provider/state/local_laundry_room_option_state.dart';
import 'package:lotura_v2/presentation/laundry/provider/view_model/local_laundry_room_option_view_model.dart';
import 'package:lotura_v2/presentation/setting/provider/get_laundry_room_option_view_model_provider.dart';

final localLaundryRoomOptionViewModelProvider = StateNotifierProvider<
    LocalLaundryRoomOptionViewModel,
    LaundryRoomOptionEntity<LocalLaundryRoomOptionState>>(
  (ref) => LocalLaundryRoomOptionViewModel(storedOption: ref.watch(getLaundryRoomOptionViewModelProvider).option ?? "남자 학교측"),
);
