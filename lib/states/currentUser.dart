import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class CurrentUser extends ChangeNotifier {
  late String _uid;
  late String _email;

  String get getUid => _uid;
  String get getEmail => _email;

  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<bool> signUpUser(String email, String password) async {
    bool retVal = false;
    try {
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(email: email, password: password);

      if (userCredential.user != null) {
        _uid = userCredential.user!.uid;
        _email = userCredential.user!.email ?? '';
        retVal = true;
        notifyListeners();  // Notify listeners if needed to update UI
      }
    } catch (e) {
      print("Error signing up: $e");
    }
    return retVal;
  }

  Future<bool> loginUser(String email, String password) async {
    bool retVal = false;
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(email: email, password: password);

      if (userCredential.user != null) {
        _uid = userCredential.user!.uid;
        _email = userCredential.user!.email ?? '';
        retVal = true;
        notifyListeners();  // Notify listeners if needed to update UI
      }
    } catch (e) {
      print(e);
    }
    return retVal;
  }
}
