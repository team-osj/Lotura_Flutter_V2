import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lotura_v2/core/constants/lotura_style.dart';

class SettingMainLaundryWidget extends StatelessWidget {
  const SettingMainLaundryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "메인 세탁실 설정",
            style: LoturaTextStyle.subTitle2(
              color: LoturaColor.black,
            ),
          ),
          Row(
            children: [
              Text(
                "남자 기숙사측",
                style: LoturaTextStyle.subTitle2(
                  color: LoturaColor.main500,
                ),
              ),
              const SizedBox(width: 8),
              SvgPicture.asset(
                "$iconSettingAsset/right_arrow_icon.svg",
              ),
            ],
          ),
        ],
      ),
    );
  }
}
