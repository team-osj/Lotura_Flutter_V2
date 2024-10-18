// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'window_option.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class WindowOptionAdapter extends TypeAdapter<WindowOption> {
  @override
  final int typeId = 1;

  @override
  WindowOption read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return WindowOption.apply;
      case 1:
        return WindowOption.laundry;
      default:
        return WindowOption.apply;
    }
  }

  @override
  void write(BinaryWriter writer, WindowOption obj) {
    switch (obj) {
      case WindowOption.apply:
        writer.writeByte(0);
        break;
      case WindowOption.laundry:
        writer.writeByte(1);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WindowOptionAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
