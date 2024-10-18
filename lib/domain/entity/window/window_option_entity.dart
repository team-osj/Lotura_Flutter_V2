import 'package:lotura_v2/core/hive/window_option.dart';

class WindowOptionEntity<T> {
  final T state;
  final String? option;

  WindowOptionEntity({
    required this.state,
    required this.option,
  });

  WindowOptionEntity<T> copyWith({
    T? state,
    String? option,
  }) {
    return WindowOptionEntity(
      state: state ?? this.state,
      option: option ?? this.option,
    );
  }
}
