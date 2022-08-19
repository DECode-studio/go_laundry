import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_laundry/pages/admin/home/fragments/confirmed/main.dart';
import 'package:go_laundry/pages/admin/home/fragments/unconfirmed/main.dart';

import '../../../template/color.dart';
import '../../../template/typhography.dart';
import 'fragments/widgets/header.dart';

class adminPage extends StatefulWidget {
  adminPage({Key? key}) : super(key: key);

  @override
  State<adminPage> createState() => _adminPageState();
}

class _adminPageState extends State<adminPage> {
  var _currentIndex = 0;

  @override
  void initState() {
    super.initState();

    if (defaultTargetPlatform == TargetPlatform.android) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
            systemNavigationBarColor: blue,
            systemNavigationBarIconBrightness: Brightness.light),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkLight,
      body: SafeArea(
        child: Column(
          children: [
            headerUser(context),
            _currentIndex == 0 ? confirmedFragment() : unconfirmedFragment(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavyBar(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        backgroundColor: blue,
        selectedIndex: _currentIndex,
        showElevation: true,
        itemCornerRadius: 50,
        curve: Curves.easeIn,
        onItemSelected: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavyBarItem(
            icon: Icon(
              Icons.apps,
              color: _currentIndex == 0 ? blue : white,
            ),
            title: Text(
              'Confimed',
              style: dataText_2,
            ),
            activeColor: white,
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            icon: Icon(
              Icons.newspaper,
              color: _currentIndex == 0 ? white : blue,
            ),
            title: Text(
              'Unconfirmed',
              style: dataText_2,
            ),
            activeColor: white,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
