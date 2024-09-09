import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lotura_v2/core/constants/lotura_style.dart';
import 'package:lotura_v2/core/layout/lotura_layout.dart';
import 'package:lotura_v2/presentation/laundry/provider/local_laundry_room_option_provider.dart';
import 'package:lotura_v2/presentation/laundry/widget/laundry_room_select_radio_button.dart';
import 'package:lotura_v2/presentation/setting/provider/get_laundry_room_option_view_model_provider.dart';

class LaundryScreen extends ConsumerStatefulWidget {
  const LaundryScreen({super.key});

  @override
  ConsumerState<LaundryScreen> createState() => _LaundryScreenState();
}

class _LaundryScreenState extends ConsumerState<LaundryScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.watch(getLaundryRoomOptionViewModelProvider).option ??
          ref.read(getLaundryRoomOptionViewModelProvider.notifier).execute();
    });
  }

  @override
  Widget build(BuildContext context) {
    final localLaundryRoomOption = ref.watch(localLaundryRoomOptionProvider);
    final updateLocalLaundryRoomOption =
        ref.read(localLaundryRoomOptionProvider.notifier);
    return LoturaLayout(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Text(
                "남자 학교 측",
                style: LoturaTextStyle.heading3(
                  color: LoturaColor.black,
                ),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  GestureDetector(
                    behavior: HitTestBehavior.translucent,
                    onTap: () {
                      if (localLaundryRoomOption != "남자 학교측") {
                        updateLocalLaundryRoomOption.state = "남자 학교측";
                      }
                    },
                    child: const LaundryRoomSelectRadioButton(
                      option: "남자 학교측",
                    ),
                  ),
                  const SizedBox(width: 12),
                  GestureDetector(
                    behavior: HitTestBehavior.translucent,
                    onTap: () {
                      if (localLaundryRoomOption != "남자 기숙사측") {
                        updateLocalLaundryRoomOption.state = "남자 기숙사측";
                      }
                    },
                    child: const LaundryRoomSelectRadioButton(
                      option: "남자 기숙사측",
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
