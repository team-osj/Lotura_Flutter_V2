import 'package:flutter/material.dart';
import 'package:lotura_v2/core/component/lotura_toast_widget.dart';

class LoturaUtil {
  LoturaUtil._();

  static void loturaToast({
    required BuildContext context,
    required String text,
    required LoturaToastType type,
  }) async {
    OverlayEntry overlay = OverlayEntry(
      builder: (_) => LoturaToastWidget(text: text, type: type),
    );

    Navigator.of(context).overlay!.insert(overlay);

    await Future.delayed(const Duration(seconds: 2));
    overlay.remove();
  }
}
