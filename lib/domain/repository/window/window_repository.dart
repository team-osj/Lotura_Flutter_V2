import 'package:lotura_v2/core/hive/window_option.dart';

abstract class WindowRepository {
  Future<void> updateWindowOption({required WindowOption option});

  Future<WindowOption?> getWindowOption();
}
