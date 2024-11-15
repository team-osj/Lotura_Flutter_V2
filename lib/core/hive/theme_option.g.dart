// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'theme_option.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ThemeOptionAdapter extends TypeAdapter<ThemeOption> {
  @override
  final int typeId = 1;

  @override
  ThemeOption read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return ThemeOption.light;
      case 1:
        return ThemeOption.dark;
      case 2:
        return ThemeOption.system;
      default:
        return ThemeOption.light;
    }
  }

  @override
  void write(BinaryWriter writer, ThemeOption obj) {
    switch (obj) {
      case ThemeOption.light:
        writer.writeByte(0);
        break;
      case ThemeOption.dark:
        writer.writeByte(1);
        break;
      case ThemeOption.system:
        writer.writeByte(2);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ThemeOptionAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
