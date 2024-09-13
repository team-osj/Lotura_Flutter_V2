import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lotura_v2/core/component/lotura_app_bar.dart';
import 'package:lotura_v2/core/constants/lotura_style.dart';
import 'package:lotura_v2/core/layout/lotura_layout.dart';
import 'package:lotura_v2/presentation/setting/provider/get_laundry_room_option_view_model_provider.dart';
import 'package:lotura_v2/presentation/setting/widget/setting_inquiry_widget.dart';
import 'package:lotura_v2/presentation/setting/widget/setting_main_laundry_bottom_sheet.dart';
import 'package:lotura_v2/presentation/setting/widget/setting_main_laundry_widget.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingScreen extends ConsumerStatefulWidget {
  const SettingScreen({super.key});

  @override
  ConsumerState<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends ConsumerState<SettingScreen> {

  @override
  Widget build(BuildContext context) {
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
              onTap: () async => await launchUrl(
                Uri.parse('https://open.kakao.com/o/sHjnH1Se'),
                mode: LaunchMode.externalApplication,
              ),
              child: const SettingInquiryWidget(),
            ),
          ],
        ),
      ),
    );
  }
}
