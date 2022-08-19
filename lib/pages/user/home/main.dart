import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_laundry/pages/user/home/widgets/order-modal.dart';
import 'package:go_laundry/widgets/load.dart';
import '../../../template/color.dart';
import 'widgets/card.dart';
import 'widgets/header.dart';

class userPage extends StatefulWidget {
  userPage({Key? key}) : super(key: key);

  @override
  State<userPage> createState() => _userPageState();
}

class _userPageState extends State<userPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  CollectionReference? order_data;

  List<QueryDocumentSnapshot<Map<String, dynamic>>>? orderData;

  @override
  void initState() {
    super.initState();

    if (defaultTargetPlatform == TargetPlatform.android) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
            systemNavigationBarColor: white,
            systemNavigationBarIconBrightness: Brightness.dark),
      );
    }

    order_data = FirebaseFirestore.instance.collection('Order');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkLight,
      body: SafeArea(
        child: Column(
          children: [
            headerUser(context),
            Expanded(
              child: StreamBuilder(
                  stream: order_data!
                      .orderBy('orderTime', descending: true)
                      // .where(
                      //   'orderEmail',
                      //   isEqualTo: _auth.currentUser!.email,
                      // )
                      .snapshots(),
                  builder:
                      (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
                    return streamSnapshot.hasData
                        ? ListView(
                            shrinkWrap: true,
                            physics: const BouncingScrollPhysics(),
                            padding: const EdgeInsets.symmetric(horizontal: 30),
                            children: [
                              const SizedBox(
                                height: 10,
                              ),
                              for (var i = 0;
                                  i < streamSnapshot.data!.docs.length;
                                  i++)
                                streamSnapshot.data!.docs[i]['orderEmail'] ==
                                        _auth.currentUser!.email
                                    ? cardOrder(
                                        context,
                                        streamSnapshot.data!.docs[i]['orderId'],
                                        streamSnapshot.data!.docs[i]
                                            ['orderName'],
                                        streamSnapshot.data!.docs[i]
                                            ['orderPrice'],
                                        streamSnapshot.data!.docs[i]
                                            ['orderMass'],
                                        streamSnapshot.data!.docs[i]
                                            ['orderConfirm'],
                                        streamSnapshot.data!.docs[i]
                                                    ['orderTime'] !=
                                                null
                                            ? streamSnapshot
                                                .data!.docs[i]['orderTime']
                                                .toDate()
                                            : DateTime.now(),
                                      )
                                    : Container()
                            ],
                          )
                        : loadPage(200.0);
                  }),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          orderModal(context);
        },
        child: Icon(
          Icons.add,
          color: white,
        ),
      ),
    );
  }
}
