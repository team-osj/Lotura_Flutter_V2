import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lotura_v2/core/component/lotura_gesture.dart';
import 'package:lotura_v2/core/component/lotura_scroll_widget.dart';
import 'package:lotura_v2/core/constants/lotura_style.dart';
import 'package:lotura_v2/core/dummy/laundry_room_locate_dummy.dart';
import 'package:lotura_v2/core/layout/lotura_layout.dart';
import 'package:lotura_v2/presentation/laundry/provider/get_stream_laundry_view_model_provider.dart';
import 'package:lotura_v2/presentation/laundry/provider/local_laundry_room_option_provider.dart';
import 'package:lotura_v2/presentation/laundry/provider/state/get_stream_laundry_state.dart';
import 'package:lotura_v2/presentation/laundry/widget/laundry_device_array_widget.dart';
import 'package:lotura_v2/presentation/laundry/widget/laundry_room_select_radio_button.dart';

class LaundryScreen extends ConsumerStatefulWidget {
  const LaundryScreen({super.key});

  @override
  ConsumerState<LaundryScreen> createState() => _LaundryScreenState();
}

class _LaundryScreenState extends ConsumerState<LaundryScreen> {
  late ScrollController controller;

  @override
  void initState() {
    super.initState();
    controller = ScrollController();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final localLaundryRoomOption =
        ref
            .watch(localLaundryRoomOptionViewModelProvider)
            .option;
    final localLaundryRoomLocate =
        ref
            .watch(localLaundryRoomOptionViewModelProvider)
            .locate;
    final laundryState = ref
        .watch(getStreamLaundryViewModelProvider)
        .state;
    final updateLocalLaundryRoomOption =
    ref.read(localLaundryRoomOptionViewModelProvider.notifier);
    return LoturaLayout(
      child: LoturaScrollWidget(
        controller: controller,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 28),
              Text(
                localLaundryRoomOption!.replaceAll("측", " 측"),
                style: LoturaTextStyle.heading3(
                  color: Theme.of(context).colorScheme.inverseSurface,
                ),
              ),
              const SizedBox(height: 20),
              FittedBox(
                child: Row(
                  children: [
                    LoturaGesture(
                      event: () {
                        if (localLaundryRoomOption != "남자 학교측") {
                          updateLocalLaundryRoomOption.changeOption(
                            option: "남자 학교측",
                            locate: maleSchoolLocateDummy,
                          );
                        }
                      },
                      child: const LaundryRoomSelectRadioButton(
                        option: "남자 학교측",
                      ),
                    ),
                    const SizedBox(width: 12),
                    LoturaGesture(
                      event: () {
                        if (localLaundryRoomOption != "남자 기숙사측") {
                          updateLocalLaundryRoomOption.changeOption(
                            option: "남자 기숙사측",
                            locate: maleDormitoryLocateDummy,
                          );
                        }
                      },
                      child: const LaundryRoomSelectRadioButton(
                        option: "남자 기숙사측",
                      ),
                    ),
                    const SizedBox(width: 12),
                    LoturaGesture(
                      event: () {
                        if (localLaundryRoomOption != "여자 기숙사측") {
                          updateLocalLaundryRoomOption.changeOption(
                            option: "여자 기숙사측",
                            locate: femaleDormitoryLocateDummy,
                          );
                        }
                      },
                      child: const LaundryRoomSelectRadioButton(
                        option: "여자 기숙사측",
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 28),
              switch (laundryState) {
                GetStreamLaundryState.success =>
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: localLaundryRoomLocate!.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.only(
                            bottom: index == localLaundryRoomLocate.length - 1
                                ? 24
                                : 12,
                          ),
                          child: LaundryDeviceArrayWidget(
                            type: localLaundryRoomLocate
                                .elementAt(index)
                                .keys
                                .single,
                            item: localLaundryRoomLocate
                                .elementAt(index)
                                .values
                                .single,
                          ),
                        );
                      },
                    ),
                GetStreamLaundryState.failure => const Text("인터넷 연결을 확인해주세요."),
                GetStreamLaundryState.initial =>
                const Center(child: CupertinoActivityIndicator()),
                GetStreamLaundryState.loading =>
                const Center(child: CupertinoActivityIndicator()),
              }
            ],
          ),
        ),
      ),
    );
  }
}
