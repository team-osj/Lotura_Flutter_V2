import 'package:hive/hive.dart';

class LocalNoticeDataSource {
  Box<int>? _noticeBox;

  Future<void> init() async {
    if (_noticeBox != null && _noticeBox!.isOpen) {
      // 이미 박스가 초기화되어 있으면 아무 작업도 하지 않음
      return;
    }
    _noticeBox = await Hive.openBox<int>("noticeOption");
  }

  Future<void> updateNoticeOption({
    required int id,
  }) async {
    await init();
    _noticeBox!.add(id);
  }

  Future<List<int?>> getNoticeOption() async {
    await init();
    return _noticeBox!.values.toList();
  }
}
