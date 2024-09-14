import 'package:lotura_v2/core/hive/laundry_room_option.dart';
import 'package:lotura_v2/domain/repository/laundry/laundry_repository.dart';

class UpdateLaundryRoomOptionUseCase {
  final LaundryRepository _laundryRepository;

  UpdateLaundryRoomOptionUseCase({
    required LaundryRepository laundryRepository,
  }) : _laundryRepository = laundryRepository;

  Future<void> execute({
    required LaundryRoomOption value,
  }) async =>
      await _laundryRepository.updateRoomOption(value: value);
}
