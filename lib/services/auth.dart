import 'package:firebase_auth/firebase_auth.dart';
import 'package:login_form_with_phone_auth/model/user.dart';
import 'package:login_form_with_phone_auth/services/database.dart';

class AuthMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Usser _userFromFirebase(User user) {
    return user != null ? Usser(uid: user.uid, email: user.email) : null;
  }

  // TODO register with email and password
  Future<User> registerWithEmailAndPassword(String name, String email,
      String phone, String address, String pwd) async {
    try {
      UserCredential credential = await _auth.createUserWithEmailAndPassword(
          email: email, password: pwd);
      User user = credential.user;
      await DatabaseMethods().addUserData(name, email, phone, address, pwd);
      // print(user.uid);
      return user;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // TODO sign in with email and password
  Future signInWithEmailAndPassword(String email, String pwd) async {
    try {
      UserCredential credential =
          await _auth.signInWithEmailAndPassword(email: email, password: pwd);
      User user = credential.user;
      if (user.emailVerified) {
        return _userFromFirebase(user);
      } else {
        print("Verify your Email First!");
        return null;
      }
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // TODO reset password
  Future resetForgotPassword(String email) async {
    return await _auth.sendPasswordResetEmail(email: email);
  }
}
