import 'package:flutter/material.dart';

enum DeviceState {
  /// 작동중
  working,

  /// 사용 가능
  available,

  /// 연결 끊김
  disconnect,

  /// 고장
  breakdown;

  Color themeColorHandler(BuildContext context) {
    switch (this) {
      case DeviceState.working:
        return Theme.of(context).colorScheme.onTertiary; // 예시로 기본 색상 사용
      case DeviceState.available:
        return Theme.of(context).colorScheme.primaryContainer;
      case DeviceState.disconnect:
        return Theme.of(context).colorScheme.secondary;
      case DeviceState.breakdown:
        return Theme.of(context).colorScheme.onError;
    }
  }

  Color themeIconColorHandler(BuildContext context) {
    switch (this) {
      case DeviceState.working:
        return Theme.of(context).colorScheme.tertiary;
      case DeviceState.available:
        return Theme.of(context).colorScheme.primary;
      case DeviceState.disconnect:
        return Theme.of(context).colorScheme.onSecondary;
      case DeviceState.breakdown:
        return Theme.of(context).colorScheme.error;
    }
  }

  String themeTextHandler() {
    switch (this) {
      case DeviceState.working:
        return "작동중";
      case DeviceState.available:
        return "사용 가능";
      case DeviceState.disconnect:
        return "연결 끊김";
      case DeviceState.breakdown:
        return "고장";
    }
  }
}
