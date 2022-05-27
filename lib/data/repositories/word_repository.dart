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
     List<Word> words = strings.map((e) {
      return Word.fromJson({
        'text' : e
      });
    }).toList();

     _wordFirestore!.addAll(words);
  }

  Future<Word?> getRandomWord() async {
    List<Word>? words = await getAllFromFirestore();
    return words[Random().nextInt(words.length)];
  }

  bool checkBoxisEmpty(){
    return _wordHive!.isEmpty();
  }

  Future<List<Word>> getAllFromFirestore() async{

    QuerySnapshot<Word> words = await _wordFirestore!.getAll();

    List<Word> list = words.docs.map((e) {
      String id = e.reference.id;
      return Word(id, e.data().text, e.data().activeDate);
    } ).toList();

    return list;
  }
  
  Future<void> insertWordFirestore(word) async {
    return await _wordFirestore!.insertWord(word);
  }

  Future<void> updateWord(String? id, Map<String, Object?> json) async {
    Word word = Word(id, json['text'].toString() , json['activeDate'] as DateTime?);
    await _wordFirestore?.insertWordWithId(id!, word);
  }
}
