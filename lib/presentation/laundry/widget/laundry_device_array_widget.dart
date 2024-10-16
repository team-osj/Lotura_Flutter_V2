import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lotura_v2/core/constants/lotura_style.dart';
import 'package:lotura_v2/core/provider/state/device/device_array_type.dart';
import 'package:lotura_v2/core/provider/state/device/device_state.dart';
import 'package:lotura_v2/core/provider/state/device/device_type.dart';
import 'package:lotura_v2/domain/entity/laundry/laundry_entity.dart';
import 'package:lotura_v2/presentation/laundry/provider/get_stream_laundry_view_model_provider.dart';
import 'package:lotura_v2/presentation/laundry/widget/laundry_device_state_widget.dart';
import 'package:lotura_v2/presentation/laundry/widget/laundry_dryer_array_widget.dart';
import 'package:lotura_v2/presentation/laundry/widget/laundry_empty_widget.dart';

class LaundryDeviceArrayWidget extends ConsumerWidget {
  final DeviceArrayType type;
  final List<int> item;

  const LaundryDeviceArrayWidget({
    super.key,
    required this.type,
    required this.item,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final int length = item.length;
    final laundryList = ref.watch(getStreamLaundryViewModelProvider);
    List<Widget> children;

    DeviceState formatLaundryState({
      required int count,
    }) {
      return laundryList.values
          .firstWhere((entity) => entity.id == item.elementAt(count))
          .state;
    }

    if (length == 4) {
      children = [
        LaundryDryerArrayWidget(
          left: LaundryEntity(
            id: item.elementAt(0),
            state: formatLaundryState(count: 0),
            type: DeviceType.dryer,
          ),
          right: LaundryEntity(
            id: item.elementAt(1),
            state: formatLaundryState(count: 1),
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
            state: formatLaundryState(count: 2),
            type: DeviceType.dryer,
          ),
          right: LaundryEntity(
            id: item.elementAt(3),
            state: formatLaundryState(count: 3),
            type: DeviceType.dryer,
          ),
        ),
      ];
    } else if (length == 3) {
      children = [
        LaundryDeviceStateWidget(
          id: item.elementAt(0),
          state: formatLaundryState(count: 0),
          type: DeviceType.washer,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 33),
          child: SvgPicture.asset("$iconLaundryAsset/movement_sign_icon.svg"),
        ),
        LaundryDryerArrayWidget(
          left: LaundryEntity(
            id: item.elementAt(1),
            state: formatLaundryState(count: 1),
            type: DeviceType.dryer,
          ),
          right: LaundryEntity(
            id: item.elementAt(2),
            state: formatLaundryState(count: 2),
            type: DeviceType.dryer,
          ),
        ),
      ];
    } else if (type == DeviceArrayType.onlyWasher) {
      children = [
        LaundryDeviceStateWidget(
          id: item.elementAt(0),
          state: formatLaundryState(count: 0),
          type: DeviceType.washer,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 33),
          child: SvgPicture.asset("$iconLaundryAsset/movement_sign_icon.svg"),
        ),
        LaundryDeviceStateWidget(
          id: item.elementAt(1),
          state: formatLaundryState(count: 1),
          type: DeviceType.washer,
        ),
      ];
    } else {
      children = [
        LaundryDryerArrayWidget(
          left: LaundryEntity(
            id: item.elementAt(0),
            state: formatLaundryState(count: 0),
            type: DeviceType.dryer,
          ),
          right: LaundryEntity(
            id: item.elementAt(1),
            state: formatLaundryState(count: 1),
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
