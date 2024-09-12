import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lotura_v2/core/component/lotura_app_bar.dart';
import 'package:lotura_v2/core/constants/lotura_style.dart';
import 'package:lotura_v2/core/layout/lotura_layout.dart';
import 'package:lotura_v2/presentation/setting/provider/get_laundry_room_option_view_model_provider.dart';
import 'package:lotura_v2/presentation/setting/widget/setting_inquiry_widget.dart';
import 'package:lotura_v2/presentation/setting/widget/setting_main_laundry_bottom_sheet.dart';
import 'package:lotura_v2/presentation/setting/widget/setting_main_laundry_widget.dart';

class SettingScreen extends ConsumerStatefulWidget {
  const SettingScreen({super.key});

  @override
  ConsumerState<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends ConsumerState<SettingScreen> {

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final laundryRoomOption = ref.watch(getLaundryRoomOptionViewModelProvider).option;
      /// laundryRoomOption의 기본 값은 null이므로, null값을 option enum 타입으로 변경해줘야함.
      if (laundryRoomOption == null) {
        ref.read(getLaundryRoomOptionViewModelProvider.notifier).execute();
      }
    });
  }

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
