import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lotura_v2/core/di/lotura_style.dart';
import 'package:lotura_v2/presentation/setting/provider/laundry/get_laundry_room_option_view_model_provider.dart';
import 'package:lotura_v2/presentation/setting/provider/laundry/update_laundry_room_option_view_model_provider.dart';
import 'package:lotura_v2/presentation/setting/provider/state/laundry/update_laundry_room_option_state.dart';

class SettingLaundryLocateWidget extends ConsumerWidget {
  final String option;

  const SettingLaundryLocateWidget({super.key, required this.option});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final getLaundryRoomOptionState =
        ref.watch(getLaundryRoomOptionViewModelProvider);
    final updateLaundryRoomOptionState =
        ref.watch(updateLaundryRoomOptionViewModelProvider);
    return SizedBox(
      height: 48,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            option,
            style: LoturaTextStyle.button1(
              color: Theme.of(context).colorScheme.inverseSurface,
            ),
          ),

          /// loading indicator를 보여주기 위함.
          if (getLaundryRoomOptionState.option == option &&
              updateLaundryRoomOptionState !=
                  UpdateLaundryRoomOptionState.loading)
            SvgPicture.asset(
              "$iconSettingAsset/check_icon.svg",
              colorFilter: ColorFilter.mode(
                Theme.of(context).colorScheme.primary,
                BlendMode.srcIn,
              ),
            ),
          if (updateLaundryRoomOptionState == UpdateLaundryRoomOptionState.loading)
            CupertinoActivityIndicator(color: Theme.of(context).colorScheme.surfaceDim),
        ],
      ),
    );
  }
}
