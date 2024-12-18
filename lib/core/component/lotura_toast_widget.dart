import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lotura_v2/core/di/lotura_style.dart';

enum LoturaToastType {
  success,
  failure,
}

class LoturaToastWidget extends StatefulWidget {
  final String text;
  final LoturaToastType type;

  const LoturaToastWidget({
    super.key,
    required this.text,
    required this.type,
  });

  @override
  State<LoturaToastWidget> createState() => _LoturaToastWidgetState();
}

class _LoturaToastWidgetState extends State<LoturaToastWidget> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 58),
          child: Material(
            color: Theme.of(context).colorScheme.scrim,
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondary,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SvgPicture.asset(
                      "$iconCoreAsset/circle_${widget.type.name}_icon.svg",
                      colorFilter: ColorFilter.mode(
                        widget.type == LoturaToastType.success
                            ? Theme.of(context).colorScheme.primary
                            : Theme.of(context).colorScheme.error,
                        BlendMode.srcIn,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      widget.text,
                      style: LoturaTextStyle.body1(
                        color: Theme.of(context).colorScheme.inverseSurface,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
