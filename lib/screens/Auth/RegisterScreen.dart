// @dart=2.9

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:netflex/Widgets/HomePage/UserInput.dart';
import 'package:netflex/constants/Navigator.dart';
import 'package:netflex/constants/constants.dart';
import 'package:netflex/controller/AuthController.dart';
import 'package:velocity_x/velocity_x.dart';

class SignUpScreen extends StatefulWidget {
  static const String id = "SignUpScreen";

  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final usernameController = TextEditingController();
  final AuthController authController = Get.find();
  final String password = "Password";
  final String userName = "User name";
  final String email = "Email";
  bool spin = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('images/background.jpg'), fit: BoxFit.cover),
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
                  " Netflex"
                      .text
                      .size(60)
                      .semiBold
                      .color(kText_color)
                      .fontFamily('Netfont')
                      .make(),
                  20.heightBox,
                  "Sign up"
                      .text
                      .white
                      .semiBold
                      .color(kText_color)
                      .fontFamily('Netfont')
                      .center
                      .size(50)
                      .make(),
                  60.heightBox,
                  Username_Input(
                      controller: emailController,
                      content: email,
                      icon: Icon(
                        Icons.email,
                        color: kText_color,
                      )),
                  20.heightBox,
                  Username_Input(
                      controller: usernameController,
                      content: userName,
                      icon: Icon(Icons.drive_file_rename_outline,
                          color: kText_color)),
                  20.heightBox,
                  Username_Input(
                      controller: passwordController,
                      content: password,
                      icon: Icon(Icons.vpn_key, color: kText_color)),
                  10.heightBox,
                  Row(
                    children: [
                      300.widthBox,
                      TextButton(
                        onPressed: () async {
                          setState(() {
                            spin = true;
                          });
                          print(authController.email);
                          print(authController.password);
                          print(authController.userName);
                          final newUser = await authController.auth
                              .createUserWithEmailAndPassword(
                                  email: authController.email,
                                  password: authController.password);
                          try {
                            if (newUser != null) {
                              authController.putUsername(usernameController.text);
                              Navigator.pushNamed(
                                  context, SiteNavigation.LOGIN);
                            }
                          } catch (signUpError) {
                            Get.snackbar("Lỗi đăng ký", signUpError);
                          }
                        },
                        child: Container(
                          child: Center(
                            child: "Register".text.center.black.make(),
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
                      "Already have an account?".text.white.make(),
                      TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, SiteNavigation.LOGIN);
                          },
                          child: "Login".text.blue100.make()),
                      "now".text.white.make(),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
