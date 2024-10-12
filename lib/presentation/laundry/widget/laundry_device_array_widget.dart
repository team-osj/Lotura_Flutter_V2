import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lotura_v2/core/constants/lotura_style.dart';
import 'package:lotura_v2/core/provider/state/device/device_state.dart';
import 'package:lotura_v2/core/provider/state/device/device_type.dart';
import 'package:lotura_v2/presentation/laundry/widget/laundry_device_state_widget.dart';
import 'package:lotura_v2/presentation/laundry/widget/laundry_dryer_array_widget.dart';

class LaundryDeviceArrayWidget extends StatelessWidget {
  final DeviceType type;

  const LaundryDeviceArrayWidget({
    super.key,
    required this.type,
  });

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: Row(
        children: type == DeviceType.dryer ? [
          const LaundryDryerArrayWidget(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 33),
            child: SvgPicture.asset("$iconLaundryAsset/movement_sign_icon.svg"),
          ),
          const LaundryDryerArrayWidget(),
        ] : [
          LaundryDeviceStateWidget(type: type, state: DeviceState.breakdown),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 33),
            child: SvgPicture.asset("$iconLaundryAsset/movement_sign_icon.svg"),
          ),
          LaundryDeviceStateWidget(type: type, state: DeviceState.disconnect),
        ],
      ),
    );
  }
}
