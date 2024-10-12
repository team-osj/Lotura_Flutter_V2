import 'package:flutter/material.dart';
import 'package:lotura_v2/core/constants/lotura_style.dart';

enum DeviceState {
  available,

  /// 사용 가능
  working,

  /// 작동중
  disconnect,

  /// 연결 끊김
  breakdown,

  /// 고장
}

Map<DeviceState, List<Color>> deviceColor = {
  DeviceState.available: [LoturaColor.green10, LoturaColor.green20],
  DeviceState.working: [LoturaColor.main50, LoturaColor.main500],
  DeviceState.disconnect: [LoturaColor.gray50, LoturaColor.gray500],
  DeviceState.breakdown: [LoturaColor.red10, LoturaColor.red20],
};

Map<DeviceState, List<String>> deviceComment = {
  DeviceState.available: ["는\n현재 사용할 수 있어요!"],
  DeviceState.working: [
    "를\n알림 설정할까요?",
    "가 종료되면 알림을 드릴게요.",
    "의\n알림 설정을 해제하실 건가요?",
    "알림 설정을 해제하시면 종료 알림을 받으실 수 없습니다.",
  ],
  DeviceState.disconnect: [
    "는\n연결이 끊겨서 사용할 수 없어요.",
    "를 사용해 주세요.\n빠른 시일 내에 연결하여 사용 가능하도록 하겠습니다.",
  ],
  DeviceState.breakdown: [
    "는\n고장으로 인해 사용할 수 없어요.",
    "를 사용해 주세요.\n빠른 시일 내에 수리하여 사용 가능하도록 하겠습니다.",
  ],
};
