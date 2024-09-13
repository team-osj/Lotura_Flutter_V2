import 'package:hive/hive.dart';

part 'alarm_switch_model.g.dart';

@HiveType(typeId: 1)
class AlarmSwitchModel extends HiveObject {
  @HiveField(0)
  String option;

  @HiveField(1)
  bool value;

  AlarmSwitchModel({
    required this.option,
    required this.value,
  });

  AlarmSwitchModel copyWith({
    String? option,
    bool? value,
  }) {
    return AlarmSwitchModel(
      option: option ?? this.option,
      value: value ?? this.value,
    );
  }
}
