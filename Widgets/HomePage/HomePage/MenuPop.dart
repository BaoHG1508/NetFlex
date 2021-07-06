import 'package:flutter/material.dart';
import 'package:netflex/constants/constants.dart';
class MenuPop extends StatefulWidget {

  @override
  _MenuPopState createState() => _MenuPopState();
}

class _MenuPopState extends State<MenuPop> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.menu,color: kText_color,),
      onPressed: (){
      },
    );
  }
}
