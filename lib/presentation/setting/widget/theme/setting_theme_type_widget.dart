import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lotura_v2/core/constants/lotura_style.dart';
import 'package:lotura_v2/core/theme/view_model/provider/update_theme_option_view_model_provider.dart';
import 'package:lotura_v2/core/theme/view_model/state/update_theme_option_state.dart';

class SettingThemeTypeWidget extends ConsumerWidget {
  final Brightness brightness;

  const SettingThemeTypeWidget({super.key, required this.brightness});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final updateThemeOptionState = ref.watch(updateThemeOptionViewModelProvider);
    return SizedBox(
      height: 48,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            switch (brightness) {
              Brightness.dark => "다크 모드",
              Brightness.light => "라이트 모드",
            },
            style: LoturaTextStyle.button1(
              color: Theme.of(context).colorScheme.inverseSurface,
            ),
          ),

          /// loading indicator를 보여주기 위함.
          if (Theme.of(context).colorScheme.brightness == brightness &&
              updateThemeOptionState != UpdateThemeOptionState.loading)
            SvgPicture.asset(
              "$iconSettingAsset/check_icon.svg",
              colorFilter: ColorFilter.mode(
                Theme.of(context).colorScheme.primary,
                BlendMode.srcIn,
              ),
            ),
          if (updateThemeOptionState == UpdateThemeOptionState.loading)
            CupertinoActivityIndicator(
              color: Theme.of(context).colorScheme.surfaceDim,
            ),
        ],
      ),
    );
  }
}
