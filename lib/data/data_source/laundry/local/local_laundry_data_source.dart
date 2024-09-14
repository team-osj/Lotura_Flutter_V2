import 'package:hive/hive.dart';
import 'package:lotura_v2/core/hive/laundry_room_option.dart';

class LocalLaundryDataSource {
  late final Box<LaundryRoomOption> _laundryBox;

  Future<void> init() async {
    if (!Hive.isBoxOpen("laundryRoomOption")) {
      _laundryBox = await Hive.openBox<LaundryRoomOption>("laundryRoomOption");
    }
  }

  Future<void> updateRoomOption({
    required LaundryRoomOption value,
  }) async {
    await init();
    return _laundryBox.put("laundryRoomOption", value);
  }

  Future<LaundryRoomOption?> getRoomOption() async {
    await init();
    return _laundryBox.get("laundryRoomOption");
  }
}

