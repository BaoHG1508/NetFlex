// @dart=2.9
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:netflex/Widgets/HomePage/HomePage/Netflex.dart';
import 'package:netflex/Widgets/HomePage/VideoPlayerWidget/VideoPlayer.dart';
import 'package:netflex/constants/constants.dart';
import 'package:netflex/controller/movie_controller.dart';
import 'package:netflex/controller/url_controller.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:video_player/video_player.dart';

class WatchingScreen extends StatefulWidget {
  @override
  _WatchingScreenState createState() => _WatchingScreenState();
}

class _WatchingScreenState extends State<WatchingScreen> {

  Controller movie_controller = Get.find();
  VideoPlayerController video_controller;
  UrlController urlController = Get.find();
  @override
  void initState(){
    super.initState();
    print(urlController.url.first.url);
    setState(() {
      video_controller = VideoPlayerController.network("https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4")
        ..addListener(() { })
        ..setLooping(true)
        ..initialize().then((_) => video_controller.play());
    });
  }

  void dispose(){
    video_controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: apptitle,
          centerTitle: true,
          backgroundColor: kApp_color,
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back,
                color: kText_color,
              )),
        ),
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: kApp_color,
          child: Column(
            children: [
              Expanded(child: VideoPlayerWidget(video_controller)),
            ],
          ),
        ),
      ),
    );
  }
}
