import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lotura_v2/data/data_source/window/local/provider/local_window_data_source_provider.dart';
import 'package:lotura_v2/data/repository/window/window_repository_impl.dart';
import 'package:lotura_v2/domain/repository/window/window_repository.dart';

final windowRepositoryProvider = Provider<WindowRepository>(
  (ref) => WindowRepositoryImpl(
    localWindowDataSource: ref.watch(localWindowDataSourceProvider),
  ),
);
