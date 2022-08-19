import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_laundry/pages/auth/login/main.dart';
import 'package:go_laundry/pages/auth/register/main.dart';
import 'package:go_laundry/pages/auth/widgets/header-auth.dart';
import 'package:go_laundry/template/color.dart';

import '../../template/typhography.dart';

class authPage extends StatefulWidget {
  authPage({Key? key}) : super(key: key);

  @override
  State<authPage> createState() => _authPageState();
}

class _authPageState extends State<authPage> {
  int pageIndex = 0;

  @override
  void initState() {
    super.initState();

    if (defaultTargetPlatform == TargetPlatform.android) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          systemNavigationBarColor: white,
          systemNavigationBarIconBrightness: Brightness.dark,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget tabBar() {
      return Container(
        decoration: BoxDecoration(
          color: white,
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
        ),
        child: TabBar(
          onTap: (index) {
            setState(() {
              pageIndex = index;
            });
          },
          tabs: const [
            Tab(
              text: "Login",
            ),
            Tab(
              text: "SignUp",
            ),
          ],
          labelStyle: widgetText,
          labelColor: black,
        ),
      );
    }

    return Scaffold(
      backgroundColor: darkLight,
      body: SafeArea(
        child: DefaultTabController(
          length: 2,
          child: Column(
            children: [
              headerAuth(),
              tabBar(),
              Expanded(
                child: TabBarView(
                  children: [
                    loginPage(),
                    registerPage(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
