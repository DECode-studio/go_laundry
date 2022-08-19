import 'package:flutter/material.dart';
import 'package:go_laundry/pages/user/payment/main.dart';
import 'package:go_laundry/service/navigator.dart';
import 'package:go_laundry/service/order.dart';

import '../../../../service/date-formater.dart';
import '../../../../service/money-formater.dart';
import '../../../../template/color.dart';
import '../../../../template/typhography.dart';
import '../../../../widgets/logo.dart';

Widget cardOrder(
  BuildContext context,
  String orderId,
  String orderName,
  double orderPrice,
  double orderMass,
  bool orderConfirm,
  DateTime orderTime,
) {
  return Column(
    children: [
      const SizedBox(
        height: 20,
      ),
      GestureDetector(
        onTap: () {
          Get().to(
            context,
            paymentPage(orderId),
          );
        },
        child: SizedBox(
          height: 106,
          child: Stack(
            children: [
              Align(
                alignment: Alignment.bottomLeft,
                child: Container(
                  height: 106,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: white,
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.1),
                        spreadRadius: 5,
                        blurRadius: 10,
                        offset:
                            const Offset(0, 0), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      laundryImage(55, 55),
                      const SizedBox(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            orderName,
                            style: dataText,
                          ),
                          Row(
                            children: [
                              Text(
                                moneyFormater(orderPrice),
                                style: dataText_2,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                '$orderMass Kg',
                                style: dataText_3,
                              ),
                            ],
                          ),
                          Text(
                            dateFormater(orderTime),
                            style: timeText,
                          ),
                        ],
                      ),
                      const Spacer(),
                      orderConfirm
                          ? CircleAvatar(
                              radius: 15,
                              backgroundColor: lightGreen,
                              child: Icon(
                                Icons.check,
                                color: darkGreen,
                              ),
                            )
                          : CircleAvatar(
                              radius: 15,
                              backgroundColor: darkLight,
                              child: Icon(
                                Icons.timelapse,
                                color: grey,
                              ),
                            ),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topRight,
                child: GestureDetector(
                  onTap: () {
                    Order().deleteOrder(context, orderId);
                  },
                  child: CircleAvatar(
                    radius: 15,
                    backgroundColor: pink,
                    child: Icon(
                      Icons.close,
                      color: maroon,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ],
  );
}
