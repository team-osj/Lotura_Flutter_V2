import 'package:flutter/material.dart';
import 'package:lotura_v2/core/component/lotura_network_error_widget.dart';
import 'package:lotura_v2/core/layout/lotura_layout.dart';

class LoturaNetworkErrorLayout extends StatelessWidget {
  final PreferredSizeWidget? appBar;

  const LoturaNetworkErrorLayout({
    super.key,
    this.appBar,
  });

  @override
  Widget build(BuildContext context) {
    return LoturaLayout(
      appBar: appBar,
      child: const LoturaNetworkErrorWidget(),
    );
  }
}
