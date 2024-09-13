import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lotura_v2/core/constants/lotura_style.dart';

class SettingAlarmSwitch extends StatelessWidget {
  final String option;
  final bool value;

  const SettingAlarmSwitch({
    super.key,
    required this.option,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            option,
            style: LoturaTextStyle.button1(
              color: LoturaColor.black,
            ),
          ),
          CupertinoSwitch(
            value: value,
            activeColor: LoturaColor.main500,
            trackColor: LoturaColor.gray100,
            thumbColor: LoturaColor.white,
            onChanged: (value) {},
          ),
        ],
      ),
    );
  }
}
