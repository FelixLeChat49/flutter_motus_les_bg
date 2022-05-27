import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../entities/player.dart';

class UserFirestore {

  static UserFirestore? _instance;

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  static FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  static late final _playerRef;

  static UserFirestore getInstance() {
    if(_instance == null) {
      _playerRef = _firebaseFirestore
          .collection('players')
          .withConverter<Player>(
          fromFirestore: (snapshot, _) => Player.fromJson(snapshot.data()!),
          toFirestore: (player, _) => player.toJson()
      );
    }

    _instance = UserFirestore._();
    return _instance!;
  }

  UserFirestore._();

  Future<UserCredential> signInWithCredentials({required String email, required String password}) async {
    UserCredential userCredential = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password
    );

    return userCredential;
  }

  Future<UserCredential> signUp({required String email, required String password}) async {

    UserCredential userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password
    );

    insertPlayer(
        Player(userCredential.user!.email!.split("@").first,
            userCredential.user!.email!,
            null,
            0)
    );
    return userCredential;
  }

  Future insertPlayer(Player player) async {
    await _playerRef.add(player);
    return;
  }


  // Fonction is connected
}



