import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_laundry/pages/admin/home/main.dart';
import 'package:go_laundry/pages/auth/main.dart';
import 'package:go_laundry/pages/start/widgets/header.dart';
import 'package:go_laundry/pages/start/widgets/vector.dart';
import 'package:go_laundry/pages/user/home/main.dart';
import 'package:go_laundry/service/navigator.dart';
import 'package:go_laundry/template/color.dart';

import '../../service/auth.dart';

class startPage extends StatefulWidget {
  startPage({Key? key}) : super(key: key);

  @override
  State<startPage> createState() => _startPageState();
}

class _startPageState extends State<startPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  void initState() {
    super.initState();

    if (defaultTargetPlatform == TargetPlatform.android) {
      SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
          systemNavigationBarColor: blue,
          systemNavigationBarIconBrightness: Brightness.light));
    }

    Timer(
      const Duration(seconds: 5),
      () => _auth.currentUser == null
          ? Get().push(context, authPage())
          : Auth().checkUser(context),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blue,
      body: Container(
        width: double.infinity,
        child: Stack(
          children: [
            headerStart(),
            vectorImagea(),
          ],
        ),
      ),
    );
  }
}
