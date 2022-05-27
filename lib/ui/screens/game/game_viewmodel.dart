import 'package:diacritic/diacritic.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_motus/data/entities/word.dart';
import 'package:flutter_motus/data/repositories/word_repository.dart';

class GameViewModel with ChangeNotifier {
  late Word _word;

  Word get word => _word;

  late List<String> _list;

  List<String> get list => _list;

  late Word? _randomWord;

  Word? get randomWord => _randomWord;

  Future<String> getRandomWord() async {
    WordRepository wordRepository = await WordRepository.getInstance();
    if (wordRepository.checkBoxisEmpty()) {
      await loadDictionnary();
    }
      _randomWord = await wordRepository.getRandomWord();

    // Ajouter dans la trash !
    return removeDiacritics(_randomWord!.text).toUpperCase();
  }

  Future<void> loadDictionnary() async {
    WordRepository wordRepository = await WordRepository.getInstance();
    String dico = await rootBundle.loadString('assets/files/dico.txt');
    _list = dico.split("\r\n").where((word) => word.length > 5).toList();
    wordRepository.populateDatabase(_list);
    notifyListeners();
  }

  Future<void> createWord(Word word) async {
    WordRepository wordRepository = await WordRepository.getInstance();
    wordRepository.insertWord(word);
  }
}
