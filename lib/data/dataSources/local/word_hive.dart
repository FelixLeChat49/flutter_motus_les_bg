import 'package:hive/hive.dart';

import '../../entities/word.dart';

class WordHive {
  static WordHive? _instance;
  static Box<Word>? _box;

  static Future<WordHive> getInstance() async {

    if (_instance == null) {
      _box = await Hive.openBox('Word');
      _instance = WordHive._();
    }

    return _instance!;
  }

  WordHive._();

  Future<void> insertWord(Word word) async {
    await _box?.add(word);
    // await _box?.close();
    return;
  }

  Future<void> populateWithWord(List<String> strings) async {
    // Faire un map sur String pour transformer en word
    List<Word> words = strings.map((str){
      return Word(null,str,null);
    }).toList();
    await _box?.addAll(words);
    return;
  }

  List<Word>? getAllWords()  {
    return _box?.toMap().values.toList();
  }

  bool isEmpty(){
    return _box!.isEmpty;
  }
}