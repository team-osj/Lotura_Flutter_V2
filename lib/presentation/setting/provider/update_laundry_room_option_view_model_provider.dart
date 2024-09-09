import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lotura_v2/domain/repository/laundry/provider/laundry_repository_provider.dart';
import 'package:lotura_v2/domain/use_case/laundry/update_laundry_room_option_use_case.dart';
import 'package:lotura_v2/presentation/setting/provider/state/update_laundry_room_option_state.dart';
import 'package:lotura_v2/presentation/setting/provider/view_model/update_laundry_room_option_view_model.dart';

final updateLaundryRoomOptionViewModelProvider = StateNotifierProvider<
    UpdateLaundryRoomOptionViewModel, UpdateLaundryRoomOptionState>(
  (ref) => UpdateLaundryRoomOptionViewModel(
    UpdateLaundryRoomOptionUseCase(
      laundryRepository: ref.watch(laundryRepositoryProvider),
    ),
  ),
);
