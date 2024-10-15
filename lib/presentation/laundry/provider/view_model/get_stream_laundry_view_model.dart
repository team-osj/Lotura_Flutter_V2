import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lotura_v2/domain/entity/laundry/laundry_entity.dart';
import 'package:lotura_v2/domain/use_case/laundry/get_all_laundry_list_use_case.dart';
import 'package:lotura_v2/domain/use_case/laundry/get_laundry_status_use_case.dart';
import 'package:lotura_v2/presentation/laundry/provider/model/laundry_state_model.dart';
import 'package:lotura_v2/presentation/laundry/provider/state/get_stream_laundry_state.dart';

class GetStreamLaundryViewModel
    extends StateNotifier<LaundryStateModel<GetStreamLaundryState>> {
  final GetLaundryStatusUseCase _getLaundryStatusUseCase;
  final GetAllLaundryListUseCase _getAllLaundryListUseCase;

  GetStreamLaundryViewModel({
    required GetLaundryStatusUseCase getLaundryStatusUseCase,
    required GetAllLaundryListUseCase getAllLaundryListUseCase,
  })  : _getLaundryStatusUseCase = getLaundryStatusUseCase,
        _getAllLaundryListUseCase = getAllLaundryListUseCase,
        super(
          LaundryStateModel<GetStreamLaundryState>(
            state: GetStreamLaundryState.initial,
            values: List.empty(),
          ),
        );

  Future<void> getLaundryEvent() async {
    try {
      state = state.copyWith(state: GetStreamLaundryState.loading);

      _getLaundryStatusUseCase.execute();

      await for (var data in _getLaundryStatusUseCase.laundryList) {
        final values = state.values
            .map((e) => e.id == data.id
                ? LaundryEntity(
                    id: e.id,
                    state: data.state,
                    type: data.type,
                  )
                : e)
            .toList();

        state = state.copyWith(values: values);
      }
      state = state.copyWith(state: GetStreamLaundryState.success);
    } catch (err) {
      state = state.copyWith(state: GetStreamLaundryState.failure);
      throw Exception(err.toString());
    }
  }

  Future<void> getAllLaundryList() async {
    try {
      state = state.copyWith(state: GetStreamLaundryState.loading);

      final response = await _getAllLaundryListUseCase.execute();

      state = state.copyWith(values: response, state: GetStreamLaundryState.success);
    } catch (err) {
      state = state.copyWith(state: GetStreamLaundryState.failure);
      throw Exception(err.toString());
    }
  }
}
