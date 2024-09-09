import 'package:flutter/material.dart';
import 'package:lotura_v2/core/component/lotura_app_bar.dart';
import 'package:lotura_v2/core/constants/lotura_style.dart';
import 'package:lotura_v2/core/layout/lotura_layout.dart';
import 'package:lotura_v2/presentation/setting/widget/setting_inquiry_widget.dart';
import 'package:lotura_v2/presentation/setting/widget/setting_main_laundry_bottom_sheet.dart';
import 'package:lotura_v2/presentation/setting/widget/setting_main_laundry_widget.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return LoturaLayout(
      appBar: const LoturaAppBar(
        popRoute: "/main",
        title: "설정",
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            const SizedBox(height: 12),
            GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap: () => showModalBottomSheet(
                context: context,
                backgroundColor: LoturaColor.white,
                builder: (context) {
                  return const SafeArea(
                    child: SettingMainLaundryBottomSheet(),
                  );
                },
              ),
              child: const SettingMainLaundryWidget(),
            ),
            const SizedBox(height: 12),
            GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap: () {},
              child: const SettingInquiryWidget(),
            ),
          ],
        ),
      ),
    );
  }
}
