import 'package:lotura_v2/domain/repository/notice/notice_repository.dart';

class GetNoticeOptionUseCase {
  final NoticeRepository _noticeRepository;

  GetNoticeOptionUseCase({
    required NoticeRepository noticeRepository,
  }) : _noticeRepository = noticeRepository;

  Future<List<int?>> execute() async =>
      await _noticeRepository.getNoticeOption();
}
