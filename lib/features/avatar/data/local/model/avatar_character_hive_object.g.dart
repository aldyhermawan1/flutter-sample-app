// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'avatar_character_hive_object.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AvatarCharacterHiveObjectAdapter
    extends TypeAdapter<AvatarCharacterHiveObject> {
  @override
  final int typeId = 1;

  @override
  AvatarCharacterHiveObject read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AvatarCharacterHiveObject(
      id: fields[0] as String,
      name: fields[1] as String,
      image: fields[2] as String,
      alternativeNames: (fields[3] as List).cast<String>(),
      nationality: fields[4] as String,
      ethnicity: fields[5] as String,
      born: fields[6] as String,
    );
  }

  @override
  void write(BinaryWriter writer, AvatarCharacterHiveObject obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.image)
      ..writeByte(3)
      ..write(obj.alternativeNames)
      ..writeByte(4)
      ..write(obj.nationality)
      ..writeByte(5)
      ..write(obj.ethnicity)
      ..writeByte(6)
      ..write(obj.born);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AvatarCharacterHiveObjectAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
