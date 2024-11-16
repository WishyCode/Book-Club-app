import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class CurrentUser extends ChangeNotifier {
  late String _uid;
  late String _email;

  String get getUid => _uid;
  String get getEmail => _email;

  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<String> signUpUser(String email, String password) async {
    String retVal = "Error";
    try {
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(email: email, password: password);

      if (userCredential.user != null) {
        _uid = userCredential.user!.uid;
        _email = userCredential.user!.email ?? '';
        retVal = "Success";
        notifyListeners();  // Notify listeners if needed to update UI
      }
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case "email-already-in-use":
          retVal = "The email address is already in use.";
          break;
        case "invalid-email":
          retVal = "The email address is invalid.";
          break;
        case "weak-password":
          retVal = "The password is too weak.";
          break;
        default:
          retVal = "An undefined error occurred: ${e.message}";
      }
    } catch (e) {
      retVal = "An unexpected error occurred.";
    }
    return retVal;
  }

  Future<String> loginUserWithEmail(String email, String password) async {
    String retVal = "Error";
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(email: email, password: password);

      if (userCredential.user != null) {
        _uid = userCredential.user!.uid;
        _email = userCredential.user!.email ?? '';
        retVal = "Success";
        notifyListeners();  // Notify listeners if needed to update UI
      }
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case "user-not-found":
          retVal = "No user found with this email.";
          break;
        case "wrong-password":
          retVal = "The password is incorrect.";
          break;
        default:
          retVal = "An error occurred: ${e.message}";
      }
    } catch (e) {
      retVal = "An unexpected error occurred.";
    }
    return retVal;
  }
}