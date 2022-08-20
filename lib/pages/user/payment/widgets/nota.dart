import 'package:flutter/material.dart';

import '../../../../template/color.dart';
import '../../../../template/typhography.dart';
import '../../../../widgets/logo.dart';

Widget notaPayment(
  BuildContext context,
  String orderName,
  String orderTime,
  String orderTake,
  String orderMass,
  String orderPermass,
  String orderPrice,
  String orderAddress,
) {
  var maxHeight = MediaQuery.of(context).size.height;
  var maxWidth = MediaQuery.of(context).size.width;

  return SizedBox(
    width: maxWidth,
    child: Column(
      children: [
        logoImage(90, 90),
        Text(
          'Go-Laundry',
          style: headerText,
        ),
        Divider(
          color: black,
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Nama',
                  style: labelText,
                ),
                Text(
                  'Pesan',
                  style: labelText,
                ),
                Text(
                  'Ambil',
                  style: labelText,
                ),
                Text(
                  'Jenis',
                  style: labelText,
                ),
                Text(
                  'Berat',
                  style: labelText,
                ),
                Text(
                  'Harga/Kg',
                  style: labelText,
                ),
                Text(
                  'Alamat',
                  style: labelText,
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      ' : ',
                      style: labelText,
                    ),
                    Text(
                      orderName,
                      style: dataText,
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      ' : ',
                      style: labelText,
                    ),
                    Text(
                      orderTime,
                      style: dataText,
                    )
                  ],
                ),
                Row(
                  children: [
                    Text(
                      ' : ',
                      style: labelText,
                    ),
                    Text(
                      orderTake,
                      style: dataText,
                      overflow: TextOverflow.fade,
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      ' : ',
                      style: labelText,
                    ),
                    Text(
                      "Laundry",
                      style: dataText,
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      ' : ',
                      style: labelText,
                    ),
                    Text(
                      orderMass,
                      style: dataText,
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      ' : ',
                      style: labelText,
                    ),
                    Text(
                      orderPermass,
                      style: dataText,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      ' : ',
                      style: labelText,
                    ),
                    SizedBox(
                      width: maxWidth - 233,
                      height: 100,
                      child: Text(
                        orderAddress,
                        overflow: TextOverflow.fade,
                        textAlign: TextAlign.justify,
                        style: dataText,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Divider(
          color: black,
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'Total',
              style: labelText,
            ),
            Text(
              ' : ',
              style: labelText,
            ),
            Text(
              orderPrice,
              style: dataText,
            ),
          ],
        ),
      ],
    ),
  );
}
