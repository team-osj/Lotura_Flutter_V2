import 'package:lotura_v2/core/hive/laundry_room_option.dart';
import 'package:lotura_v2/domain/entity/laundry/laundry_entity.dart';

abstract class LaundryRepository {
  Stream<LaundryEntity> get laundryList;

  void initWebSocket();

  Future<List<LaundryEntity>> getAllLaundryList();

  Future<void> updateRoomOption({
    required LaundryRoomOption value,
  });

  Future<LaundryRoomOption?> getRoomOption();
}
