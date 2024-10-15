import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lotura_v2/domain/use_case/laundry/provider/get_all_laundry_list_use_case_provider.dart';
import 'package:lotura_v2/domain/use_case/laundry/provider/get_laundry_status_use_case_provider.dart';
import 'package:lotura_v2/presentation/laundry/provider/model/laundry_state_model.dart';
import 'package:lotura_v2/presentation/laundry/provider/state/get_stream_laundry_state.dart';
import 'package:lotura_v2/presentation/laundry/provider/view_model/get_stream_laundry_view_model.dart';

final getStreamLaundryViewModelProvider = StateNotifierProvider<GetStreamLaundryViewModel, LaundryStateModel<GetStreamLaundryState>>(
  (ref) => GetStreamLaundryViewModel(
    getLaundryStatusUseCase: ref.watch(getLaundryStatusUseCaseProvider),
    getAllLaundryListUseCase: ref.watch(getAllLaundryListUseCaseProvider),
  ),
);
