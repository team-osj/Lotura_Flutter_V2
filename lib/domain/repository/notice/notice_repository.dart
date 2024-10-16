import 'package:lotura_v2/domain/entity/notice/notice_entity.dart';

abstract class NoticeRepository {
  Future<List<NoticeEntity>> getNotice();

  Future<void> updateNoticeOption({required int id});

  Future<List<int?>> getNoticeOption();
}
