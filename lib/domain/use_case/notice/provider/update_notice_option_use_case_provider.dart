import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lotura_v2/domain/repository/notice/provider/notice_repository_provider.dart';
import 'package:lotura_v2/domain/use_case/notice/update_notice_option_use_case.dart';

final updateNoticeOptionUseCaseProvider = Provider<UpdateNoticeOptionUseCase>(
  (ref) => UpdateNoticeOptionUseCase(
    noticeRepository: ref.watch(noticeRepositoryProvider),
  ),
);
