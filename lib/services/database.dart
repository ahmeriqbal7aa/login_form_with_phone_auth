import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseMethods {
  /// TODO collection reference
  final CollectionReference usersCollection =
      FirebaseFirestore.instance.collection('Login_with_Phone_Auth_Users');

  /// add user data
  Future<void> addUserData(
    String name,
    String email,
    String phone,
    String address,
    String pwd,
  ) async {
    return await usersCollection.doc(phone).set({
      'Name': name,
      'Email': email,
      'Phone': phone,
      'Address': address,
      'Password': pwd,
    });
  }

  /// Get user record using Email
  getUserByUserEmail(String userEmail) {
    try {
      return usersCollection.where('Email', isEqualTo: userEmail).get();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
