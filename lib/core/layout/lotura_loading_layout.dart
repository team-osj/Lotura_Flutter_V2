import 'package:flutter/cupertino.dart';
import 'package:lotura_v2/core/layout/lotura_layout.dart';

class LoturaLoadingLayout extends StatelessWidget {
  final PreferredSizeWidget? appBar;

  const LoturaLoadingLayout({
    super.key,
    this.appBar,
  });

  @override
  Widget build(BuildContext context) {
    return LoturaLayout(
      appBar: appBar,
      child: const Center(
        child: CupertinoActivityIndicator(),
      ),
    );
  }
}
