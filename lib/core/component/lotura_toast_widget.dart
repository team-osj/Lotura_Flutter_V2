import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lotura_v2/core/constants/lotura_style.dart';

enum LoturaToastState {
  success,
  failure
}

class LoturaToastWidget extends StatefulWidget {
  final String text;


  const LoturaToastWidget({
    super.key,
    required this.text,
  });

  @override
  State<LoturaToastWidget> createState() => _LoturaToastWidgetState();
}

class _LoturaToastWidgetState extends State<LoturaToastWidget> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 58),
          child: Material(
            color: LoturaColor.transparent,
            child: Container(
              decoration: BoxDecoration(
                color: LoturaColor.gray50,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SvgPicture.asset(
                      "$iconCoreAsset/circle_success_icon.svg",
                    ),
                    const SizedBox(width: 8),
                    Text(
                      widget.text,
                      style: LoturaTextStyle.body1(
                        color: LoturaColor.black,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
