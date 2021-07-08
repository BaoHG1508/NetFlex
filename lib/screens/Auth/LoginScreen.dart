// @dart=2.9

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:netflex/Widgets/HomePage/HomePage/Netflex.dart';
import 'package:netflex/Widgets/HomePage/UserInput.dart';
import 'package:netflex/constants/Navigator.dart';
import 'package:netflex/constants/constants.dart';
import 'package:netflex/controller/AuthController.dart';
import 'package:velocity_x/velocity_x.dart';

class LoginScreen extends StatefulWidget {
  static const id = "loginScreen";

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final AuthController authController = Get.find();
  final String password = "Password";
  final String email = "Email";
  var spin = false;

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: spin,
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('images/background.jpg'),
                  fit: BoxFit.cover),
              color: kApp_color,
            ),
            child: Container(
              height: MediaQuery.of(context).size.height - 50,
              width: MediaQuery.of(context).size.width - 20,
              color: Colors.black.withOpacity(0.8),
              child: SafeArea(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      100.heightBox,
                      "Netflex"
                          .text
                          .size(60)
                          .semiBold
                          .color(kText_color)
                          .fontFamily('Netfont')
                          .make(),
                      20.heightBox,
                      "Log in"
                          .text
                          .white
                          .semiBold
                          .fontFamily("Netfont")
                          .color(kText_color)
                          .center
                          .size(50)
                          .make(),
                      60.heightBox,
                      Username_Input(
                          controller: emailController,
                          content: email,
                          icon: Icon(Icons.email)),
                      20.heightBox,
                      Username_Input(
                          controller: passwordController,
                          content: password,
                          icon: Icon(Icons.vpn_key)),
                      10.heightBox,
                      Row(
                        children: [
                          300.widthBox,
                          TextButton(
                            onPressed: () async {
                              setState(() {
                                spin = true;
                              });

                              try {
                                final user = await authController.auth.signInWithEmailAndPassword(email: emailController.text, password: passwordController.text);
                                if (user != null) {
                                  authController.email = emailController.text;
                                  print(authController.email);
                                  Navigator.pushNamed(
                                      context, SiteNavigation.HOME);
                                }
                              } on FirebaseException catch (e) {
                                setState(() {
                                  spin = false;
                                });
                                Get.snackbar("Lỗi đăng nhập", e.message.toString());
                              }
                            },
                            child: Container(
                              child: Center(
                                child: "Log in".text.center.black.make(),
                              ),
                              height: 35,
                              width: 70,
                              decoration: BoxDecoration(
                                  color: Colors.lightBlueAccent,
                                  borderRadius: BorderRadius.circular(5)),
                            ),
                          ),
                        ],
                      ),
                      10.heightBox,
                      Row(
                        children: [
                          90.widthBox,
                          "Don't have an account?".text.white.make(),
                          TextButton(
                              onPressed: () {
                                setState(() {
                                  Navigator.pushNamed(
                                      context, SiteNavigation.REGISTER);
                                });
                              },
                              child: "Register".text.blue100.make()),
                          "now".text.white.make(),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          )),
    );
  }
}
