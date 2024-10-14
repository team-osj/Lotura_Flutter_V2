import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lotura_v2/core/constants/lotura_style.dart';
import 'package:lotura_v2/core/provider/state/device/device_array_type.dart';
import 'package:lotura_v2/core/provider/state/device/device_state.dart';
import 'package:lotura_v2/core/provider/state/device/device_type.dart';
import 'package:lotura_v2/domain/entity/laundry/laundry_entity.dart';
import 'package:lotura_v2/presentation/laundry/widget/laundry_device_state_widget.dart';
import 'package:lotura_v2/presentation/laundry/widget/laundry_dryer_array_widget.dart';
import 'package:lotura_v2/presentation/laundry/widget/laundry_empty_widget.dart';

class LaundryDeviceArrayWidget extends StatelessWidget {
  final DeviceArrayType type;
  final List<Map<DeviceArrayType, List<int>>> locate;
  final List<int> item;

  const LaundryDeviceArrayWidget({
    super.key,
    required this.type,
    required this.locate,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    final int length = item.length;
    List<Widget> children;

    if (length == 4) {
      children = [
        LaundryDryerArrayWidget(
          left: LaundryEntity(
            id: item.elementAt(0),
            state: DeviceState.available,
            type: DeviceType.dryer,
          ),
          right: LaundryEntity(
            id: item.elementAt(1),
            state: DeviceState.available,
            type: DeviceType.dryer,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 33),
          child: SvgPicture.asset("$iconLaundryAsset/movement_sign_icon.svg"),
        ),
        LaundryDryerArrayWidget(
          left: LaundryEntity(
            id: item.elementAt(2),
            state: DeviceState.available,
            type: DeviceType.dryer,
          ),
          right: LaundryEntity(
            id: item.elementAt(3),
            state: DeviceState.available,
            type: DeviceType.dryer,
          ),
        ),
      ];
    } else if (length == 3) {
      children = [
        LaundryDeviceStateWidget(
          id: item.elementAt(0),
          type: DeviceType.washer,
          state: DeviceState.available,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 33),
          child: SvgPicture.asset("$iconLaundryAsset/movement_sign_icon.svg"),
        ),
        LaundryDryerArrayWidget(
          left: LaundryEntity(
            id: item.elementAt(1),
            state: DeviceState.available,
            type: DeviceType.dryer,
          ),
          right: LaundryEntity(
            id: item.elementAt(2),
            state: DeviceState.available,
            type: DeviceType.dryer,
          ),
        ),
      ];
    } else if (type == DeviceArrayType.onlyWasher) {
      children = [
        LaundryDeviceStateWidget(
          id: item.elementAt(0),
          type: DeviceType.washer,
          state: DeviceState.available,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 33),
          child: SvgPicture.asset("$iconLaundryAsset/movement_sign_icon.svg"),
        ),
        LaundryDeviceStateWidget(
          id: item.elementAt(1),
          type: DeviceType.washer,
          state: DeviceState.available,
        ),
      ];
    } else {
      children = [
        LaundryDryerArrayWidget(
          left: LaundryEntity(
            id: item.elementAt(0),
            state: DeviceState.available,
            type: DeviceType.dryer,
          ),
          right: LaundryEntity(
            id: item.elementAt(1),
            state: DeviceState.available,
            type: DeviceType.dryer,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 33),
          child: SvgPicture.asset("$iconLaundryAsset/movement_sign_icon.svg"),
        ),
        const LaundryEmptyWidget(),
      ];
    }

    return FittedBox(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: children,
      ),
    );
  }

}
