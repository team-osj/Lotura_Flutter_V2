import 'package:lotura_v2/core/provider/state/device/device_state.dart';
import 'package:lotura_v2/core/provider/state/device/device_type.dart';

class LaundryEntity {
  final int id;
  final DeviceState state;
  final DeviceType type;

  LaundryEntity({
    required this.id,
    required this.state,
    required this.type,
  });
}
