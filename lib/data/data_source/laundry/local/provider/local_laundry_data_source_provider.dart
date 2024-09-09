import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lotura_v2/data/data_source/laundry/local/local_laundry_data_source.dart';

final localLaundryDataSourceProvider =
    Provider<LocalLaundryDataSource>((ref) => LocalLaundryDataSource());
