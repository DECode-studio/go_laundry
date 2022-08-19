import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:date_format/date_format.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_laundry/pages/admin/detail/widgets/toolbar.dart';
import 'package:go_laundry/service/date-formater.dart';
import 'package:go_laundry/service/money-formater.dart';
import 'package:go_laundry/service/order.dart';
import 'package:go_laundry/widgets/toast.dart';

import '../../../template/color.dart';
import '../../../template/typhography.dart';

class detailPage extends StatefulWidget {
  final String orderId;
  detailPage(this.orderId, {Key? key}) : super(key: key);

  @override
  State<detailPage> createState() => _detailPageState();
}

class _detailPageState extends State<detailPage> {
  var txt_name = TextEditingController();
  var txt_time = "";
  var cb_time = TextEditingController();
  var txt_mass = TextEditingController();
  var txt_permass = TextEditingController();
  var txt_price = TextEditingController();

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

    FirebaseFirestore.instance
        .collection("Order")
        .doc(widget.orderId)
        .get()
        .then(
      (data) {
        setState(() {
          txt_name.text = data.data()!['orderName'].toString();
          txt_time = data.data()!['orderTake'].toString();
          cb_time.text = data.data()!['orderTake'].toString();
          txt_mass.text = data.data()!['orderMass'].toString();
          txt_permass.text = data.data()!['orderPermass'].toString();
          txt_price.text = data.data()!['orderPrice'].toString();
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkLight,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: darkLight,
        automaticallyImplyLeading: false,
        title: toolbarDetail(context),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        margin: const EdgeInsets.only(top: 30),
        decoration: BoxDecoration(
            color: white,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            )),
        child: ListView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.all(30),
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
            DateTimePicker(
              controller: cb_time,
              // initialValue: '',
              firstDate: DateTime(2000),
              lastDate: DateTime(2100),
              decoration: const InputDecoration(
                labelText: "Waktu Pengambilan",
              ),
              style: dataText,
              onChanged: (val) {
                setState(() {
                  txt_time = timestampFormater(val);
                });
              },
            ),
            const SizedBox(
              height: 40,
            ),
            TextFormField(
              controller: txt_mass,
              style: dataText,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Berat",
                hintText: '0.0',
                // show kg
                suffixText: 'Kg',
              ),
              onChanged: (value) {
                setState(() {
                  var price = ((value.isNotEmpty ? double.parse(value) : 0) *
                      double.parse(
                        txt_permass.text.replaceAll(RegExp(r'[^0-9]'), ''),
                      ));

                  txt_price.text = moneyFormater_2(price);
                });
              },
            ),
            const SizedBox(
              height: 40,
            ),
            TextFormField(
              controller: txt_permass,
              style: dataText,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Harga / Kg",
              ),
              inputFormatters: [
                CurrencyTextInputFormatter(
                  locale: 'id',
                  decimalDigits: 00,
                  symbol: 'Rp ',
                )
              ],
              onChanged: (value) {
                setState(() {
                  var price = ((value.isNotEmpty
                          ? double.parse(
                              value.replaceAll(RegExp(r'[^0-9]'), ''))
                          : 0) *
                      double.parse(txt_mass.text));

                  txt_price.text = moneyFormater_2(price);
                });
              },
            ),
            const SizedBox(
              height: 40,
            ),
            TextFormField(
              controller: txt_price,
              readOnly: true,
              style: dataText,
              decoration: const InputDecoration(
                labelText: "Total Harga",
              ),
              inputFormatters: [
                CurrencyTextInputFormatter(
                  locale: 'id',
                  decimalDigits: 00,
                  symbol: 'Rp ',
                )
              ],
            ),
            const SizedBox(
              height: 100,
            ),
            Container(
              // width: double.infinity,
              decoration: BoxDecoration(
                color: blue,
                borderRadius: BorderRadius.circular(30),
              ),
              child: TextButton(
                onPressed: () {
                  if (txt_time.toString() == "" ||
                      txt_mass.text == 0.toString() ||
                      txt_mass.text.isEmpty ||
                      txt_permass.text == 0.toString() ||
                      txt_permass.text.isEmpty ||
                      txt_price.text == 0.toString() ||
                      txt_price.text.isEmpty) {
                    toast(context,
                        'Data masih kosong !\nSilahkan isi semua data');
                  } else {
                    Order().updateOrder(
                      context,
                      widget.orderId,
                      double.parse(txt_mass.text),
                      double.parse(
                          txt_permass.text.replaceAll(RegExp(r'[^0-9]'), '')),
                      txt_time,
                      double.parse(
                          txt_price.text.replaceAll(RegExp(r'[^0-9]'), '')),
                    );
                  }
                },
                child: Text(
                  'Simpan',
                  style: widgetText_2,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
