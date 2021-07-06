// @dart=2.9

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:netflex/Models/MovieModel.dart';
import 'package:netflex/screens/DetailScreen.dart';
import 'package:netflex/screens/Selecting_Screen.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:netflex/services/controller/movie_controller.dart';
import 'dart:math';


class AppSlider extends StatefulWidget {
  @override
  _AppSliderState createState() => _AppSliderState();
}

class _AppSliderState extends State<AppSlider> {


  Controller movieController = Get.find();

  List<String> sliderMovie_image = [];
  List<String> sliderMovie_title = [];
  List<dynamic> sliderMovie_category = [];

  void initState(){
    super.initState();
    getItem();
  }

  void getItem() async {
    await movieController.movie.then((value) => (setState(() {
      for (var i = 0; i < 5; i++) {
        var index = Random().nextInt(100);
        sliderMovie_image.add(value.phim.phimle[index].imageUrl);
        sliderMovie_title.add(value.phim.phimle[index].title);
        sliderMovie_category.add(value.phim.phimle[index].category);
      }
    })));
  }

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        autoPlay: true,
        aspectRatio: 2.0,
        enlargeCenterPage: true,
      ),
      items: sliderMovie_image
          .map((item) => TextButton(
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => DetailScreen(image: sliderMovie_image[sliderMovie_image.indexOf(item)],title: sliderMovie_title[sliderMovie_image.indexOf(item)],category: sliderMovie_category[sliderMovie_image.indexOf(item)],)));
        },
        child: Container(
          child: Container(
            margin: EdgeInsets.all(3.0),
            child: ClipRRect(
                borderRadius:
                BorderRadius.all(Radius.circular(5.0)),
                child: Stack(
                  children: <Widget>[
                    Image.network(item,
                        fit: BoxFit.cover, width: 1000.0),
                    Positioned(
                      bottom: 0.0,
                      left: 0.0,
                      right: 0.0,
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Color.fromARGB(200, 0, 0, 0),
                              Color.fromARGB(0, 0, 0, 0)
                            ],
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                          ),
                        ),
                        padding: EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 10.0),
                        child: Text(
                          '${sliderMovie_title[sliderMovie_image.indexOf(item)]}',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                )),
          ),
        ),
      ))
          .toList(),
    );
  }
}
