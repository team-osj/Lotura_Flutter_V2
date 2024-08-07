import 'package:flutter/material.dart';
import 'package:lotura_v2/core/constants/lotura_color.dart';
import 'package:lotura_v2/core/constants/lotura_text_style.dart';

class MainViewOptionButton extends StatelessWidget {
  final String title;
  final bool isSwitched;

  const MainViewOptionButton({
    super.key,
    required this.title,
    required this.isSwitched,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 79,
      child: Text(
        title,
        textAlign: TextAlign.center,
        style: LoturaTextStyle.body2(
          color: isSwitched ? LoturaColor.main900 : LoturaColor.black,
        ),
      ),
    );
  }
}
