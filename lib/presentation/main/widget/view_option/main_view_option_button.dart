import 'package:flutter/material.dart';
import 'package:lotura_v2/core/constants/lotura_color.dart';
import 'package:lotura_v2/core/constants/lotura_text_style.dart';

class MainViewOptionButton extends StatelessWidget {
  /// 텍스트
  final String text;
  /// Switch 되었는지 판단
  final bool isSwitched;
  /// button 길이
  final double width, height;

  const MainViewOptionButton({
    super.key,
    required this.text,
    required this.isSwitched,
    required this.height,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      /// 옵션 별로 텍스트 길이가 각기 달라, 수치화 적용
      width: width,
      height: height,
      /// 투명한 색상 지정
      color: LoturaLightColor.transparent,
      /// 가운데 정렬
      alignment: Alignment.center,
      child: Text(
        text,
        /// 텍스트 가운데 정렬
        style: LoturaTextStyle.body2(
          color: isSwitched ? LoturaLightColor.main900 : LoturaLightColor.black,
        ),
      ),
    );
  }
}
