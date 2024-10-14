import 'package:hive/hive.dart';

part 'laundry_room_option.g.dart';

@HiveType(typeId: 0)
enum LaundryRoomOption {
  /// 남자 학교측
  @HiveField(0)
  maleSchool,
  /// 남자 기숙사측
  @HiveField(1)
  maleDormitory,
  /// 여자
  @HiveField(2)
  female,
}
