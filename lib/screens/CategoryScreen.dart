// @dart=2.9

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:netflex/Models/MovieModel.dart';
import 'package:netflex/constants/constants.dart';
import 'package:netflex/screens/DetailScreen.dart';
import 'package:netflex/screens/SearchScreen.dart';
import 'package:netflex/controller/movie_controller.dart';
import 'package:netflex/controller/url_controller.dart';
import 'package:velocity_x/velocity_x.dart';

class CategoryScreen extends StatefulWidget {

  CategoryScreen(this.film_category);

  final String film_category;
  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {

  Controller movieController = Get.find();
  UrlController url_controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 5,
        title: widget.film_category.text.size(30).color(kText_color).make(),
        centerTitle: true,
        backgroundColor: kApp_color,
        leading: IconButton(icon: Icon(Icons.arrow_left_sharp, color: kText_color,size: 40,), onPressed: (){
          Navigator.pop(context);
        },),
        actions: [
          IconButton(
              onPressed: () {
                movieController.getSearchList();
                showSearch(context: context, delegate: FilmSearcher());
              },
              icon: Icon(
                Icons.search_outlined,
                color: kText_color,
              ),),
        ],
      ),
      body: Container(
        height: screenHeight,
        width: screenWidth,
        color: kApp_color,
        child: FutureBuilder<MoviesModel>(
          future: movieController.movie,
          builder: (context,snapshot){
            var movie = null;
            if(widget.film_category == "Phim lẻ"){
              movie = snapshot.data.phim.phimle;
            }
            else if(widget.film_category == "Phim hoạt hình"){
              movie = snapshot.data.phim.phimhoathinh;
            }
            else if(widget.film_category == "Phim chiếu rạp"){
              movie = snapshot.data.phim.phimchieurap;
            }
            else if(widget.film_category == "Phim bộ"){
              movie = snapshot.data.phim.phimbo;
            }
            return GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisSpacing: 20,
                  mainAxisExtent: 330,
                  mainAxisSpacing: 20,
                  crossAxisCount: 2,
                ),
                itemCount: movie.length,
                itemBuilder: (context,index){
                  if(snapshot.hasData){
                  return GestureDetector(
                    onTap: (){
                      url_controller.url = movie[index].episode;
                      print(url_controller.url[0].url);
                      Navigator.push(context, MaterialPageRoute(builder: (context) => DetailScreen(image: movie[index].imageUrl,title: movie[index].title,category: movie[index].category,)));
                    },
                    child: Column(
                      children: [
                        Hero(
                          tag: movie[index].imageUrl,
                          child: Container(
                            height: 300,
                            width: 200,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: NetworkImage((movie[index].imageUrl),
                                  ),
                                  fit: BoxFit.cover
                                ),
                                borderRadius: BorderRadius.circular(15)),
                          ),
                        ),
                        kGap10,
                        Text(movie[index].title,style: TextStyle(color: Colors.white),textAlign: TextAlign.center,overflow: TextOverflow.ellipsis,),
                      ],
                    ),
                  );
                  }
                  else{
                    return Center(child: CircularProgressIndicator());
                  }
                });
          },
        ),
      ),
    );
  }
}
