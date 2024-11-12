// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hive_image_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HivePhotoAdapter extends TypeAdapter<HivePhoto> {
  @override
  final int typeId = 1;

  @override
  HivePhoto read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HivePhoto(
      image: fields[0] as String,
      categoryId: fields[1] as int?,
      categoryName: fields[2] as int?,
      id: fields[4] as dynamic,
      createdAt: fields[3] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, HivePhoto obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.image)
      ..writeByte(1)
      ..write(obj.categoryId)
      ..writeByte(2)
      ..write(obj.categoryName)
      ..writeByte(3)
      ..write(obj.createdAt)
      ..writeByte(4)
      ..write(obj.id);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HivePhotoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
