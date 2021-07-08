// @dart=2.9

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:netflex/constants/constants.dart';
import 'package:netflex/controller/AuthController.dart';
import 'package:velocity_x/velocity_x.dart';

// ignore: camel_case_types
class Username_Input extends StatefulWidget {
  const Username_Input({
    Key key,
    @required this.controller,
    @required this.content,
    @required this.icon,
  }) : super(key: key);

  final Icon icon;
  final TextEditingController controller;
  final String content;

  @override
  _Username_InputState createState() => _Username_InputState();
}

class _Username_InputState extends State<Username_Input> {

  bool _showPassword;
  final AuthController authController = Get.find();

  void initState(){
    super.initState();
    _showPassword = true;
  }


  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: widget.content == "Password" ? _showPassword : false,
      style: TextStyle(color: Colors.white),
      controller: widget.controller,
      textAlign: TextAlign.center,
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(5),borderSide: BorderSide(color: kText_color)),
        enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(5),borderSide: BorderSide(color: kText_color)),
        prefixIcon: widget.icon,
        hintText: widget.content,
        hintStyle: TextStyle(color: Colors.grey),
        filled: true,
        suffixIcon: widget.content == "Password" ? TextButton(
          child: Icon(_showPassword? Icons.visibility: Icons.visibility_off,color: kText_color,),
          onPressed: (){
            setState(() {
              _showPassword = !_showPassword;
            });
          },
        ): null,
        contentPadding: widget.content != "Password" ? EdgeInsets.only(top: 0, left: 60) : EdgeInsets.only(top: 0, left: 0)
      ),
      onChanged: (value) {

        widget.content == "Password"?authController.password = value : widget.content == "Email" ? authController.email = value : authController.userName = value;
      },
    ).pSymmetric(h: 30);
  }
}