import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
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
          /// 자동적으로 leading 버튼이 생성되지 않도록 설정
          automaticallyImplyLeading: false,

          /// 스크롤할 때 AppBar 밑에 Elevation이 생기지 않도록 설정
          scrolledUnderElevation: 0,

          /// title property 사용 시, 양 옆 padding 제거
          titleSpacing: 0,
          backgroundColor: LoturaColor.white,
          title: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const MainViewOptionSwitch(),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () => context.push("/notice"),
                      child: SvgPicture.asset("$iconCoreAsset/bell_icon.svg"),
                    ),
                    const SizedBox(width: 12),
                    GestureDetector(
                      onTap: () => context.push("/setting"),
                      child: SvgPicture.asset("$iconCoreAsset/setting_icon.svg"),
                    ),
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
