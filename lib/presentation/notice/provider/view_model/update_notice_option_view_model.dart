import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lotura_v2/domain/use_case/notice/update_notice_option_use_case.dart';
import 'package:lotura_v2/presentation/notice/provider/state/update_notice_option_state.dart';

class UpdateNoticeOptionViewModel
    extends StateNotifier<UpdateNoticeOptionState> {
  final UpdateNoticeOptionUseCase _updateNoticeOptionUseCase;

  UpdateNoticeOptionViewModel({
    required UpdateNoticeOptionUseCase updateNoticeOptionUseCase,
  })  : _updateNoticeOptionUseCase = updateNoticeOptionUseCase,
        super(UpdateNoticeOptionState.initial);

  Future<void> execute({required int id}) async {
    try {
      state = UpdateNoticeOptionState.loading;
      await _updateNoticeOptionUseCase.execute(id: id);
      state = UpdateNoticeOptionState.success;
    } catch (err) {
      state = UpdateNoticeOptionState.failure;
      throw Exception(err.toString());
    }
  }
}
