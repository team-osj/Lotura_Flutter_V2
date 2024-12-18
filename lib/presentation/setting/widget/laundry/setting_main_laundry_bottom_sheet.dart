import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:lotura_v2/core/component/lotura_gesture.dart';
import 'package:lotura_v2/core/component/lotura_toast_widget.dart';
import 'package:lotura_v2/core/di/lotura_style.dart';
import 'package:lotura_v2/core/hive/laundry_room_option.dart';
import 'package:lotura_v2/core/utils/lotura_util.dart';
import 'package:lotura_v2/presentation/setting/provider/laundry/get_laundry_room_option_view_model_provider.dart';
import 'package:lotura_v2/presentation/setting/provider/laundry/update_laundry_room_option_view_model_provider.dart';
import 'package:lotura_v2/presentation/setting/provider/state/laundry/update_laundry_room_option_state.dart';
import 'package:lotura_v2/presentation/setting/widget/laundry/setting_laundry_locate_widget.dart';

class SettingMainLaundryBottomSheet extends ConsumerWidget {
  const SettingMainLaundryBottomSheet({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final getLaundryRoomOption =
        ref.watch(getLaundryRoomOptionViewModelProvider);
    final updateLaundryOption =
        ref.read(updateLaundryRoomOptionViewModelProvider.notifier);
    ref.listen(
        updateLaundryRoomOptionViewModelProvider.select((value) => value),
        (previous, next) {
      switch (next) {
        case UpdateLaundryRoomOptionState.success:

          /// 변경된 값 렌더링
          ref.read(getLaundryRoomOptionViewModelProvider.notifier).execute();

          /// BottomSheet pop 처리
          context.pop("/setting");

          /// ToastMessage 띄우기
          LoturaUtil.loturaToast(
            context: context,
            text: "메인 세탁기 설정이 변경되었습니다.",
            type: LoturaToastType.success,
          );
        default:
          null;
      }
    });
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
              "메인 세탁실 설정",
              style: LoturaTextStyle.heading4(
                color: Theme.of(context).colorScheme.inverseSurface,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              "세탁실 탭에서 처음에 보여질 세탁실을 선택해보세요.",
              style: LoturaTextStyle.body2(
                color: Theme.of(context).colorScheme.surfaceContainer,
              ),
            ),
            const SizedBox(height: 20),
            LoturaGesture(
              event: () {
                if (getLaundryRoomOption.option != "남자 학교측") {
                  updateLaundryOption.execute(LaundryRoomOption.maleSchool);
                }
              },
              child: const SettingLaundryLocateWidget(option: "남자 학교측"),
            ),
            LoturaGesture(
              event: () {
                if (getLaundryRoomOption.option != "남자 기숙사측") {
                  updateLaundryOption.execute(LaundryRoomOption.maleDormitory);
                }
              },
              child: const SettingLaundryLocateWidget(option: "남자 기숙사측"),
            ),
            LoturaGesture(
              event: () {
                if (getLaundryRoomOption.option != "여자 기숙사측") {
                  updateLaundryOption.execute(LaundryRoomOption.female);
                }
              },
              child: const SettingLaundryLocateWidget(option: "여자 기숙사측"),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
