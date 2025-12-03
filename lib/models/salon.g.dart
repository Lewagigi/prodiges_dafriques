// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'salon.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SalonStartupAfroAdapter extends TypeAdapter<SalonStartupAfro> {
  @override
  final int typeId = 1;

  @override
  SalonStartupAfro read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SalonStartupAfro(
      id: fields[0] as int,
      nom: fields[1] as String,
      description: fields[2] as String,
      date: fields[3] as String,
      ville: fields[4] as String,
      image: fields[5] as String,
    );
  }

  @override
  void write(BinaryWriter writer, SalonStartupAfro obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.nom)
      ..writeByte(2)
      ..write(obj.description)
      ..writeByte(3)
      ..write(obj.date)
      ..writeByte(4)
      ..write(obj.ville)
      ..writeByte(5)
      ..write(obj.image);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SalonStartupAfroAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
