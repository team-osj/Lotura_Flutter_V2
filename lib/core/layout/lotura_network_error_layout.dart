import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lotura_v2/core/constants/lotura_style.dart';
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
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              children: [
                SvgPicture.asset(
                  "$iconCoreAsset/network_error_icon.svg",
                  colorFilter: ColorFilter.mode(
                    Theme.of(context).colorScheme.surfaceContainerLow,
                    BlendMode.srcIn,
                  ),
                ),
                const SizedBox(height: 24),
                Text(
                  "네트워크 연결이 끊겼습니다.",
                  style: LoturaTextStyle.heading4(
                    color: Theme.of(context).colorScheme.surfaceContainerLow,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
