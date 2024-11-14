import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lotura_v2/core/constants/lotura_asset.dart';

class LaundryMovementWidget extends StatelessWidget {
  const LaundryMovementWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 33),
      child: SvgPicture.asset(
        "$iconLaundryAsset/movement_sign_icon.svg",
        colorFilter: ColorFilter.mode(
          Theme.of(context).colorScheme.surfaceContainerLowest,
          BlendMode.srcIn,
        ),
      ),
    );
  }
}
