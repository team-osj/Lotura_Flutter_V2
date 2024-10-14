import 'package:flutter/material.dart';
import 'package:lotura_v2/core/constants/lotura_asset.dart';
import 'package:lotura_v2/core/constants/lotura_color.dart';
import 'package:lotura_v2/core/constants/lotura_text_style.dart';
import 'package:lotura_v2/core/provider/state/device/device_state.dart';
import 'package:lotura_v2/core/provider/state/device/device_type.dart';
import 'package:lotura_v2/presentation/apply/widget/apply_device_state_widget.dart';

class ApplyDeviceWidget extends StatelessWidget {
  final int number;
  final DeviceType type;
  final DeviceState state;

  const ApplyDeviceWidget({
    super.key,
    required this.number,
    required this.type,
    required this.state,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
              "$imageCoreAsset/${type == DeviceType.dryer ? "dryer" : "washer"}_image.png",
              width: 120,
              height: 120,
            ),
            const SizedBox(height: 12),
            Text(
              "$number번 ${type == DeviceType.dryer ? "건조기" : "세탁기"}",
              style: LoturaTextStyle.subTitle2(
                color: LoturaColor.black,
              ),
            ),
            const SizedBox(height: 12),
            switch (state) {
              DeviceState.available => ApplyDeviceStateWidget(
                  state: "사용 가능",
                  color: LoturaColor.green20,
                  backgroundColor: LoturaColor.green10,
                ),
              DeviceState.working => ApplyDeviceStateWidget(
                  state: "작동중",
                  color: LoturaColor.main900,
                  backgroundColor: LoturaColor.main50,
                ),
              DeviceState.disconnect => ApplyDeviceStateWidget(
                  state: "연결 끊김",
                  color: LoturaColor.gray600,
                  backgroundColor: LoturaColor.gray100,
                ),
              DeviceState.breakdown => ApplyDeviceStateWidget(
                  state: "고장",
                  color: LoturaColor.red20,
                  backgroundColor: LoturaColor.red10,
                ),
            },
          ],
        ),
      ),
    );
  }
}
