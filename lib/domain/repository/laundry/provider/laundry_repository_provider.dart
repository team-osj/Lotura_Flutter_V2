import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lotura_v2/data/data_source/laundry/local/provider/local_laundry_data_source_provider.dart';
import 'package:lotura_v2/data/data_source/laundry/remote/provider/remote_laundry_data_source_provider.dart';
import 'package:lotura_v2/data/repository/laundry/laundry_repository_impl.dart';
import 'package:lotura_v2/domain/repository/laundry/laundry_repository.dart';

final laundryRepositoryProvider = Provider<LaundryRepository>(
  (ref) => LaundryRepositoryImpl(
    localLaundryDataSource: ref.watch(localLaundryDataSourceProvider),
    remoteLaundryDataSource: ref.watch(remoteLaundryDataSourceProvider),
  ),
);
