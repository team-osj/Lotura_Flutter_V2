// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'laundry_room_option.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LaundryRoomOptionAdapter extends TypeAdapter<LaundryRoomOption> {
  @override
  final int typeId = 0;

  @override
  LaundryRoomOption read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return LaundryRoomOption.maleSchool;
      case 1:
        return LaundryRoomOption.maleDormitory;
      case 2:
        return LaundryRoomOption.female;
      default:
        return LaundryRoomOption.maleSchool;
    }
  }

  @override
  void write(BinaryWriter writer, LaundryRoomOption obj) {
    switch (obj) {
      case LaundryRoomOption.maleSchool:
        writer.writeByte(0);
        break;
      case LaundryRoomOption.maleDormitory:
        writer.writeByte(1);
        break;
      case LaundryRoomOption.female:
        writer.writeByte(2);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LaundryRoomOptionAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
