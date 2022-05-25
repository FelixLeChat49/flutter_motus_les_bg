import 'package:hive/hive.dart';

part 'user.g.dart';

@HiveType(typeId: 3)
class Player {
  @HiveField(0)
  String? pseudo;

  @HiveField(1)
  String? email;

  @HiveField(2)
  String? password;

  @HiveField(3)
  double? score;

  Player({required this.pseudo, required this.email, required this.password});
}
