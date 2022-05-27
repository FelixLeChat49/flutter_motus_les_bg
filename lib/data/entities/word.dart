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

  Word.fromJson(Map<String,Object?> json)
    : this(json['id']! as int, json['text']! as String, json['activeDate']! as DateTime);

  Map<String, dynamic> toJson(Word word) {
    return {
      'id': word.id,
      'text': word.text,
      'activeDate': word.activeDate
    };
  }
}