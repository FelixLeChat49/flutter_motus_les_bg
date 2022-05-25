import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_motus/data/entities/word.dart';
import 'package:flutter_motus/data/repositories/word_repository.dart';

class GameViewModel with ChangeNotifier {
  late Word _word;

  Word get word => _word;

  late List<String> _list;

  List<String> get list => _list;

  late String _randomWord;

  String get randomWord => _randomWord;

  Future<String> getRandomWord() async {
    loadDictionnary();
    int randomIndex = Random().nextInt(list.length);
    _randomWord = list.where((word) => word.length>5).elementAt(randomIndex);
    // notifyListeners();
    return _randomWord;
  }

  Future<void> loadDictionnary() async{
    String dico = await rootBundle.loadString('assets/files/dico.txt');
    _list = dico.split("\r\n").where((word) => word.length > 5).toList();
    // return list;
    notifyListeners();
  }
}