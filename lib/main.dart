import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:go_laundry/pages/start/main.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

  runApp(GoLaundry());
}

class GoLaundry extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Go Laundry',
      debugShowCheckedModeBanner: false,
      home: startPage(),
    );
  }
}
