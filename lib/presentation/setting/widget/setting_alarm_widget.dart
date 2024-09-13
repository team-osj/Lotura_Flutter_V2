import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lotura_v2/core/constants/lotura_style.dart';

/// 알림 설정 버튼 위젯
class SettingAlarmWidget extends StatelessWidget {
  const SettingAlarmWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "알림 설정",
            style: LoturaTextStyle.subTitle2(
              color: LoturaColor.black,
            ),
          ),
          SvgPicture.asset(
            "$iconSettingAsset/right_arrow_icon.svg",
          ),
        ],
      ),
    );
  }
}
