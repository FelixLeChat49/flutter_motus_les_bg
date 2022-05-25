import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_motus/data/repositories/user_repository.dart';

class LoginViewModel with ChangeNotifier {

  User? _user;
  User? get user => _user;

  Future<void> signIn({required String email, required String password}) async {

    UserRepository userRepository = await UserRepository.getInstance();

    try {
      _user = await userRepository.signIn(email: email, password: password);
    } on Exception catch (_) {
      _user ??= await userRepository.signUp(email: email, password: password);
    }

    notifyListeners();

    return;
  }

}