import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_laundry/pages/user/home/main.dart';
import 'package:go_laundry/service/navigator.dart';

import '../pages/admin/home/main.dart';
import 'token.dart';

class Auth {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  void addUser(
    String userId,
    String userName,
    String userEmail,
    String userPhone,
  ) {
    try {
      var userToken = [];

      Map<String, dynamic>? getUserData() {
        return {
          "userId": userId,
          "userName": userName,
          "userEmail": userEmail,
          "userPhone": userPhone,
          "userCategory": "user",
          "userToken": FieldValue.arrayUnion(userToken),
        };
      }

      DocumentReference _ref =
          FirebaseFirestore.instance.collection('Users').doc(userId);

      _ref.set(getUserData());
    } catch (e) {
      print(e.toString());
    }
  }

  Future signUpWithEmail(
    String userName,
    String userEmail,
    String userPhone,
    String userPassword,
  ) async {
    try {
      UserCredential _result = await _auth.createUserWithEmailAndPassword(
        email: userEmail,
        password: userPassword,
      );

      User? user = _result.user;

      assert(user != null);
      assert(await user!.getIdToken() != null);

      addUser(
        user!.uid,
        userName,
        userEmail,
        userPhone,
      );

      return 'Success';
    } catch (e) {
      print(e.toString());

      return 'Failed';
    }
  }

  Future signInWithEmail(String userEmail, String userPassword) async {
    try {
      UserCredential _result = await _auth.signInWithEmailAndPassword(
          email: userEmail, password: userPassword);

      User? user = _result.user;

      assert(await user!.getIdToken() != null);

      return 'Success';
    } catch (e) {
      print(e.toString());

      return 'Failed';
    }
  }

  void checkUser(BuildContext context) async {
    try {
      bool? user;

      await FirebaseFirestore.instance
          .collection('Users')
          .doc(_auth.currentUser!.uid)
          .get()
          .then(
        (data) {
          data.data()!['userCategory'].toString() == "admin"
              ? Get().push(context, adminPage())
              : Get().push(context, userPage());
        },
      );
    } catch (e) {
      print(e.toString());
    }
  }

  Future signOut(BuildContext context) async {
    try {
      Token().deleteToken(_auth.currentUser!.uid);
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());

      return null;
    }
  }
}
