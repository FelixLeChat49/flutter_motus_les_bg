// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class GameAdapter extends TypeAdapter<Game> {
  @override
  final int typeId = 2;

  @override
  Game read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Game(
      startDate: fields[0] as DateTime?,
      player: fields[2] as User?,
    )
      ..endDate = fields[1] as DateTime?
      ..score = fields[3] as double?
      ..tries = (fields[4] as List?)?.cast<String>()
      ..limitTries = fields[5] as int;
  }

  @override
  void write(BinaryWriter writer, Game obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.startDate)
      ..writeByte(1)
      ..write(obj.endDate)
      ..writeByte(2)
      ..write(obj.player)
      ..writeByte(3)
      ..write(obj.score)
      ..writeByte(4)
      ..write(obj.tries)
      ..writeByte(5)
      ..write(obj.limitTries);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GameAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
