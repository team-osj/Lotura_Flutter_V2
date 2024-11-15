import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lotura_v2/data/data_source/theme/local/provider/local_theme_data_source_provider.dart';
import 'package:lotura_v2/data/repository/theme/theme_repository_impl.dart';
import 'package:lotura_v2/domain/repository/theme/theme_repository.dart';

final themeRepositoryProvider = Provider<ThemeRepository>(
  (ref) => ThemeRepositoryImpl(
    localThemeDataSource: ref.watch(localThemeDataSourceProvider),
  ),
);
