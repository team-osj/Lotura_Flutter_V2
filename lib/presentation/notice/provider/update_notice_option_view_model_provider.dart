import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lotura_v2/domain/use_case/notice/provider/update_notice_option_use_case_provider.dart';
import 'package:lotura_v2/presentation/notice/provider/state/update_notice_option_state.dart';
import 'package:lotura_v2/presentation/notice/provider/view_model/update_notice_option_view_model.dart';

final updateNoticeOptionViewModelProvider =
    StateNotifierProvider<UpdateNoticeOptionViewModel, UpdateNoticeOptionState>(
  (ref) => UpdateNoticeOptionViewModel(
    updateNoticeOptionUseCase: ref.watch(updateNoticeOptionUseCaseProvider),
  ),
);
