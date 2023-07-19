import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intern_task/common.dart';
import 'package:intern_task/views/home_page.dart';
import 'package:uuid/uuid.dart';

class FirebaseController {
  void sendOrderToFirestore({
    required BuildContext context,
    required List<String> itemsName,
    required List<int> itemsCount,
  }) async {
    var orderId = const Uuid().v1();

    Map<String, dynamic> items = <String, dynamic>{
      itemsName[0]: itemsCount[0],
      itemsName[1]: itemsCount[1],
      itemsName[2]: itemsCount[2],
      itemsName[3]: itemsCount[3],
      itemsName[4]: itemsCount[4],
      itemsName[5]: itemsCount[5],
      itemsName[6]: itemsCount[6],
      itemsName[7]: itemsCount[7],
      itemsName[8]: itemsCount[8],
      itemsName[9]: itemsCount[9],
    };

    try {
      FirebaseFirestore.instance
          .collection("orders")
          .doc(orderId)
          .set(items)
          .whenComplete(() => {
                showSnackbar(context, "Order Send!"),
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return const HomePage();
                }))
              });
    } on FirebaseException catch (e) {
      showSnackbar(
        context,
        e.message!,
      );
    }
  }
}
