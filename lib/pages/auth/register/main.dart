import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_laundry/pages/user/home/main.dart';
import 'package:go_laundry/service/auth.dart';
import 'package:go_laundry/service/navigator.dart';
import 'package:go_laundry/service/token.dart';
import 'package:go_laundry/widgets/toast.dart';

import '../../../template/color.dart';
import '../../../template/typhography.dart';

class registerPage extends StatefulWidget {
  registerPage({Key? key}) : super(key: key);

  @override
  State<registerPage> createState() => _registerPageState();
}

class _registerPageState extends State<registerPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  bool _passwordVisible = true;

  var txt_name = TextEditingController();
  var txt_email = TextEditingController();
  var txt_phone = TextEditingController();
  var txt_password = TextEditingController();
  var txt_confirm_password = TextEditingController();

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
              controller: txt_name,
              style: dataText,
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(
                labelText: "Name",
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            TextFormField(
              controller: txt_email,
              style: dataText,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                labelText: "Email address",
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            TextFormField(
              controller: txt_phone,
              style: dataText,
              keyboardType: TextInputType.phone,
              decoration: const InputDecoration(
                labelText: "Phone Number",
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            TextFormField(
              controller: txt_password,
              style: dataText,
              keyboardType: TextInputType.text,
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
              height: 40,
            ),
            TextFormField(
              controller: txt_confirm_password,
              style: dataText,
              keyboardType: TextInputType.text,
              obscureText: _passwordVisible,
              decoration: InputDecoration(
                labelText: "Confirm Password",
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
                  String name = txt_name.text;
                  String email = txt_email.text;
                  String phone = txt_phone.text;
                  String password = txt_password.text;
                  String c_password = txt_confirm_password.text;

                  if (name.isEmpty ||
                      email.isEmpty ||
                      phone.isEmpty ||
                      password.isEmpty ||
                      c_password.isEmpty) {
                    toast(context, "Data masih kosong\nSilahkan isi data !");
                  } else {
                    if (password == c_password) {
                      Auth()
                          .signUpWithEmail(name, email, phone, password)
                          .then((value) {
                        if (value == "Success") {
                          Token().updateToken(_auth.currentUser!.uid);

                          Get().push(context, userPage());

                          toast(
                              context, "Pendaftaran Sukses !\nSelamat datang");
                        } else {
                          toast(context,
                              "Pendaftaran gagal !\nSilahakn coba lagi !");
                        }
                      });
                    }
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
