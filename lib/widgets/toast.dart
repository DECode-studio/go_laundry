import 'package:flutter/material.dart';

void toast(BuildContext context, String toastText) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(toastText),
    ),
  );
}
