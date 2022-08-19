import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_laundry/service/auth.dart';
import 'package:go_laundry/template/typhography.dart';

import '../../../service/navigator.dart';
import '../../../service/token.dart';
import '../../../template/color.dart';
import '../../../widgets/toast.dart';
import '../../admin/home/main.dart';
import '../../user/home/main.dart';

class loginPage extends StatefulWidget {
  loginPage({Key? key}) : super(key: key);

  @override
  State<loginPage> createState() => _loginPageState();
}

class _loginPageState extends State<loginPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  bool _passwordVisible = true;

  var txt_email = TextEditingController();
  var txt_password = TextEditingController();

  @override
  void initState() {
    _passwordVisible = true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkLight,
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
          horizontal: 50,
        ),
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            TextFormField(
              controller: txt_email,
              style: dataText,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                labelText: "Email",
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            TextFormField(
              controller: txt_password,
              keyboardType: TextInputType.text,
              style: dataText,
              obscureText: _passwordVisible,
              decoration: InputDecoration(
                labelText: "Password",
                suffixIcon: IconButton(
                  icon: Icon(
                    _passwordVisible ? Icons.visibility : Icons.visibility_off,
                    color: blue,
                  ),
                  onPressed: () {
                    setState(() {
                      _passwordVisible = !_passwordVisible;
                    });
                  },
                ),
              ),
            ),
            const SizedBox(
              height: 150,
            ),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: blue,
                borderRadius: BorderRadius.circular(30),
              ),
              child: TextButton(
                onPressed: () {
                  String email = txt_email.text;
                  String password = txt_password.text;

                  if (email.isEmpty || password.isEmpty) {
                    toast(context, "Data masih kosong\nSilahkan isi data !");
                  } else {
                    Auth().signInWithEmail(email, password).then((value) {
                      if (value == "Success") {
                        Token().updateToken(_auth.currentUser!.uid);

                        Auth().checkUser(context);
                      } else {
                        toast(context, "Login gagal !\nSilahakn coba lagi !");
                      }
                    });
                  }
                },
                child: Text(
                  'Login',
                  style: widgetText_2,
                ),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
          ],
        ),
      ),
    );
  }
}
