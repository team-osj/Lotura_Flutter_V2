import 'package:lotura_v2/core/provider/state/laundry/laundry_room_option.dart';
import 'package:lotura_v2/domain/repository/laundry/laundry_repository.dart';

class GetLaundryRoomOptionUseCase {
  final LaundryRepository _laundryRepository;

  const GetLaundryRoomOptionUseCase({
    required LaundryRepository laundryRepository,
  }) : _laundryRepository = laundryRepository;

  Future<LaundryRoomOption?> execute() async =>
      await _laundryRepository.getRoomOption(key: "laundryRoomOption");
}
