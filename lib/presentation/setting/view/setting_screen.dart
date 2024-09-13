import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lotura_v2/core/component/lotura_app_bar.dart';
import 'package:lotura_v2/core/layout/lotura_layout.dart';
import 'package:lotura_v2/presentation/setting/widget/setting_alarm_widget.dart';
import 'package:lotura_v2/presentation/setting/widget/setting_inquiry_widget.dart';
import 'package:lotura_v2/presentation/setting/widget/setting_main_laundry_widget.dart';

class SettingScreen extends ConsumerStatefulWidget {
  const SettingScreen({super.key});

  @override
  ConsumerState<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends ConsumerState<SettingScreen> {

  @override
  Widget build(BuildContext context) {
    return const LoturaLayout(
      appBar: LoturaAppBar(
        popRoute: "/",
        title: "설정",
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            SizedBox(height: 12),
            SettingMainLaundryWidget(),
            SizedBox(height: 12),
            SettingAlarmWidget(),
            SizedBox(height: 12),
            SettingInquiryWidget(),
          ],
        ),
      ),
    );
  }
}
