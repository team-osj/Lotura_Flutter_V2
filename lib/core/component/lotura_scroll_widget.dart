import 'package:flutter/material.dart';
import 'package:lotura_v2/core/constants/lotura_style.dart';

class LoturaScrollWidget extends StatelessWidget {
  final ScrollController controller;
  final Widget child;
  final ScrollPhysics? physics;

  const LoturaScrollWidget({
    super.key,
    required this.controller,
    required this.child,
    this.physics,
  });

  @override
  Widget build(BuildContext context) {
    return RawScrollbar(
      controller: controller,
      thickness: 6,
      thumbColor: LoturaColor.gray200,
      crossAxisMargin: 6,
      radius: const Radius.circular(12),
      child: SingleChildScrollView(
        controller: controller,
        physics: physics ?? const BouncingScrollPhysics(),
        child: child,
      ),
    );
  }
}
