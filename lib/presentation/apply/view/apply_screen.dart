import 'package:flutter/material.dart';
import 'package:lotura_v2/core/component/lotura_scroll_widget.dart';
import 'package:lotura_v2/core/constants/lotura_color.dart';
import 'package:lotura_v2/core/constants/lotura_text_style.dart';
import 'package:lotura_v2/core/layout/lotura_layout.dart';
import 'package:lotura_v2/core/provider/state/device/device_state.dart';
import 'package:lotura_v2/core/provider/state/device/device_type.dart';
import 'package:lotura_v2/presentation/apply/widget/apply_device_widget.dart';

class ApplyScreen extends StatefulWidget {
  const ApplyScreen({super.key});

  @override
  State<ApplyScreen> createState() => _ApplyScreenState();
}

class _ApplyScreenState extends State<ApplyScreen> {
  @override
  Widget build(BuildContext context) {
    return LoturaLayout(
      child: LoturaScrollWidget(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 58),
              Text(
                "알람 설정한\n세탁기와 건조기",
                style: LoturaTextStyle.heading2(
                  color: LoturaColor.black,
                ),
              ),
              const SizedBox(height: 14),
              Text(
                "알림을 설정하여 세탁기와 건조기를\n누구보다 빠르게 사용해보세요.",
                style: LoturaTextStyle.body1(
                  color: LoturaColor.gray500,
                ),
              ),
              const SizedBox(height: 28),
              GridView.builder(
                shrinkWrap: true,
                itemCount: 10,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 14,
                  mainAxisSpacing: 14,
                  childAspectRatio: 164 / 232
                ),
                itemBuilder: (context, index) {
                  return ApplyDeviceWidget(
                    id: 1,
                    type: DeviceType.dryer,
                    state: DeviceState.available,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
