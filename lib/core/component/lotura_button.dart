import 'package:flutter/material.dart';
import 'package:lotura_v2/core/constants/lotura_style.dart';

class LoturaButton extends StatelessWidget {
  final String text;

  final double? height, width;
  final Color? textColor, backgroundColor;

  const LoturaButton({
    super.key,
    required this.text,
    this.height,
    this.width,
    this.textColor,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? MediaQuery.of(context).size.width,
      height: height ?? 56,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: backgroundColor ?? LoturaLightColor.main500,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        text,
        style: LoturaTextStyle.button1(
          color: textColor ?? LoturaLightColor.white,
        ),
      ),
    );
  }
}
