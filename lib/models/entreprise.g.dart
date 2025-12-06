// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'entreprise.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class EntrepriseAdapter extends TypeAdapter<Entreprise> {
  @override
  final int typeId = 2;

  @override
  Entreprise read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Entreprise(
      nom: fields[0] as String,
      description: fields[1] as String,
      ville: fields[2] as String,
      image: fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Entreprise obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.nom)
      ..writeByte(1)
      ..write(obj.description)
      ..writeByte(2)
      ..write(obj.ville)
      ..writeByte(3)
      ..write(obj.image);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is EntrepriseAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
