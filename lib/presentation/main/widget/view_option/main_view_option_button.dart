import 'package:flutter/material.dart';
import 'package:lotura_v2/core/constants/lotura_color.dart';
import 'package:lotura_v2/core/constants/lotura_text_style.dart';

class MainViewOptionButton extends StatelessWidget {
  /// 텍스트
  final String text;
  /// Switch 되었는지 판단
  final bool isSwitched;

  const MainViewOptionButton({
    super.key,
    required this.text,
    required this.isSwitched,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      /// 옵션 별로 텍스트 길이가 각기 달라, 수치화 적용
      width: 79,
      child: Text(
        text,
        /// 텍스트 가운데 정렬
        textAlign: TextAlign.center,
        style: LoturaTextStyle.body2(
          color: isSwitched ? LoturaColor.main900 : LoturaColor.black,
        ),
      ),
    );
  }
}
