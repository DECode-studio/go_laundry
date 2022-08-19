import 'package:flutter/material.dart';
import 'package:go_laundry/template/color.dart';
import 'package:go_laundry/template/typhography.dart';

Widget headerStart() {
  return Container(
    width: double.infinity,
    padding: const EdgeInsets.all(50),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 35,
              backgroundColor: white,
              child: Image.asset(
                'assets/logo/go-laundry-icon.png',
                height: 65,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              'Go-\nLaundry',
              style: logoText,
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          'Laundry for\nEveryone',
          style: bannerText,
        ),
      ],
    ),
  );
}
