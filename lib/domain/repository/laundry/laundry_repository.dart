import 'package:lotura_v2/core/provider/state/laundry/laundry_room_option.dart';

abstract class LaundryRepository {
  Future<void> updateRoomOption({
    required String key,
    required LaundryRoomOption value,
  });

  Future<LaundryRoomOption?> getRoomOption({required String key});
}
