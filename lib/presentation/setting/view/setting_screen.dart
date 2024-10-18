import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lotura_v2/core/component/lotura_app_bar.dart';
import 'package:lotura_v2/core/layout/lotura_layout.dart';
import 'package:lotura_v2/presentation/setting/provider/laundry/get_laundry_room_option_view_model_provider.dart';
import 'package:lotura_v2/presentation/setting/provider/window/get_window_option_view_model_provider.dart';
import 'package:lotura_v2/presentation/setting/widget/alarm/setting_alarm_widget.dart';
import 'package:lotura_v2/presentation/setting/widget/inquiry/setting_inquiry_widget.dart';
import 'package:lotura_v2/presentation/setting/widget/laundry/setting_main_laundry_bottom_sheet.dart';
import 'package:lotura_v2/presentation/setting/widget/setting_option_widget.dart';
import 'package:lotura_v2/presentation/setting/widget/window/setting_main_window_bottom_sheet.dart';

class SettingScreen extends ConsumerWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final laundryOption = ref.watch(getLaundryRoomOptionViewModelProvider);
    final windowOption = ref.watch(getWindowOptionViewModelProvider);
    return LoturaLayout(
      appBar: const LoturaAppBar(
        popRoute: "/",
        title: "설정",
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            const SizedBox(height: 12),
            SettingOptionWidget(
              bottomSheet: const SettingMainLaundryBottomSheet(),
              title: "메인 세탁실 설정",
              option: laundryOption.option.toString(),
            ),
            const SizedBox(height: 12),
            SettingOptionWidget(
              bottomSheet: const SettingMainWindowBottomSheet(),
              title: "메인 화면 설정",
              option: windowOption.option.toString(),
            ),
            const SizedBox(height: 12),
            const SettingAlarmWidget(),
            const SizedBox(height: 12),
            const SettingInquiryWidget(),
          ],
        ),
      ),
    );
  }
}
