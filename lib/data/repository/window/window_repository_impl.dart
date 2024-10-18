import 'package:lotura_v2/core/hive/window_option.dart';
import 'package:lotura_v2/data/data_source/window/local/local_window_data_source.dart';
import 'package:lotura_v2/domain/repository/window/window_repository.dart';

class WindowRepositoryImpl implements WindowRepository {
  final LocalWindowDataSource _localWindowDataSource;

  WindowRepositoryImpl({
    required LocalWindowDataSource localWindowDataSource,
  }) : _localWindowDataSource = localWindowDataSource;

  @override
  Future<void> updateWindowOption({required WindowOption option}) async =>
      _localWindowDataSource.updateWindowOption(option: option);

  @override
  Future<WindowOption?> getWindowOption() async =>
      _localWindowDataSource.getWindowOption();
}
