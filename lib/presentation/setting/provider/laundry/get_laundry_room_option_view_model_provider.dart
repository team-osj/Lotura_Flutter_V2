import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lotura_v2/domain/entity/laundry/laundry_room_option_entity.dart';
import 'package:lotura_v2/domain/use_case/laundry/provider/get_laundry_room_option_use_case_provider.dart';
import 'package:lotura_v2/presentation/setting/provider/state/laundry/get_laundry_room_option_state.dart';
import 'package:lotura_v2/presentation/setting/provider/view_model/laundry/get_laundry_room_option_view_model.dart';

final getLaundryRoomOptionViewModelProvider = StateNotifierProvider<
    GetLaundryRoomOptionViewModel,
    LaundryRoomOptionEntity<GetLaundryRoomOptionState>>(
  (ref) => GetLaundryRoomOptionViewModel(
    ref.watch(getLaundryRoomOptionUseCaseProvider),
  ),
);
