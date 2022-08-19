import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../../../widgets/load.dart';
import '../widgets/card.dart';

class confirmedFragment extends StatefulWidget {
  confirmedFragment({Key? key}) : super(key: key);

  @override
  State<confirmedFragment> createState() => _confirmedFragmentState();
}

class _confirmedFragmentState extends State<confirmedFragment> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  CollectionReference? order_data;

  List<QueryDocumentSnapshot<Map<String, dynamic>>>? orderData;

  @override
  void initState() {
    super.initState();

    order_data = FirebaseFirestore.instance.collection('Order');
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: StreamBuilder(
          stream:
              order_data!.orderBy('orderTime', descending: true).snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
            return streamSnapshot.hasData
                ? ListView(
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      for (var i = 0; i < streamSnapshot.data!.docs.length; i++)
                        streamSnapshot.data!.docs[i]['orderConfirm']
                            ? cardOrder(
                                context,
                                streamSnapshot.data!.docs[i]['orderId'],
                                streamSnapshot.data!.docs[i]['orderName'],
                                streamSnapshot.data!.docs[i]['orderPrice'],
                                streamSnapshot.data!.docs[i]['orderMass'],
                                streamSnapshot.data!.docs[i]['orderConfirm'],
                                streamSnapshot.data!.docs[i]['orderTime']
                                    .toDate(),
                              )
                            : Container()
                    ],
                  )
                : loadPage(200.0);
          }),
    );
  }
}
