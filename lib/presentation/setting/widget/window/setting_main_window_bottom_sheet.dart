import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:lotura_v2/core/component/lotura_toast_widget.dart';
import 'package:lotura_v2/core/constants/lotura_style.dart';
import 'package:lotura_v2/core/hive/window_option.dart';
import 'package:lotura_v2/core/utils/lotura_util.dart';
import 'package:lotura_v2/presentation/setting/provider/state/window/update_window_option_state.dart';
import 'package:lotura_v2/presentation/setting/provider/window/get_window_option_view_model_provider.dart';
import 'package:lotura_v2/presentation/setting/provider/window/update_window_option_view_model_provider.dart';
import 'package:lotura_v2/presentation/setting/widget/window/setting_window_locate_widget.dart';

class SettingMainWindowBottomSheet extends ConsumerWidget {
  const SettingMainWindowBottomSheet({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final getWindowOption = ref.watch(getWindowOptionViewModelProvider);
    final updateWindowOption = ref.read(updateWindowOptionViewModelProvider.notifier);
    ref.listen(updateWindowOptionViewModelProvider.select((value) => value),
        (previous, next) {
      switch (next) {
        case UpdateWindowOptionState.success:

          /// 변경된 값 렌더링
          ref.read(getWindowOptionViewModelProvider.notifier).execute();

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
      decoration: const BoxDecoration(
        color: LoturaColor.white,
        borderRadius: BorderRadius.only(
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
            GestureDetector(
              onTap: () => context.pop("/setting"),
              child: Center(
                child: SvgPicture.asset(
                  "$iconCoreAsset/bottom_arrow_icon.svg",
                ),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              "메인 화면 설정",
              style: LoturaTextStyle.heading4(
                color: LoturaColor.black,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              "앱에서 처음에 보여질 화면을 선택해보세요.",
              style: LoturaTextStyle.body2(
                color: LoturaColor.gray700,
              ),
            ),
            const SizedBox(height: 20),
            GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap: () {
                if (getWindowOption.option != "내 세탁실") {
                  updateWindowOption.execute(option: WindowOption.apply);
                }
              },
              child: const SettingWindowLocateWidget(option: "내 세탁실"),
            ),
            GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap: () {
                if (getWindowOption.option != "세탁실 현황") {
                  updateWindowOption.execute(option: WindowOption.laundry);
                }
              },
              child: const SettingWindowLocateWidget(option: "세탁실 현황"),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
