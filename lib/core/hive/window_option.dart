import 'package:hive/hive.dart';

part 'window_option.g.dart';

@HiveType(typeId: 1)
enum WindowOption {
  /// 내 세탁실
  @HiveField(0)
  apply,
  /// 세탁실 현황
  @HiveField(1)
  laundry
}
