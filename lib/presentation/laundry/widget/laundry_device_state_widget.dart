import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lotura_v2/core/component/laundry_bottom_sheet.dart';
import 'package:lotura_v2/core/component/lotura_gesture.dart';
import 'package:lotura_v2/core/di/lotura_style.dart';
import 'package:lotura_v2/core/provider/state/device/device_state.dart';
import 'package:lotura_v2/core/provider/state/device/device_type.dart';

class LaundryDeviceStateWidget extends StatelessWidget {
  final int id;
  final DeviceType type;
  final DeviceState state;

  const LaundryDeviceStateWidget({
    super.key,
    required this.id,
    required this.type,
    required this.state,
  });

  @override
  Widget build(BuildContext context) {
    return LoturaGesture(
      event: () {
        showModalBottomSheet(
          context: context,
          backgroundColor: Theme.of(context).colorScheme.onSurface,
          builder: (context) {
            return LaundryBottomSheet(
              state: state,
              type: type,
              actionFunc: () {},
              id: id,
            );
          },
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: state.themeColorHandler(context),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: type.padding,
            vertical: 8,
          ),
          child: Column(
            children: [
              SvgPicture.asset(
                "$iconLaundryAsset/${type.name}_icon.svg",
                colorFilter: ColorFilter.mode(
                  state.themeIconColorHandler(context),
                  BlendMode.srcIn,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                "$id번",
                style: LoturaTextStyle.subTitle3(
                  color: Theme.of(context).colorScheme.inverseSurface,
                ),
              ),
              Text(
                type.text,
                style: LoturaTextStyle.body1(
                  color: Theme.of(context).colorScheme.inverseSurface,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
