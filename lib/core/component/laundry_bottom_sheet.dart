import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:lotura_v2/core/component/lotura_button.dart';
import 'package:lotura_v2/core/constants/lotura_style.dart';
import 'package:lotura_v2/core/provider/state/device/device_state.dart';
import 'package:lotura_v2/core/provider/state/device/device_type.dart';

class LaundryBottomSheet extends StatefulWidget {
  final int id;
  final DeviceType type;
  final DeviceState state;
  final Function actionFunc;

  final bool? isLaundry;

  /// 지금 페이지가 세탁실 현황 페이지인지

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
    return GestureDetector(
      child: Container(
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
                onTap: () => context.pop("/"),
                child: Center(
                  child: SvgPicture.asset(
                    "$iconCoreAsset/bottom_arrow_icon.svg",
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                formatTitle(
                    id: widget.id, type: widget.type, state: widget.state),
                style: LoturaTextStyle.heading4(
                  color: LoturaColor.black,
                ),
              ),
              if (widget.state != DeviceState.available)
                Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: Text(
                    formatNotice(type: widget.type, state: widget.state)!,
                    style: LoturaTextStyle.body2(
                      color: LoturaColor.gray700,
                    ),
                  ),
                ),
              const SizedBox(height: 20),
              if (widget.state == DeviceState.working)
                Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        behavior: HitTestBehavior.translucent,
                        onTap: () => context.pop("/"),
                        child: const LoturaButton(
                          text: "취소",
                          textColor: LoturaColor.black,
                          backgroundColor: LoturaColor.gray50,
                        ),
                      ),
                    ),
                    const SizedBox(width: 14),
                    Expanded(
                      child: GestureDetector(
                        behavior: HitTestBehavior.translucent,
                        onTap: () {},
                        child: LoturaButton(
                          text: widget.isLaundry! ? "알림 설정" : "알림 해제",
                        ),
                      ),
                    ),
                  ],
                )
              else
                GestureDetector(
                  onTap: () => context.pop("/"),
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
        return "$device가 종료되면 알림을 드릴게요.";
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
        return "$id번 $device를\n알림 설정할까요?";
      case DeviceState.available:
        return "$id번 $device는\n현재 사용할 수 있어요!";
      case DeviceState.disconnect:
        return "$id번 $device는\n연결이 끊겨서 사용할 수 없어요.";
      case DeviceState.breakdown:
        return "$id번 $device는\n고장으로 인해서 사용할 수 없어요.";
    }
  }
}
