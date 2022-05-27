import 'package:hive/hive.dart';

part 'player.g.dart';

@HiveType(typeId: 3)
class Player {
  @HiveField(0)
  String pseudo;

  @HiveField(1)
  String email;

  @HiveField(2)
  String? password;

  @HiveField(3)
  double? score;

  Player(this.pseudo, this.email, this.password, this.score);

  Player.fromJson(Map<String,Object?> json)
      : this(json['pseudo']! as String, json['email']! as String, json['password'] as String, null);

  Map<String, dynamic> toJson() {
    return {
      'pseudo': pseudo,
      'email': email,
      'password': password,
      'score': score
    };
  }
}
