import 'package:flutter/material.dart';

Widget logoImage(height, width) {
  return Image.asset(
    "assets/logo/go-laundry-icon.png",
    height: height.toDouble(),
    width: width.toDouble(),
  );
}

Widget laundryImage(height, width) {
  return Image.asset(
    "assets/images/laundry-icon.png",
    height: height.toDouble(),
    width: width.toDouble(),
  );
}
