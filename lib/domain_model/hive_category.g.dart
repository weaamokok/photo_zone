// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hive_category.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HiveCategoryAdapter extends TypeAdapter<HiveCategory> {
  @override
  final int typeId = 5;

  @override
  HiveCategory read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HiveCategory(
      categoryName: fields[0] as String?,
      folderColor: fields[1] as int,
      createdAt: fields[2] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, HiveCategory obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.categoryName)
      ..writeByte(1)
      ..write(obj.folderColor)
      ..writeByte(2)
      ..write(obj.createdAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HiveCategoryAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
