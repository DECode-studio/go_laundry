import 'package:flutter/material.dart';

import '../../../../service/navigator.dart';
import '../../../../template/color.dart';
import '../../../../template/typhography.dart';

Widget toolbarPayment(BuildContext context) {
  var maxWidth = MediaQuery.of(context).size.width;
  var maxHeight = MediaQuery.of(context).size.height;

  return Row(
    children: [
      IconButton(
        onPressed: () => Get().back(context),
        icon: Icon(
          Icons.arrow_back_ios_new_rounded,
          color: black,
        ),
      ),
      SizedBox(
        width: maxWidth / 5,
      ),
      Text(
        'Checkout',
        style: widgetText,
      ),
    ],
  );
}
