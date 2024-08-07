import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lotura_v2/core/constants/lotura_asset.dart';
import 'package:lotura_v2/core/constants/lotura_color.dart';
import 'package:lotura_v2/presentation/main/widget/view_option/main_view_option_switch.dart';

class MainAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MainAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: PreferredSize(
        preferredSize: preferredSize,
        child: AppBar(
          automaticallyImplyLeading: false,
          scrolledUnderElevation: 0,
          backgroundColor: LoturaColor.white,
          titleSpacing: 0,
          title: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const MainViewOptionSwitch(),
                Row(
                  children: [
                    SvgPicture.asset("$coreAsset/bell_icon.svg"),
                    const SizedBox(width: 12),
                    SvgPicture.asset("$coreAsset/setting_icon.svg"),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(54);
}
