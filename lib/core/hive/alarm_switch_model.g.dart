// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'alarm_switch_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AlarmSwitchModelAdapter extends TypeAdapter<AlarmSwitchModel> {
  @override
  final int typeId = 1;

  @override
  AlarmSwitchModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AlarmSwitchModel(
      option: fields[0] as String,
      value: fields[1] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, AlarmSwitchModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.option)
      ..writeByte(1)
      ..write(obj.value);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AlarmSwitchModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
