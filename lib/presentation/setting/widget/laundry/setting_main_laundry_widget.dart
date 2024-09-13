import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lotura_v2/core/constants/lotura_style.dart';
import 'package:lotura_v2/presentation/setting/provider/get_laundry_room_option_view_model_provider.dart';
import 'package:lotura_v2/presentation/setting/widget/laundry/setting_main_laundry_bottom_sheet.dart';

class SettingMainLaundryWidget extends ConsumerWidget {
  const SettingMainLaundryWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final laundryOptionState = ref.watch(getLaundryRoomOptionViewModelProvider);
    return GestureDetector(
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
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "메인 세탁실 설정",
              style: LoturaTextStyle.subTitle2(
                color: LoturaColor.black,
              ),
            ),
            Row(
              children: [
                Text(
                  laundryOptionState.option.toString(),
                  style: LoturaTextStyle.subTitle2(
                    color: LoturaColor.main500,
                  ),
                ),
                const SizedBox(width: 8),
                SvgPicture.asset(
                  "$iconSettingAsset/right_arrow_icon.svg",
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
