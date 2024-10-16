import 'package:flutter/material.dart';

class LoturaScrollWidget extends StatelessWidget {
  final Widget child;
  final ScrollPhysics? physics;

  const LoturaScrollWidget({
    super.key,
    required this.child,
    this.physics,
  });

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      thickness: 6,
      radius: const Radius.circular(12),
      child: SingleChildScrollView(
        physics: physics ?? const BouncingScrollPhysics(),
        child: child,
      ),
    );
  }
}
