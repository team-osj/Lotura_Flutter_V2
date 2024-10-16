import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lotura_v2/domain/use_case/notice/provider/get_notice_option_use_case_provider.dart';
import 'package:lotura_v2/presentation/notice/provider/model/notice_model.dart';
import 'package:lotura_v2/presentation/notice/provider/state/get_notice_option_state.dart';
import 'package:lotura_v2/presentation/notice/provider/view_model/get_notice_option_view_model.dart';

final getNoticeOptionViewModelProvider = StateNotifierProvider<
    GetNoticeOptionViewModel, NoticeModel<GetNoticeOptionState, List<int?>>>(
  (ref) => GetNoticeOptionViewModel(
    getNoticeOptionUseCase: ref.watch(getNoticeOptionUseCaseProvider),
  ),
);
