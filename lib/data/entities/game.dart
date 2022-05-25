import 'package:flutter_motus/data/entities/player.dart';
import 'package:hive/hive.dart';

part 'game.g.dart';

@HiveType(typeId: 2)
class Game {
  @HiveField(0)
  DateTime? startDate;

  @HiveField(1)
  DateTime? endDate;

  @HiveField(2)
  Player? player;

  @HiveField(3)
  double? score;

  @HiveField(4)
  List<String>? tries;

  @HiveField(5)
  int limitTries = 5;

  Game({required this.startDate, required this.player});
}
