import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lotura_v2/core/constants/lotura_style.dart';
import 'package:lotura_v2/presentation/setting/provider/state/window/update_window_option_state.dart';
import 'package:lotura_v2/presentation/setting/provider/window/get_window_option_view_model_provider.dart';
import 'package:lotura_v2/presentation/setting/provider/window/update_window_option_view_model_provider.dart';

class SettingWindowLocateWidget extends ConsumerWidget {
  final String option;

  const SettingWindowLocateWidget({
    super.key,
    required this.option,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final getWindowOptionState = ref.watch(getWindowOptionViewModelProvider);
    final updateWindowOptionState =
        ref.watch(updateWindowOptionViewModelProvider);
    return SizedBox(
      height: 48,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            option,
            style: LoturaTextStyle.button1(
              color: LoturaColor.black,
            ),
          ),

          /// loading indicator를 보여주기 위함.
          if (getWindowOptionState.option == option &&
              updateWindowOptionState != UpdateWindowOptionState.loading)
            SvgPicture.asset("$iconSettingAsset/check_icon.svg"),
          if (updateWindowOptionState == UpdateWindowOptionState.loading)
            const CupertinoActivityIndicator(color: LoturaColor.gray200),
        ],
      ),
    );
  }
}
