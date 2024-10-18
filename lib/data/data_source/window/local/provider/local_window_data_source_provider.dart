import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lotura_v2/data/data_source/window/local/local_window_data_source.dart';

final localWindowDataSourceProvider = Provider<LocalWindowDataSource>(
  (ref) => LocalWindowDataSource(),
);
