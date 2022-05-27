import 'package:cloud_firestore/cloud_firestore.dart';

import '../../entities/word.dart';

class WordFirestore {

  static FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  static WordFirestore? _instance;

  static late final _wordRef;

  WordFirestore._();

  static WordFirestore getInstance() {
    if (_instance == null) {
      _wordRef = _firebaseFirestore
          .collection('wordsVF')
          .withConverter<Word>(
            fromFirestore: (snapshot, _) => Word.fromJson(snapshot.data()!),
            toFirestore: (word, _) => word.toJson()
          );
    }
    _instance = WordFirestore._();
    return _instance!;
  }


    Future insertWord(Word word) async {
      await _wordRef.add(word);
    }

    Future<void> insertWordWithId(String id,Word word) {
      return _wordRef.doc(id).set(word);
    }

    Future<QuerySnapshot<Word>> searchWord(String text) async {
      return await _wordRef.where('text', isEqualTo: 1).get();
    }

    Future<void> deleteWord(String id) async {
      return await _wordRef.doc(id).delete();
    }

    /*
    Future<void> updateWord(Word word, String id) {

      return;
    }
    */

    Future<QuerySnapshot<Word>> getAll() async {
      return await _wordRef.where('activeDate',isEqualTo: null).get();
    }

    Future addAll(List<Word> words) async {
      words.forEach((element) {
        _wordRef.add(element);
      });
      return;
    }

  }
