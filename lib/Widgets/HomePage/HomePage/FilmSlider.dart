// @dart=2.9
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:netflex/Models/MovieModel.dart';
import 'package:netflex/constants/constants.dart';
import 'package:netflex/screens/DetailScreen.dart';
import 'package:netflex/controller/url_controller.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:netflex/controller/movie_controller.dart';
class FilmSlider extends StatefulWidget {

  FilmSlider(this.phim_category);

  final String phim_category;

  @override
  _FilmSliderState createState() => _FilmSliderState();
}

class _FilmSliderState extends State<FilmSlider> {

  Controller movieController = Get.find();
  UrlController url_controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<MoviesModel>(
      future: movieController.movie,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          // ignore: missing_return
          return SizedBox(
            height: 250,
            child: ListView.builder(
              itemBuilder: (context, index) {
                var movie = null;
                if(widget.phim_category == "phimle") {
                  movie = snapshot.data.phim.phimle[index];
                }
                else if(widget.phim_category == "phimbo"){
                  movie = snapshot.data.phim.phimbo[index];
                }
                else if(widget.phim_category == "phimchieurap"){
                  movie = snapshot.data.phim.phimchieurap[index];
                }
                else{
                  movie = snapshot.data.phim.phimhoathinh[index];
                }

                return Column(
                  children: [
                    GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => DetailScreen(image: movie.imageUrl,title: movie.title,category: movie.category,)));
                      },
                      child: Hero(
                        tag: movie.imageUrl,
                        child: Container(
                          height: 200,
                          width: 150,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(movie.imageUrl),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ),
                    kGap10,
                    Flexible(child: Container( width: 200,child: Text(movie.title,style: TextStyle(color: Colors.white,),textAlign: TextAlign.center,overflow: TextOverflow.ellipsis,))),
                  ],
                );
              },
              itemCount: 10,
              scrollDirection: Axis.horizontal,
            ),
          );
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
