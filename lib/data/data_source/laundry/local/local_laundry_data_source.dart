import 'package:hive/hive.dart';
import 'package:lotura_v2/core/hive/laundry_room_option.dart';

class LocalLaundryDataSource {
  late final Box<LaundryRoomOption> _laundryBox;

  Future<void> init({required String key}) async {
    if (!Hive.isBoxOpen("laundryRoomOption")) {
      _laundryBox = await Hive.openBox<LaundryRoomOption>("laundryRoomOption");
    }
  }

  Future<void> updateRoomOption({
    required String key,
    required LaundryRoomOption value,
  }) async {
    await init(key: key);
    return _laundryBox.put(key, value);
  }

  Future<LaundryRoomOption?> getRoomOption({
    required String key,
  }) async {
    await init(key: key);
    return _laundryBox.get(key);
  }
}

