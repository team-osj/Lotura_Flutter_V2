import 'package:flutter/material.dart';
import 'package:lotura_v2/core/component/lotura_text_style.dart';

class ApplyDeviceStateWidget extends StatelessWidget {
  final String state;
  final Color color, backgroundColor;

  const ApplyDeviceStateWidget({
    super.key,
    required this.state,
    required this.color,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      /// 위젯 텍스트마다 길이가 각기 다르기 때문에 직접 수치화
      width: 100,
      height: 29,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(100),
      ),
      child: Text(
        state,
        style: LoturaTextStyle.body1(
          color: color,
        ),
      ),
    );
  }
}
