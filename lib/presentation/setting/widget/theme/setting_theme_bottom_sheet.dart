import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:lotura_v2/core/component/lotura_gesture.dart';
import 'package:lotura_v2/core/component/lotura_toast_widget.dart';
import 'package:lotura_v2/core/di/lotura_style.dart';
import 'package:lotura_v2/core/theme/view_model/provider/get_theme_option_view_model_provider.dart';
import 'package:lotura_v2/core/theme/view_model/provider/update_theme_option_view_model_provider.dart';
import 'package:lotura_v2/core/theme/view_model/state/update_theme_option_state.dart';
import 'package:lotura_v2/core/utils/lotura_util.dart';
import 'package:lotura_v2/presentation/setting/widget/theme/setting_theme_type_widget.dart';

class SettingThemeBottomSheet extends ConsumerWidget {
  const SettingThemeBottomSheet({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final getThemeOption = ref.watch(getThemeOptionViewModelProvider);
    final updateThemeOption = ref.read(updateThemeOptionViewModelProvider.notifier);
    ref.listen(updateThemeOptionViewModelProvider.select((value) => value),
        (previous, next) {
      switch (next) {
        case UpdateThemeOptionState.success:

          /// 변경된 값 렌더링
          ref.read(getThemeOptionViewModelProvider.notifier).execute();

          /// BottomSheet pop 처리
          context.pop("/setting");

          /// ToastMessage 띄우기
          LoturaUtil.loturaToast(
            context: context,
            text: "모드 설정이 변경되었습니다.",
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
              "화면 모드 설정",
              style: LoturaTextStyle.heading4(
                color: Theme.of(context).colorScheme.inverseSurface,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              "화면에 보여질 모드를 선택해보세요.",
              style: LoturaTextStyle.body2(
                color: Theme.of(context).colorScheme.surfaceContainer,
              ),
            ),
            const SizedBox(height: 20),
            LoturaGesture(
              event: () {
                if (getThemeOption.mode != ThemeMode.light) {
                  updateThemeOption.execute(brightness: Brightness.light);
                }
              },
              child: const SettingThemeTypeWidget(brightness: Brightness.light),
            ),
            LoturaGesture(
              event: () {
                if (getThemeOption.mode != ThemeMode.dark) {
                  updateThemeOption.execute(brightness: Brightness.dark);
                }
              },
              child: const SettingThemeTypeWidget(brightness: Brightness.dark),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
