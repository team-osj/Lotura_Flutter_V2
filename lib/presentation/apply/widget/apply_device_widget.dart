import 'package:flutter/material.dart';
import 'package:lotura_v2/core/constants/lotura_asset.dart';
import 'package:lotura_v2/core/constants/lotura_color.dart';
import 'package:lotura_v2/core/constants/lotura_text_style.dart';
import 'package:lotura_v2/core/provider/state/device/device_state.dart';
import 'package:lotura_v2/core/provider/state/device/device_type.dart';
import 'package:lotura_v2/presentation/apply/widget/apply_device_state_widget.dart';

class ApplyDeviceWidget extends StatelessWidget {
  final int id;
  final DeviceType type;
  final DeviceState state;

  const ApplyDeviceWidget({
    super.key,
    required this.id,
    required this.type,
    required this.state,
  });

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            width: 1,
            color: LoturaColor.main50,
            strokeAlign: BorderSide.strokeAlignInside,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                "$imageApplyAsset/${type.name}_image.png",
                width: 120,
                height: 120,
              ),
              const SizedBox(height: 12),
              Text(
                "$id번 ${type.text}",
                style: LoturaTextStyle.subTitle2(
                  color: LoturaColor.black,
                ),
              ),
              const SizedBox(height: 12),
              ApplyDeviceStateWidget(
                state: state.text,
                color: state.iconColor,
                backgroundColor: state.color,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
