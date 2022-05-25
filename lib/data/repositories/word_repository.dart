import 'dart:math';

import '../dataSources/local/word_hive.dart';
import '../entities/word.dart';

class WordRepository {
  static WordRepository? _instance;
  static WordHive? _wordHive;

  static Future<WordRepository> getInstance() async {
    if (_instance == null) {
      _wordHive = await WordHive.getInstance();
      _instance = WordRepository._();
    }

    return _instance!;
  }

  // le constructeur
  WordRepository._();

  Future<Word> insertWord(Word word) async {
    await _wordHive?.insertWord(word);

    return word;
  }

  Future<void> populateDatabase(List<String> strings) async {
    await _wordHive?.populateWithWord(strings);
  }

  Word? getRandomWord() {
    List<Word>? words = _wordHive?.getAllWords();
    return words?[Random().nextInt(words.length)];
  }

  bool checkBoxisEmpty(){
    return _wordHive!.isEmpty();
  }
}
