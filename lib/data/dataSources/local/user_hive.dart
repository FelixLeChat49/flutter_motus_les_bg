import 'package:flutter_motus/data/entities/user.dart';
import 'package:hive_flutter/hive_flutter.dart';
// Utilisation du model Singleton
class UserHive {
  static UserHive? _instance;
  static Box<Player>? _box;

  static Future<UserHive> getInstance() async {
    if(_instance == null){
      _box = await Hive.openBox('User');
      _instance = UserHive._();
    }
    return _instance!;
  }

  UserHive._();

  Future<void> insertUser(Player user) async {
    await _box?.add(user);
    // await _box?.close();
    return;
  }
}