import 'package:lotura_v2/core/provider/state/device/device_array_type.dart';

class LaundryRoomOptionEntity<T> {
  final T state;
  final String? option;
  final List<Map<DeviceArrayType, List<int>>>? locate;

  LaundryRoomOptionEntity({
    required this.state,
    required this.option,
    required this.locate,
  });

  LaundryRoomOptionEntity<T> copyWith({
    T? state,
    String? option,
    List<Map<DeviceArrayType, List<int>>>? locate
  }) {
    return LaundryRoomOptionEntity<T>(
      state: state ?? this.state,
      option: option ?? this.option,
      locate: locate ?? this.locate,
    );
  }
}
