import 'package:flutter/material.dart';
import 'package:lotura_v2/core/provider/state/device/device_state.dart';
import 'package:lotura_v2/core/provider/state/device/device_type.dart';
import 'package:lotura_v2/presentation/laundry/widget/laundry_device_state_widget.dart';

class LaundryDryerArrayWidget extends StatelessWidget {
  const LaundryDryerArrayWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        LaundryDeviceStateWidget(type: DeviceType.dryer, state: DeviceState.working),
        SizedBox(width: 8),
        LaundryDeviceStateWidget(type: DeviceType.dryer, state: DeviceState.working),
      ],
    );
  }
}
