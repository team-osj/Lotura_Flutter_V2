import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:lotura_v2/core/component/lotura_gesture.dart';
import 'package:lotura_v2/core/constants/lotura_style.dart';
import 'package:lotura_v2/presentation/setting/widget/alarm/setting_alarm_switch.dart';

class SettingAlarmBottomSheet extends StatelessWidget {
  const SettingAlarmBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.onSurface,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 4),
            LoturaGesture(
              event: () => context.pop("/setting"),
              child: Center(
                child: SvgPicture.asset(
                  "$iconCoreAsset/bottom_arrow_icon.svg",
                  colorFilter: ColorFilter.mode(
                    Theme.of(context).colorScheme.surfaceContainerLowest,
                    BlendMode.srcIn,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              "알림음 설정",
              style: LoturaTextStyle.heading4(
                color: Theme.of(context).colorScheme.inverseSurface,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              "세탁기와 건조기의 알림을 더 편리하게 들어보세요.",
              style: LoturaTextStyle.body2(
                color: Theme.of(context).colorScheme.surfaceContainer,
              ),
            ),
            const SizedBox(height: 20),
            const SettingAlarmSwitch(option: "세탁기", value: false),
            const SettingAlarmSwitch(option: "건조기", value: true),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
