import 'package:hive/hive.dart';
import 'package:lotura_v2/core/hive/window_option.dart';

class LocalWindowDataSource {
  late final Box<WindowOption> _windowBox;

  Future<void> init() async {
    if (!Hive.isBoxOpen("windowOption")) {
      _windowBox = await Hive.openBox<WindowOption>("windowOption");
    }
  }

  Future<void> updateWindowOption({
    required WindowOption option,
  }) async {
    await init();
    return _windowBox.put("windowOption", option);
  }

  Future<WindowOption?> getWindowOption() async {
    await init();
    return _windowBox.get("windowOption");
  }
}
