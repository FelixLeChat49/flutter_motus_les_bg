import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';

import '../dataSources/firestore/word_firestore.dart';
import '../dataSources/local/word_hive.dart';
import '../entities/word.dart';

class WordRepository {
  static WordRepository? _instance;
  static WordHive? _wordHive;
  static WordFirestore? _wordFirestore;

  static Future<WordRepository> getInstance() async {
    if (_instance == null) {
      _wordHive = await WordHive.getInstance();
      _instance = WordRepository._();
      _wordFirestore = WordFirestore.getInstance();
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

  Future<List<Word>> getAllFromFirestore() async{

    QuerySnapshot<Word> words = await _wordFirestore!.getAll();

    return words.docs.map((e) => e.data()).toList();
  }
  
  Future<void> insertWordFirestore(word) async {
    return await _wordFirestore!.insertWord(word);
  }
}
