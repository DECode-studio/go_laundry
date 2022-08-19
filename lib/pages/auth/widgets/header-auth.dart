import 'package:flutter/material.dart';
import '../../../template/color.dart';
import '../../../template/typhography.dart';
import '../../../widgets/logo.dart';

Widget headerAuth() {
  return Container(
    width: double.infinity,
    padding: const EdgeInsets.symmetric(vertical: 20),
    color: white,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        logoImage(120, 120),
        const SizedBox(
          height: 10,
        ),
        Text(
          "Go-Laundry",
          style: headerText,
        )
      ],
    ),
  );
}
