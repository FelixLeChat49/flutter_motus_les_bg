import 'package:hive/hive.dart';

part 'word.g.dart';

@HiveType(typeId: 1)
class Word {

  @HiveField(0)
  String? id;

  @HiveField(1)
  String text;

  @HiveField(2)
  DateTime? activeDate;


  Word(this.id, this.text, this.activeDate);

  Word.fromJson(Map<String,Object?> json)
    : this("",json['text']! as String, null);

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'text': text,
      'activeDate': activeDate
    };
  }
}