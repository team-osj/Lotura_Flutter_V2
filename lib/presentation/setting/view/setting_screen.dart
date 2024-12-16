import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lotura_v2/core/component/lotura_app_bar.dart';
import 'package:lotura_v2/core/di/lotura_style.dart';
import 'package:lotura_v2/core/layout/lotura_layout.dart';
import 'package:lotura_v2/presentation/setting/provider/laundry/get_laundry_room_option_view_model_provider.dart';
import 'package:lotura_v2/presentation/setting/widget/alarm/setting_alarm_widget.dart';
import 'package:lotura_v2/presentation/setting/widget/inquiry/setting_inquiry_widget.dart';
import 'package:lotura_v2/presentation/setting/widget/laundry/setting_main_laundry_bottom_sheet.dart';
import 'package:lotura_v2/presentation/setting/widget/setting_option_widget.dart';
import 'package:lotura_v2/presentation/setting/widget/theme/setting_theme_bottom_sheet.dart';

class SettingScreen extends ConsumerWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final laundryOption = ref.watch(getLaundryRoomOptionViewModelProvider);
    return LoturaLayout(
      appBar: const LoturaAppBar(title: "설정"),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            const SizedBox(height: 12),
            SettingOptionWidget(
              bottomSheet: const SettingMainLaundryBottomSheet(),
              title: "메인 세탁실 설정",
              // option: laundryOption.option.toString(),
              option: Row(
                children: [
                  Text(
                    laundryOption.option.toString(),
                    style: LoturaTextStyle.subTitle2(
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  const SizedBox(width: 8),
                  SvgPicture.asset(
                    "$iconSettingAsset/right_arrow_icon.svg",
                    colorFilter: ColorFilter.mode(
                      Theme.of(context).colorScheme.surfaceTint,
                      BlendMode.srcIn,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),
            const SettingAlarmWidget(),
            const SizedBox(height: 12),
            SettingOptionWidget(
              bottomSheet: const SettingThemeBottomSheet(),
              title: "모드 설정",
              option: Row(
                children: [
                  SvgPicture.asset(
                    "$iconThemeAsset/${Theme.of(context).colorScheme.brightness.name}_icon.svg",
                    colorFilter: ColorFilter.mode(
                      Theme.of(context).colorScheme.primary,
                      BlendMode.srcIn,
                    ),
                  ),
                  const SizedBox(width: 8),
                  SvgPicture.asset(
                    "$iconSettingAsset/right_arrow_icon.svg",
                    colorFilter: ColorFilter.mode(
                      Theme.of(context).colorScheme.surfaceTint,
                      BlendMode.srcIn,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),
            const SettingInquiryWidget(),
          ],
        ),
      ),
    );
  }
}
