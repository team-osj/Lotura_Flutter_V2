import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lotura_v2/core/component/lotura_gesture.dart';
import 'package:lotura_v2/core/constants/lotura_style.dart';

class SettingOptionWidget extends StatelessWidget {
  final Widget bottomSheet;
  final String title;
  final String? option;

  const SettingOptionWidget({
    super.key,
    required this.bottomSheet,
    required this.title,
    this.option,
  });

  @override
  Widget build(BuildContext context) {
    return LoturaGesture(
      event: () => showModalBottomSheet(
        context: context,
        backgroundColor: LoturaColor.white,
        builder: (context) {
          return SafeArea(
            child: bottomSheet,
          );
        },
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: LoturaTextStyle.subTitle2(
                color: LoturaColor.black,
              ),
            ),
            Row(
              children: [
                Text(
                  option ?? "",
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
      ),
    );
  }
}
