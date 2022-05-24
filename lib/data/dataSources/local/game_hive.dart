import 'package:flutter_motus/data/entities/game.dart';
import 'package:hive_flutter/hive_flutter.dart';
// Utilisation du model Singleton
class GameHive {
  static GameHive? _instance;
  static Box<Game>? _box;

  static Future<GameHive> getInstance() async {
    if(_instance == null){
      _box = await Hive.openBox('Game');
      _instance = GameHive._();
    }
    return _instance!;
  }

  GameHive._();

  Future<void> insertGame(Game game) async {
    await _box?.add(game);
    // await _box?.close();
    return;
  }
}