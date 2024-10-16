import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lotura_v2/domain/entity/notice/notice_entity.dart';
import 'package:lotura_v2/domain/use_case/notice/provider/get_notice_use_case_provider.dart';
import 'package:lotura_v2/presentation/notice/provider/model/notice_model.dart';
import 'package:lotura_v2/presentation/notice/provider/state/get_notice_state.dart';
import 'package:lotura_v2/presentation/notice/provider/view_model/get_notice_view_model.dart';

final getNoticeViewModelProvider =
    StateNotifierProvider<GetNoticeViewModel, NoticeModel<GetNoticeState, List<NoticeEntity>>>(
  (ref) => GetNoticeViewModel(
    getNoticeUseCase: ref.watch(getNoticeUseCaseProvider),
  ),
);
