// @dart=2.9
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:netflex/constants/constants.dart';
import 'package:netflex/screens/WatchScreen.dart';

class PlayButton extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: Align(
        alignment: Alignment.bottomCenter,
        child: GestureDetector(
          onTap: (){
            Get.to(() => WatchingScreen());
          },
          child: CircleAvatar(
            child: Icon(Icons.play_arrow_rounded,size: 50,color: kText_color,),
            radius: 30,
            backgroundColor: Colors.white,
          ),
        ),
      ),
    );
  }
}

