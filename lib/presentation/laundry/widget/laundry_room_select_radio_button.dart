import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lotura_v2/core/constants/lotura_style.dart';
import 'package:lotura_v2/presentation/laundry/provider/local_laundry_room_option_provider.dart';

class LaundryRoomSelectRadioButton extends ConsumerWidget {
  final String option;

  const LaundryRoomSelectRadioButton({super.key, required this.option});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final localLaundryRoomOption = ref.watch(localLaundryRoomOptionViewModelProvider).option;
    return Container(
      height: 35,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: localLaundryRoomOption == option
            ? Theme.of(context).colorScheme.primary
            : Theme.of(context).colorScheme.secondary,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Text(
          /// 현재 사용된 radio의 value가 "여자 기숙사측" 일 경우 버튼 텍스트를 "여자"로 변경
          option == "여자 기숙사측" ? "여자" : option,
          style: LoturaTextStyle.button1(
            color: localLaundryRoomOption == option
                ? Theme.of(context).colorScheme.onSurface
                : Theme.of(context).colorScheme.onSecondary,
          ),
        ),
      ),
    );
  }
}
