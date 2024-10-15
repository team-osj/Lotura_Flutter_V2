import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lotura_v2/domain/repository/laundry/provider/laundry_repository_provider.dart';
import 'package:lotura_v2/domain/use_case/laundry/get_all_laundry_list_use_case.dart';

final getAllLaundryListUseCaseProvider = Provider<GetAllLaundryListUseCase>(
  (ref) => GetAllLaundryListUseCase(
    laundryRepository: ref.watch(laundryRepositoryProvider),
  ),
);
