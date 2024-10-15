import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:lotura_v2/core/component/lotura_button.dart';
import 'package:lotura_v2/core/constants/lotura_style.dart';
import 'package:lotura_v2/core/provider/state/device/device_state.dart';
import 'package:lotura_v2/core/provider/state/device/device_type.dart';

class LoturaBottomSheet extends StatefulWidget {
  final int count;
  final DeviceType type;
  final DeviceState state;
  final Function actionFunc;

  final bool? isLaundry; /// 지금 페이지가 세탁실 현황 페이지인지

  const LoturaBottomSheet({
    super.key,
    required this.count,
    required this.type,
    required this.state,
    required this.actionFunc,
    this.isLaundry = true,
  });

  @override
  State<LoturaBottomSheet> createState() => _LoturaBottomSheetState();
}

class _LoturaBottomSheetState extends State<LoturaBottomSheet> {
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
                "",//deviceComment[widget.state]!.elementAt(0),
                style: LoturaTextStyle.heading4(
                  color: LoturaColor.black,
                ),
              ),
              //if (content != null)
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Text(
                  "세탁기가 종료되면 알림을 드릴게요.",
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
                        onTap: () {

                        },
                        child: LoturaButton(text: widget.isLaundry! ? "알림 설정" : "알림 해제"),
                      ),
                    ),
                  ],
                )
              else
                const LoturaButton(text: "확인"),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
