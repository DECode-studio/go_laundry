import 'package:flutter/material.dart';
import 'package:go_laundry/pages/start/main.dart';
import 'package:go_laundry/service/auth.dart';
import 'package:go_laundry/service/navigator.dart';
import '../../../../template/color.dart';
import '../../../../template/typhography.dart';
import '../../../../widgets/logo.dart';

Widget headerUser(BuildContext context) {
  return Container(
    padding: const EdgeInsets.all(40),
    decoration: BoxDecoration(
      color: white,
      borderRadius: const BorderRadius.only(
        bottomRight: Radius.circular(30),
        bottomLeft: Radius.circular(30),
      ),
    ),
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            PopupMenuButton(
              onSelected: (result) {
                if (result == 1) {
                  Auth().signOut(context).then(
                        (value) => Get().push(
                          context,
                          startPage(),
                        ),
                      );
                }
              },
              itemBuilder: (context) => [
                PopupMenuItem(
                  value: 1,
                  child: Row(
                    children: [
                      const Icon(
                        Icons.logout,
                        color: Colors.black,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Log Out',
                        style: dataText,
                      )
                    ],
                  ),
                ),
              ],
              child: const Icon(
                Icons.menu_rounded,
                size: 35,
              ),
            ),
            logoImage(40, 40),
          ],
        ),
        Text(
          'Welcome Back',
          style: headerText,
        ),
        Text(
          'to Go-Laundry',
          style: headerText_2,
        ),
      ],
    ),
  );
}
