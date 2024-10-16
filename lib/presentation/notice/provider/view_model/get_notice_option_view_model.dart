import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lotura_v2/domain/use_case/notice/get_notice_option_use_case.dart';
import 'package:lotura_v2/presentation/notice/provider/model/notice_model.dart';
import 'package:lotura_v2/presentation/notice/provider/state/get_notice_option_state.dart';

class GetNoticeOptionViewModel
    extends StateNotifier<NoticeModel<GetNoticeOptionState, List<int?>>> {
  final GetNoticeOptionUseCase _getNoticeOptionUseCase;

  GetNoticeOptionViewModel({
    required GetNoticeOptionUseCase getNoticeOptionUseCase,
  })  : _getNoticeOptionUseCase = getNoticeOptionUseCase,
        super(NoticeModel(
          state: GetNoticeOptionState.initial,
          values: List.empty(),
        ));

  Future<void> execute() async {
    try {
      state = state.copyWith(state: GetNoticeOptionState.loading);
      final response = await _getNoticeOptionUseCase.execute();
      state = state.copyWith(state: GetNoticeOptionState.success, values: response);
    } catch (err) {
      state = state.copyWith(state: GetNoticeOptionState.failure);
      throw Exception(err.toString());
    }
  }
}
