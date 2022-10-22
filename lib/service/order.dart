import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_laundry/service/date-formater.dart';
import 'package:go_laundry/widgets/toast.dart';

class Order {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future addOrder(
      BuildContext context, String orderName, String orderAddress) async {
    try {
      String orderId = "Order.ID_${dateId()}";

      Map<String, Object?> setOrder() {
        return {
          "orderId": orderId,
          "orderName": orderName,
          "orderEmail": _auth.currentUser!.email,
          "orderTime": FieldValue.serverTimestamp(),
          "orderMass": 0.0,
          "orderPermass": 0.0,
          "orderAddress": orderAddress,
          "orderPrice": 0.0,
          "orderConfirm": false,
        };
      }

      DocumentReference _ref =
          FirebaseFirestore.instance.collection('Order').doc(orderId);

      _ref.set(setOrder());

      toast(context, "Order success");

      return 'Success';
    } catch (e) {
      toast(context, "Order failed ! :\n $e");

      return 'Failed';
    }
  }

  Future confirmOrder(
    BuildContext context,
    String orderId,
  ) async {
    try {
      Map<String, Object?> setOrder() {
        return {
          "orderConfirm": true,
        };
      }

      DocumentReference _ref =
          FirebaseFirestore.instance.collection('Order').doc(orderId);

      _ref.update(setOrder());

      toast(context, "Order confirmed");

      return 'Success';
    } catch (e) {
      toast(context, "Order not confirmed ! :\n $e");

      return 'Failed';
    }
  }

  Future updateOrder(
    BuildContext context,
    String orderId,
    double orderMass,
    double orderPermass,
    String orderTake,
    double orderPrice,
  ) async {
    try {
      DateTime takeTime = DateTime.parse(orderTake);

      Map<String, Object?> setOrder() {
        return {
          "orderMass": orderMass,
          "orderPermass": orderPermass,
          "orderTake": takeTime,
          "orderPrice": orderPrice,
          "orderConfirm": true,
        };
      }

      DocumentReference _ref =
          FirebaseFirestore.instance.collection('Order').doc(orderId);

      _ref.update(setOrder());

      toast(context, "Order updated");

      return 'Success';
    } catch (e) {
      toast(context, "Order not updated ! :\n $e");

      return 'Failed';
    }
  }

  Future deleteOrder(BuildContext context, String orderId) async {
    try {
      FirebaseFirestore.instance.collection('Order').doc(orderId).delete();

      toast(context, "Order deleted");

      return 'Success';
    } catch (e) {
      toast(context, "Order not deleted ! :\n $e");

      return 'Failed';
    }
  }
}
