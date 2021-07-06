import 'package:flutter/material.dart';
import 'package:netflex/screens/CategoryScreen.dart';
import 'package:velocity_x/velocity_x.dart';
class FilmStyle extends StatelessWidget {

  FilmStyle(this.style);
  final String style;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        style.text.white.semiBold.size(16).make().pSymmetric(h: 20),
        Spacer(),
        TextButton(onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => CategoryScreen(style) ));
        },
        child: 'Xem tất cả'.text.white.size(10).make()),
        10.widthBox,
      ],
    );
  }
}
