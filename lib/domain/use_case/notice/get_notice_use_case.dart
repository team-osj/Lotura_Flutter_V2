import 'package:lotura_v2/domain/entity/notice/notice_entity.dart';
import 'package:lotura_v2/domain/repository/notice/notice_repository.dart';

class GetNoticeUseCase {
  final NoticeRepository _noticeRepository;

  GetNoticeUseCase({
    required NoticeRepository noticeRepository,
  }) : _noticeRepository = noticeRepository;

  Future<List<NoticeEntity>> execute() async =>
      await _noticeRepository.getNotice();
}
