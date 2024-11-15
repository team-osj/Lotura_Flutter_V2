import 'package:hive/hive.dart';

part 'theme_option.g.dart';

@HiveType(typeId: 1)
enum ThemeOption {

  @HiveField(0)
  light,

  @HiveField(1)
  dark,

  @HiveField(2)
  system,
}
