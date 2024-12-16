import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lotura_v2/core/di/lotura_style.dart';

class LoturaNetworkErrorWidget extends StatelessWidget {
  const LoturaNetworkErrorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
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
    );
  }
}
