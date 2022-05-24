import '../dataSources/local/trash_hive.dart';
import '../entities/trash.dart';

class WordRepository {

  static WordRepository? _instance;
  static TrashHive? _trashHive;

  static Future<WordRepository> getInstance() async {

    if(_instance == null) {
      _trashHive = await TrashHive.getInstance();
      _instance = WordRepository._();
    }

    return _instance!;
  }

  // le constructeur
  WordRepository._();

  Future<Trash> insertTrash(Trash trash) async{

    await _trashHive?.insertTrash(trash);

    return trash;
  }

}