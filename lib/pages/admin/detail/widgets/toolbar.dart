import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../service/navigator.dart';
import '../../../../template/color.dart';
import '../../../../template/typhography.dart';

Widget toolbarDetail(BuildContext context) {
  var maxWidth = MediaQuery.of(context).size.width;
  var maxHeight = MediaQuery.of(context).size.height;

  return Row(
    children: [
      IconButton(
        onPressed: () {
          Get().back(context);
          if (defaultTargetPlatform == TargetPlatform.android) {
            SystemChrome.setSystemUIOverlayStyle(
              SystemUiOverlayStyle(
                  systemNavigationBarColor: blue,
                  systemNavigationBarIconBrightness: Brightness.light),
            );
          }
        },
        icon: Icon(
          Icons.arrow_back_ios_new_rounded,
          color: black,
        ),
      ),
      SizedBox(
        width: maxWidth / 5,
      ),
      Text(
        'Add Details',
        style: widgetText,
      ),
    ],
  );
}
