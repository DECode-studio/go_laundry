import 'package:flutter/material.dart';
import 'package:go_laundry/service/date-formater.dart';

import '../../../../../service/navigator.dart';
import '../../../../../service/order.dart';
import '../../../../../template/color.dart';
import '../../../../../template/typhography.dart';

void confirmModal(
  BuildContext context,
  String orderId,
  String orderName,
  DateTime orderTime,
) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        child: SizedBox(
          height: 355,
          child: Stack(
            children: [
              Align(
                alignment: Alignment.bottomCenter,
                child: ModalBody(
                  orderId,
                  orderName,
                  orderTime,
                ),
              ),
              Align(
                alignment: Alignment.topRight,
                child: GestureDetector(
                  onTap: () => Get().back(context),
                  child: CircleAvatar(
                    radius: 25,
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
      );
    },
  );
}

class ModalBody extends StatefulWidget {
  final String orderId, orderName;
  final DateTime orderTime;

  ModalBody(this.orderId, this.orderName, this.orderTime, {Key? key})
      : super(key: key);

  @override
  State<ModalBody> createState() => _ModalBodyState();
}

class _ModalBodyState extends State<ModalBody> {
  var txt_name = TextEditingController();
  var txt_time = TextEditingController();

  @override
  void initState() {
    super.initState();

    txt_name.text = widget.orderName;
    txt_time.text = dateFormater(widget.orderTime);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxHeight: 350),
      padding: const EdgeInsets.only(
        top: 40,
        bottom: 20,
        left: 20,
        right: 20,
      ),
      width: double.infinity,
      decoration: BoxDecoration(
        color: white,
        borderRadius: BorderRadius.circular(30.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextFormField(
            controller: txt_name,
            readOnly: true,
            style: dataText,
            keyboardType: TextInputType.emailAddress,
            decoration: const InputDecoration(
              labelText: "Nama Pemesan",
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          TextFormField(
            controller: txt_time,
            readOnly: true,
            style: dataText,
            keyboardType: TextInputType.text,
            decoration: const InputDecoration(
              labelText: "Waktu Pemesanan",
            ),
          ),
          const Spacer(),
          Row(
            children: [
              Expanded(
                child: Container(
                  // width: double.infinity,
                  decoration: BoxDecoration(
                    color: white,
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(
                      width: 2,
                      color: blue,
                    ),
                  ),
                  child: TextButton(
                    onPressed: () {
                      Order().deleteOrder(context, widget.orderId).then(
                            (value) => Get().back(context),
                          );
                    },
                    child: Text(
                      'Delete',
                      style: widgetText_3,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Expanded(
                child: Container(
                  // width: double.infinity,
                  decoration: BoxDecoration(
                    color: blue,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: TextButton(
                    onPressed: () {
                      Order().confirmOrder(context, widget.orderId).then(
                            (value) => Get().back(context),
                          );
                    },
                    child: Text(
                      'Accept',
                      style: widgetText_2,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
