import 'package:flutter/material.dart';
import 'package:go_laundry/service/date-formater.dart';
import 'package:go_laundry/service/navigator.dart';
import 'package:go_laundry/service/order.dart';
import 'package:go_laundry/widgets/toast.dart';

import '../../../../template/color.dart';
import '../../../../template/typhography.dart';

void orderModal(
  BuildContext context,
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
                child: ModalBody(),
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
  ModalBody({Key? key}) : super(key: key);

  @override
  State<ModalBody> createState() => _ModalBodyState();
}

class _ModalBodyState extends State<ModalBody> {
  var txt_name = TextEditingController();
  var txt_time = TextEditingController(text: dateFormater(DateTime.now()));

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxHeight: 350),
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 40,
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
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: blue,
              borderRadius: BorderRadius.circular(30),
            ),
            child: TextButton(
              onPressed: () {
                if (txt_name.text.isEmpty) {
                  toast(context, "Nama Pemesan masih kosong");
                } else {
                  Order().addOrder(context, txt_name.text).then((value) {
                    if (value == "Success") {
                      Get().back(context);
                    }
                  });
                }
              },
              child: Text(
                'Pesan',
                style: widgetText_2,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
