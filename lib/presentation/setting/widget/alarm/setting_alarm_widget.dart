import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lotura_v2/core/component/lotura_toast_widget.dart';
import 'package:lotura_v2/core/constants/lotura_style.dart';
import 'package:lotura_v2/core/utils/lotura_util.dart';

/// 알림 설정 버튼 위젯
class SettingAlarmWidget extends StatelessWidget {
  const SettingAlarmWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      /// 개발 중.. ㅎㅎ
      onTap: () => LoturaUtil.loturaToast(
        context: context,
        text: "해당 기능은 아직 개발 중입니다.",
        type: LoturaToastType.failure,
      ),
      // onTap: () => showModalBottomSheet(
      //   context: context,
      //   backgroundColor: LoturaColor.white,
      //   builder: (context) {
      //     return const SafeArea(
      //       child: SettingAlarmBottomSheet(),
      //     );
      //   },
      // ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "알림음 설정",
              style: LoturaTextStyle.subTitle2(
                color: LoturaColor.black,
              ),
            ),
            SvgPicture.asset(
              "$iconSettingAsset/right_arrow_icon.svg",
            ),
          ],
        ),
      ),
    );
  }
}
