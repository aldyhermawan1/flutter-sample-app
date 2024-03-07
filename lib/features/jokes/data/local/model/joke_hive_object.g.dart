// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'joke_hive_object.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class JokeHiveObjectAdapter extends TypeAdapter<JokeHiveObject> {
  @override
  final int typeId = 1;

  @override
  JokeHiveObject read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return JokeHiveObject(
      id: fields[0] as String,
      type: fields[1] as String,
      setup: fields[2] as String,
      punchline: fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, JokeHiveObject obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.type)
      ..writeByte(2)
      ..write(obj.setup)
      ..writeByte(3)
      ..write(obj.punchline);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is JokeHiveObjectAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
