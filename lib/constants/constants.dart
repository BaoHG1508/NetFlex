import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

const kapi = "https://api.apify.com/v2/key-value-stores/QubTry45OOCkTyohU/records/LATEST?fbclid=IwAR3ApFd5FJ9tGyvLi4zYoFKyclzLyZZd0ZyS-8iPcnPVXF9V0bkHC0YHPD8";
const kApp_color = Color(0xff242526);
const kText_color = Colors.redAccent;
var kGap10 = 10.heightBox;
var kGap20 = 20.heightBox;
var screenHeight = double.infinity;
var screenWidth = double.infinity;
var appGradient = LinearGradient(
  begin: Alignment.topLeft,
    end: Alignment.bottomCenter,
    colors: [
  Color(0xff232526),
  Color(0xff414345),
]);