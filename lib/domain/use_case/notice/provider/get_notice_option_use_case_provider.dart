import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lotura_v2/domain/repository/notice/provider/notice_repository_provider.dart';
import 'package:lotura_v2/domain/use_case/notice/get_notice_option_use_case.dart';

final getNoticeOptionUseCaseProvider = Provider<GetNoticeOptionUseCase>(
  (ref) => GetNoticeOptionUseCase(
    noticeRepository: ref.watch(noticeRepositoryProvider),
  ),
);
