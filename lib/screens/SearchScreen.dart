import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:netflex/constants/constants.dart';
import 'package:netflex/screens/DetailScreen.dart';
import 'package:netflex/controller/movie_controller.dart';
import 'package:velocity_x/velocity_x.dart';

class FilmSearcher extends SearchDelegate<String> {

  Controller movieController = Get.find();


  @override
  ThemeData appBarTheme(BuildContext context) {
    return Theme.of(context).copyWith(
      scaffoldBackgroundColor: kApp_color,
      primaryColor: kApp_color,
      textTheme: TextTheme(
        headline6: TextStyle(
          color: Colors.white
        )
      ),
      hintColor: Colors.grey,
    );
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = "";
          },
          icon: Icon(Icons.clear,color: kText_color,))
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, "");
        },
        icon: AnimatedIcon(
          icon: AnimatedIcons.arrow_menu,
          color: kText_color,
          progress: transitionAnimation,
        ));
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionList = query.isEmpty ? [] : movieController.toSearchList_title.where((p) => p.startsWith(query)).toList();
    return ListView.builder(
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {

            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => DetailScreen(
                          image: movieController.toSearchList_image[movieController.toSearchList_title.indexOf(suggestionList[index])],
                          title: suggestionList[index],
                          category: movieController.toSearchList_category[movieController.toSearchList_title.indexOf(suggestionList[index])],
                        )));
          },
          child: Column(
            children: [
              Hero(
                tag: movieController.toSearchList_image[movieController.toSearchList_title.indexOf(suggestionList[index])],
                child: Container(
                  height: 300,
                  width: 200,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(
                            (movieController.toSearchList_image[movieController.toSearchList_title.indexOf(suggestionList[index])]),
                          ),
                          fit: BoxFit.cover),
                      borderRadius: BorderRadius.circular(15)),
                ),
              ),
              kGap10,
              Text(
                suggestionList[index],
                style: TextStyle(color: Colors.white),
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ).p(10);
      },
      itemCount: suggestionList.length,
    );
  }
}
