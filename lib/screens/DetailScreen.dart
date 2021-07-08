// @dart=2.9
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflex/Widgets/HomePage/DetailWidgets/MovieCover.dart';
import 'package:netflex/Widgets/HomePage/DetailWidgets/PlayButton.dart';
import 'package:netflex/Widgets/HomePage/HomePage/Netflex.dart';

import 'package:netflex/constants/constants.dart';
import 'package:velocity_x/velocity_x.dart';

class DetailScreen extends StatefulWidget {
  static const id = "DetailScreen";

  DetailScreen({this.image, this.title, this.category});

  final String image;
  final String title;
  final dynamic category;

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  String category = "N/A";

  String getCategory() {
    if (widget.category.toString() == "Category.PHIM_KINH_D") {
      category = "Phim kinh dị";
    } else if (widget.category.toString() == "Category.PHIM_C_TRANG") {
      category = "Phim cổ trang";
    } else if (widget.category.toString() == "Category.PHIM_TNH_CM") {
      category = "Phim tình cảm";
    } else if (widget.category.toString() == "Category.PHIM_HNH_NG") {
      category = "Phim hành động";
    } else if (widget.category.toString() == "Category.PHIM_HOT_HNH") {
      category = "Phim hoạt hình";
    }
    return category;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          elevation: 0.0,
          title: apptitle,
          centerTitle: true,
          backgroundColor: Colors.transparent,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_left_sharp,
              color: kText_color,
              size: 40,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: Container(
          height: screenHeight,
          width: screenWidth,
          color: kApp_color,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height / 2 + 20,
                  child: Stack(
                    children: [
                      MovieCover(widget.image),
                      PlayButton(),
                    ],
                  ),
                ),
                kGap10,
                widget.title.text.bold
                    .size(20)
                    .center
                    .uppercase
                    .white
                    .make()
                    .pSymmetric(h: 20),
                kGap10,
                getCategory().text.gray400.make(),
                kGap10,
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
                    .text
                    .white
                .align(TextAlign.center)
                .size(20)
                    .make().p(10),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
