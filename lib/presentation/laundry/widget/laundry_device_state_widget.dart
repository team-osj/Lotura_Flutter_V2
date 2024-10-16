import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lotura_v2/core/component/laundry_bottom_sheet.dart';
import 'package:lotura_v2/core/constants/lotura_style.dart';
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
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        showModalBottomSheet(
          context: context,
          backgroundColor: LoturaColor.white,
          builder: (context) {
            return SafeArea(
              child: LaundryBottomSheet(
                state: state,
                type: type,
                actionFunc: () {},
                id: id,
              ),
            );
          },
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: state.color,
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
                  state.iconColor,
                  BlendMode.srcIn,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                "$id번",
                style: LoturaTextStyle.subTitle3(
                  color: LoturaColor.black,
                ),
              ),
              Text(
                type.text,
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
