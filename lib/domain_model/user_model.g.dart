// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserHiveAdapter extends TypeAdapter<UserHive> {
  @override
  final int typeId = 1;

  @override
  UserHive read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserHive(
      image: fields[0] as String?,
      email: fields[5] as String?,
      createdAt: fields[3] as DateTime,
      userName: fields[2] as String,
      name: fields[1] as String?,
      id: fields[4] as dynamic,
      bio: fields[6] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, UserHive obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.image)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.userName)
      ..writeByte(3)
      ..write(obj.createdAt)
      ..writeByte(4)
      ..write(obj.id)
      ..writeByte(5)
      ..write(obj.email)
      ..writeByte(6)
      ..write(obj.bio);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserHiveAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
