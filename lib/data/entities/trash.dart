import 'package:flutter_motus/data/entities/word.dart';
import 'package:hive/hive.dart';

part 'trash.g.dart';

@HiveType(typeId: 4)
class Trash {

  @HiveField(0)
  List<Word>? words;

  Trash(this.words);
}