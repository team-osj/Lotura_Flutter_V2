import 'package:lotura_v2/core/constants/lotura_style.dart';

enum DeviceType {
  /// 세탁기
  washer(
    icon: "$iconLaundryAsset/dryer_icon.svg",
    text: "세탁기",
    padding: 55.5
  ),

  /// 건조기
  dryer(
    icon: "$iconLaundryAsset/washer_icon.svg",
    text: "건조기",
    padding: 16.5
  );

  final String icon;
  final String text;
  final double padding;

  const DeviceType({
    required this.icon,
    required this.text,
    required this.padding,
  });
}
