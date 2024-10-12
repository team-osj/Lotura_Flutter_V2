import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lotura_v2/core/component/lotura_bottom_sheet.dart';
import 'package:lotura_v2/core/constants/lotura_style.dart';
import 'package:lotura_v2/core/provider/state/device/device_state.dart';
import 'package:lotura_v2/core/provider/state/device/device_type.dart';

class LaundryDeviceStateWidget extends StatelessWidget {
  final DeviceType type;
  final DeviceState state;

  const LaundryDeviceStateWidget({
    super.key,
    required this.type,
    required this.state,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        showModalBottomSheet(
          context: context,
          backgroundColor: LoturaColor.white,
          builder: (context) {
            return SafeArea(
              child: LoturaBottomSheet(
                state: state,
                type: type,
                actionFunc: () {},
                count: 1,
              ),
            );
          },
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: deviceColor[state]!.elementAt(0),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: type == DeviceType.dryer ? 16.5 : 55.5,
            vertical: 8,
          ),
          child: Column(
            children: [
              SvgPicture.asset(
                "$iconLaundryAsset/${type.name}_icon.svg",
                colorFilter: ColorFilter.mode(
                  deviceColor[state]!.elementAt(1),
                  BlendMode.srcIn,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                "33번",
                style: LoturaTextStyle.subTitle3(
                  color: LoturaColor.black,
                ),
              ),
              Text(
                "세탁기",
                style: LoturaTextStyle.body1(
                  color: LoturaColor.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
