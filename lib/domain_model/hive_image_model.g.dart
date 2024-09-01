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
      createdAt: fields[2] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, HivePhoto obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.image)
      ..writeByte(1)
      ..write(obj.categoryId)
      ..writeByte(2)
      ..write(obj.createdAt);
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
