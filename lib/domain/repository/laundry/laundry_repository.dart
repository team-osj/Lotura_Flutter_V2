import 'package:lotura_v2/core/hive/laundry_room_option.dart';

abstract class LaundryRepository {
  Future<void> updateRoomOption({
    required LaundryRoomOption value,
  });

  Future<LaundryRoomOption?> getRoomOption();
}
