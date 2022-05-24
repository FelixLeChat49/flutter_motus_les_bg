import 'package:hive/hive.dart';

part 'word.g.dart';

@HiveType(typeId: 1)
class Word {

  @HiveField(0)
  int? id;

  @HiveField(1)
  String text;

  @HiveField(2)
  DateTime? activeDate;


  Word(this.id, this.text, this.activeDate);
}