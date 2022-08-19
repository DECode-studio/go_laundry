import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:go_laundry/template/color.dart';

Widget loadPage(size) {
  return Center(
    child: SpinKitSpinningLines(
      color: blue,
      size: size.toDouble(),
    ),
  );
}
