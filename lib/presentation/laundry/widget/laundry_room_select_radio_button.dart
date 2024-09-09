import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lotura_v2/core/constants/lotura_style.dart';
import 'package:lotura_v2/presentation/laundry/provider/local_laundry_room_option_provider.dart';

class LaundryRoomSelectRadioButton extends ConsumerWidget {
  final String option;

  const LaundryRoomSelectRadioButton({super.key, required this.option});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final localLaundryRoomOption = ref.watch(localLaundryRoomOptionProvider);
    return Container(
      height: 35,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: localLaundryRoomOption == option
            ? LoturaColor.main500
            : LoturaColor.gray50,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Text(
          option,
          style: LoturaTextStyle.button1(
            color: localLaundryRoomOption == option
                ? LoturaColor.white
                : LoturaColor.gray500,
          ),
        ),
      ),
    );
  }
}
