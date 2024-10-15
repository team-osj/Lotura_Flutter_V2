import 'package:lotura_v2/core/provider/state/device/device_state.dart';
import 'package:lotura_v2/core/provider/state/device/device_type.dart';
import 'package:lotura_v2/domain/entity/laundry/laundry_entity.dart';

class LaundryResponse {
  final int id;
  final int state;
  final String type;

  const LaundryResponse({
    required this.id,
    required this.state,
    required this.type,
  });

  factory LaundryResponse.fromJson(Map<String, dynamic> json) {
    return LaundryResponse(
      id: json['id'],
      state: json['state'],
      type: json['device_type'],
    );
  }

  LaundryEntity toEntity() {
    return LaundryEntity(
      id: id,
      state: DeviceState.values.elementAt(state),
      type: type == "WASH" ? DeviceType.washer : DeviceType.dryer,
    );
  }
}
