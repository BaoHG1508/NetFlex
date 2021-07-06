import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:netflex/services/controller/movie_controller.dart';

class MovieCover extends StatelessWidget {

  Controller movieController = Get.find();


  MovieCover(this.imgUrl);
  final String imgUrl;
  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: imgUrl,
      child: Container(
        height: MediaQuery.of(context).size.height/2 - 10,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.vertical(
              bottom: Radius.elliptical(
                  MediaQuery.of(context).size.width, 150.0)),
          image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(imgUrl),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.red.withOpacity(0.3),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
      ),
    );
  }
}
