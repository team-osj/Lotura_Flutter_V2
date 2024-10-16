import 'package:lotura_v2/domain/repository/notice/notice_repository.dart';

class UpdateNoticeOptionUseCase {
  final NoticeRepository _noticeRepository;

  UpdateNoticeOptionUseCase({
    required NoticeRepository noticeRepository,
  }) : _noticeRepository = noticeRepository;

  Future<void> execute({required int id}) async =>
      await _noticeRepository.updateNoticeOption(id: id);
}
