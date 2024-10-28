import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:lotura_v2/core/component/lotura_gesture.dart';
import 'package:lotura_v2/core/constants/lotura_style.dart';

class LoturaAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;

  const LoturaAppBar({
    super.key,
    this.title,
  });

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

          /// title 위젯을 center에 배치
          centerTitle: true,
          backgroundColor: LoturaColor.white,
          leading: LoturaGesture(
            event: () => context.pop(),
            child: Center(
              child: SvgPicture.asset(
                "$iconCoreAsset/left_arrow_icon.svg",
              ),
            ),
          ),
          title: title != null
              ? Text(
                  title!,
                  style: LoturaTextStyle.subTitle2(
                    color: LoturaColor.gray900,
                  ),
                )
              : null,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(54);
}
