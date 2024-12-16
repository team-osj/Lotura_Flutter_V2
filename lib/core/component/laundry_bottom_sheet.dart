import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:lotura_v2/core/component/lotura_button.dart';
import 'package:lotura_v2/core/component/lotura_gesture.dart';
import 'package:lotura_v2/core/di/lotura_style.dart';
import 'package:lotura_v2/core/provider/state/device/device_state.dart';
import 'package:lotura_v2/core/provider/state/device/device_type.dart';

class LaundryBottomSheet extends StatefulWidget {
  final int id;
  final DeviceType type;
  final DeviceState state;
  final Function actionFunc;

  /// 지금 페이지가 세탁실 현황 페이지인지
  final bool? isLaundry;

  const LaundryBottomSheet({
    super.key,
    required this.id,
    required this.type,
    required this.state,
    required this.actionFunc,
    this.isLaundry = true,
  });

  @override
  State<LaundryBottomSheet> createState() => _LaundryBottomSheetState();
}

class _LaundryBottomSheetState extends State<LaundryBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
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
                event: () => context.pop("/"),
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
                formatTitle(
                    id: widget.id, type: widget.type, state: widget.state),
                style: LoturaTextStyle.heading4(
                  color: Theme.of(context).colorScheme.inverseSurface,
                ),
              ),
              if (widget.state != DeviceState.available)
                Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: Text(
                    formatNotice(type: widget.type, state: widget.state)!,
                    style: LoturaTextStyle.body2(
                      color: Theme.of(context).colorScheme.surfaceContainer,
                    ),
                  ),
                ),
              const SizedBox(height: 20),
              if (widget.state == DeviceState.working)
                Row(
                  children: [
                    Expanded(
                      child: LoturaGesture(
                        event: () => context.pop("/"),
                        child: LoturaButton(
                          text: "취소",
                          textColor: Theme.of(context).colorScheme.inverseSurface,
                          backgroundColor:
                              Theme.of(context).colorScheme.secondary,
                        ),
                      ),
                    ),
                    const SizedBox(width: 14),
                    Expanded(
                      child: LoturaGesture(
                        event: () {},
                        child: LoturaButton(
                          text: widget.isLaundry! ? "알림 설정" : "알림 해제",
                        ),
                      ),
                    ),
                  ],
                )
              else
                LoturaGesture(
                  event: () => context.pop("/"),
                  child: const LoturaButton(text: "확인"),
                ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  String? formatNotice({
    required DeviceType type,
    required DeviceState state,
  }) {
    final device = type.text;
    switch (state) {
      case DeviceState.working:
        if (widget.isLaundry!) {
          return "$device가 종료되면 알림을 드릴게요.";
        } else {
          return "알림 설정을 해제하시면 종료 알림을 받으실 수 없습니다.";
        }
      case DeviceState.available:
        return null;
      case DeviceState.disconnect:
        return "다른 $device를 사용해주세요.\n빠른 시일 내에 연결해 사용 가능하도록 하겠습니다.";
      case DeviceState.breakdown:
        return "다른 $device를 사용해주세요.\n빠른 시일 내에 수리해 사용 가능하도록 하겠습니다.";
    }
  }

  String formatTitle({
    required int id,
    required DeviceType type,
    required DeviceState state,
  }) {
    final device = type.text;
    switch (state) {
      case DeviceState.working:
        if (widget.isLaundry!) {
          return "$id번 $device를\n알림 설정할까요?";
        } else {
          return "$id번 $device의\n알림 설정을 해제하실 건가요?";
        }
      case DeviceState.available:
        return "$id번 $device는\n현재 사용할 수 있어요!";
      case DeviceState.disconnect:
        return "$id번 $device는\n연결이 끊겨서 사용할 수 없어요.";
      case DeviceState.breakdown:
        return "$id번 $device는\n고장으로 인해서 사용할 수 없어요.";
    }
  }
}
