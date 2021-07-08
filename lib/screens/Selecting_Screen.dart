// @dart=2.9
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:netflex/Models/MovieModel.dart';
import 'package:netflex/Widgets/HomePage/HomePage/FilmLength.dart';
import 'package:netflex/Widgets/HomePage/HomePage/MenuPop.dart';
import 'package:netflex/Widgets/HomePage/HomePage/Netflex.dart';
import 'package:netflex/Widgets/HomePage/HomePage/Slider.dart';
import 'package:netflex/Widgets/HomePage/HomePage/FilmSlider.dart';
import 'package:netflex/constants/Navigator.dart';
import 'package:netflex/screens/SearchScreen.dart';
import 'package:netflex/constants/constants.dart';
import 'package:netflex/controller/AuthController.dart';
import 'package:netflex/controller/movie_controller.dart';

class Selecting_Screen extends StatefulWidget {
  static const id = "SelectingScreen";
  @override
  _Selecting_ScreenState createState() => _Selecting_ScreenState();
}

class _Selecting_ScreenState extends State<Selecting_Screen> {

  Controller movieController = Get.find();
  AuthController authController = Get.find();
  Future<MoviesModel> movie;
  int selected = 0;

  void initState() {
    super.initState();
    movie = movieController.movie;
    movieController.getSearchList();
    authController.getUsername();
  }



  @override
  Widget build(BuildContext context) {
    return SafeArea(
          child: Scaffold(
            appBar: AppBar(
              title: apptitle,
              centerTitle: true,
              backgroundColor: kApp_color,
              leading: MenuPop(),
            ),
            body: Container(
              width: screenHeight ,
              height: screenWidth ,
              decoration: BoxDecoration(
                gradient: appGradient,
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppSlider(),
                    FilmStyle("Phim lẻ"),
                    FilmSlider("phimle"),
                    FilmStyle("Phim bộ"),
                    FilmSlider("phimbo"),
                    FilmStyle("Phim chiếu rạp"),
                    FilmSlider("phimchieurap"),
                    FilmStyle("Phim hoạt hình"),
                    FilmSlider("phimhoathinh"),
                  ],
                ),
              ),
            ),
            bottomNavigationBar: BottomNavigationBar(
              backgroundColor: kApp_color.withOpacity(0.9),
              selectedItemColor: kText_color,
              unselectedItemColor: Colors.grey,
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.search),
                  label: 'Tìm kiếm',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person),
                  label: 'Tài khoản',
                ),
              ],
              onTap: (index) {
                setState(() {
                  if(index == 1){
                    showSearch(context: context, delegate: FilmSearcher());
                  }
                  if(index == 2){
                    Navigator.pushNamed(context, SiteNavigation.ACCOUNT);
                  }
                });
              },
              currentIndex: selected,
            ),
          ),
        );

  }
}

