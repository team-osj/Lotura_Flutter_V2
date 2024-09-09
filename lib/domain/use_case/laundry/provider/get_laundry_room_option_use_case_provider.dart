import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lotura_v2/domain/repository/laundry/provider/laundry_repository_provider.dart';
import 'package:lotura_v2/domain/use_case/laundry/get_laundry_room_option_use_case.dart';

final getLaundryRoomOptionUseCaseProvider =
    Provider<GetLaundryRoomOptionUseCase>(
  (ref) => GetLaundryRoomOptionUseCase(
    laundryRepository: ref.watch(laundryRepositoryProvider),
  ),
);
