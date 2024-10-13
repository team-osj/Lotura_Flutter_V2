import 'package:flutter/material.dart';
import 'package:lotura_v2/core/provider/state/device/device_type.dart';
import 'package:lotura_v2/domain/entity/laundry/laundry_entity.dart';
import 'package:lotura_v2/presentation/laundry/widget/laundry_device_state_widget.dart';

class LaundryDryerArrayWidget extends StatelessWidget {
  final LaundryEntity left, right;

  const LaundryDryerArrayWidget({
    super.key,
    required this.left,
    required this.right,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        LaundryDeviceStateWidget(
          type: DeviceType.dryer,
          state: left.state,
          id: left.id,
        ),
        const SizedBox(width: 8),
        LaundryDeviceStateWidget(
          type: DeviceType.dryer,
          state: right.state,
          id: right.id,
        ),
      ],
    );
  }
}
