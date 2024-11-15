import 'package:flutter/material.dart';
import 'package:lotura_v2/core/component/lotura_gesture.dart';
import 'package:lotura_v2/core/constants/lotura_style.dart';

class SettingOptionWidget extends StatelessWidget {
  final Widget bottomSheet;
  final String title;
  final Widget option;

  const SettingOptionWidget({
    super.key,
    required this.bottomSheet,
    required this.title,
    required this.option,
  });

  @override
  Widget build(BuildContext context) {
    return LoturaGesture(
      event: () => showModalBottomSheet(
        context: context,
        backgroundColor: Theme.of(context).colorScheme.onSurface,
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
                color: Theme.of(context).colorScheme.inverseSurface,
              ),
            ),
            option,
          ],
        ),
      ),
    );
  }
}
