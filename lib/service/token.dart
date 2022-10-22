import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class Token {
  void updateToken(
    String userId,
  ) async {
    try {
      FirebaseMessaging.instance.getToken().then((value) {
        String? token = value;

        var userToken = [
          token!.toString(),
        ];

        Map<String, Object?> getTokenData() {
          return {
            "userToken": FieldValue.arrayUnion(userToken),
          };
        }

        DocumentReference _ref =
            FirebaseFirestore.instance.collection('Users').doc(userId);

        _ref.update(getTokenData());
      });
    } catch (e) {
      print(e.toString());
    }
  }

  void deleteToken(
    String userId,
  ) async {
    try {
      FirebaseMessaging.instance.getToken().then((value) {
        String? token = value;

        var userToken = [
          token!.toString(),
        ];

        Map<String, Object?> getTokenData() {
          return {
            "userToken": FieldValue.arrayRemove(userToken),
          };
        }

        DocumentReference _ref =
            FirebaseFirestore.instance.collection('Users').doc(userId);

        _ref.update(getTokenData());
      });
    } catch (e) {
      print(e.toString());
    }
  }
}
