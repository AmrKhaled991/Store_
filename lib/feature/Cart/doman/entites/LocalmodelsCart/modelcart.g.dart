// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'modelcart.dart';

// **************************************************************************

// TypeAdapterGenerator

// **************************************************************************

class ModelcartAdapter extends TypeAdapter<Modelcart> {
  @override
  final int typeId = 1;

  @override
  Modelcart read(BinaryReader reader) {
    final numOfFields = reader.readByte();

    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };

    return Modelcart(
      image: fields[0] as String,
      quntity: fields[1] as int?,
      price: fields[2] as int?,
      titel: fields[3] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Modelcart obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.image)
      ..writeByte(1)
      ..write(obj.quntity)
      ..writeByte(2)
      ..write(obj.price)
      ..writeByte(3)
      ..write(obj.titel);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ModelcartAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
