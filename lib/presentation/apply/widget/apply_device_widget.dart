import 'package:flutter/material.dart';
import 'package:lotura_v2/core/component/laundry_bottom_sheet.dart';
import 'package:lotura_v2/core/component/lotura_gesture.dart';
import 'package:lotura_v2/core/di/lotura_asset.dart';
import 'package:lotura_v2/core/component/lotura_text_style.dart';
import 'package:lotura_v2/core/provider/state/device/device_state.dart';
import 'package:lotura_v2/core/provider/state/device/device_type.dart';
import 'package:lotura_v2/presentation/apply/widget/apply_device_state_widget.dart';

class ApplyDeviceWidget extends StatelessWidget {
  final int id;
  final DeviceType type;
  final DeviceState state;

  const ApplyDeviceWidget({
    super.key,
    required this.id,
    required this.type,
    required this.state,
  });

  @override
  Widget build(BuildContext context) {
    return LoturaGesture(
      event: () => showModalBottomSheet(
        context: context,
        backgroundColor: Theme.of(context).colorScheme.onSurface,
        builder: (context) {
          return LaundryBottomSheet(
            state: state,
            type: type,
            actionFunc: () {},
            id: id,
            isLaundry: false,
          );
        },
      ),
      child: FittedBox(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              width: 1,
              color: Theme.of(context).colorScheme.primaryContainer,
              strokeAlign: BorderSide.strokeAlignInside,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  "$imageApplyAsset/${type.name}_image.png",
                  width: 120,
                  height: 120,
                ),
                const SizedBox(height: 12),
                Text(
                  "$id번 ${type.text}",
                  style: LoturaTextStyle.subTitle2(
                    color: Theme.of(context).colorScheme.inverseSurface,
                  ),
                ),
                const SizedBox(height: 12),
                ApplyDeviceStateWidget(
                  state: state.themeTextHandler(),
                  color: state.themeIconColorHandler(context),
                  backgroundColor: state.themeColorHandler(context),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
