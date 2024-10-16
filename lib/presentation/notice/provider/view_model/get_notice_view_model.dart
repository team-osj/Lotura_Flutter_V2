import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lotura_v2/domain/entity/notice/notice_entity.dart';
import 'package:lotura_v2/domain/use_case/notice/get_notice_use_case.dart';
import 'package:lotura_v2/presentation/notice/provider/model/notice_model.dart';
import 'package:lotura_v2/presentation/notice/provider/state/get_notice_state.dart';

class GetNoticeViewModel
    extends StateNotifier<NoticeModel<GetNoticeState, List<NoticeEntity>>> {
  final GetNoticeUseCase _getNoticeUseCase;

  GetNoticeViewModel({
    required GetNoticeUseCase getNoticeUseCase,
  })  : _getNoticeUseCase = getNoticeUseCase,
        super(
          NoticeModel<GetNoticeState, List<NoticeEntity>>(
            state: GetNoticeState.initial,
            values: List.empty(),
          ),
        );

  Future<void> execute() async {
    try {
      state = state.copyWith(state: GetNoticeState.loading);

      final response = await _getNoticeUseCase.execute();

      state = state.copyWith(state: GetNoticeState.success, values: response);
    } catch (err) {
      state = state.copyWith(state: GetNoticeState.failure);
      throw Exception(err.toString());
    }
  }
}
