import 'package:hive/hive.dart';

@HiveType(typeId: 3)
class User {
  @HiveField(0)
  String? pseudo;

  @HiveField(1)
  String? email;

  @HiveField(2)
  String? password;

  @HiveField(3)
  double? score;

  User({required this.pseudo, required this.email, required this.password});
}
