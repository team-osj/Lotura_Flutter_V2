import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lotura_v2/data/data_source/theme/local/local_theme_data_source.dart';

final localThemeDataSourceProvider =
    Provider<LocalThemeDataSource>((ref) => LocalThemeDataSource());
