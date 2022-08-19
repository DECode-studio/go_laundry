import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:go_laundry/pages/user/payment/widgets/nota.dart';
import 'package:go_laundry/pages/user/payment/widgets/toolbar.dart';
import 'package:go_laundry/service/date-formater.dart';
import 'package:go_laundry/service/money-formater.dart';
import 'package:go_laundry/service/nota.dart';
import 'package:go_laundry/widgets/load.dart';

import '../../../template/color.dart';
import '../../../template/typhography.dart';
import 'widgets/header.dart';

class paymentPage extends StatefulWidget {
  final String orderId;
  paymentPage(this.orderId, {Key? key}) : super(key: key);

  @override
  State<paymentPage> createState() => _paymentPageState();
}

class _paymentPageState extends State<paymentPage> {
  Stream? dataOrder;

  @override
  void initState() {
    super.initState();

    dataOrder = FirebaseFirestore.instance
        .collection("Order")
        .doc(widget.orderId)
        .snapshots();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkLight,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: darkLight,
        automaticallyImplyLeading: false,
        title: toolbarPayment(context),
      ),
      body: SafeArea(
        child: StreamBuilder(
            stream: dataOrder,
            builder: (context, AsyncSnapshot snapshot) {
              return Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 50,
                  vertical: 30,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    headerPayment(),
                    Expanded(
                      child: ListView(
                        shrinkWrap: true,
                        physics: const BouncingScrollPhysics(),
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                              vertical: 10,
                              horizontal: 20,
                            ),
                            decoration: BoxDecoration(
                              color: white,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: snapshot.hasData
                                ? notaPayment(
                                    snapshot,
                                    snapshot.data.data()["orderName"],
                                    dateFormater_2(snapshot.data
                                        .data()["orderTime"]
                                        .toDate()),
                                    snapshot.data.data()["orderTake"] != null
                                        ? dateFormater_2(snapshot.data
                                            .data()["orderTake"]
                                            .toDate())
                                        : "",
                                    "${snapshot.data.data()["orderMass"]} Kg",
                                    moneyFormater(
                                        snapshot.data.data()["orderPermass"]),
                                    moneyFormater(
                                        snapshot.data.data()["orderPrice"]),
                                  )
                                : loadPage(200.0),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: blue,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: TextButton(
                        onPressed: () {
                          Nota().create(context, snapshot);
                        },
                        child: Text(
                          'Print to PDF',
                          style: widgetText_2,
                        ),
                      ),
                    )
                  ],
                ),
              );
            }),
      ),
    );
  }
}
