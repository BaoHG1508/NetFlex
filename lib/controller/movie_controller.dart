// @dart=2.9

import 'package:get/get.dart';
import 'package:netflex/Models/MovieModel.dart';
import 'package:netflex/services/ApiManager.dart';

class Controller extends GetxController {
  Future<MoviesModel> movie = ApiManager().getMovie();

  String tag;

  List<String> toSearchList_title = [];
  List<String> toSearchList_image = [];
  List<String> toSearchList_category = [];

  void getSearchList() {
    movie.then((value) {
      for (var i = 0; i < value.phim.phimle.length; i++) {
        toSearchList_title.add(value.phim.phimle[i].title);
        toSearchList_image.add(value.phim.phimle[i].imageUrl);
        toSearchList_category.add(value.phim.phimle[i].category.toString());
      }
      for (var i = 0; i < value.phim.phimchieurap.length; i++) {
        toSearchList_title.add(value.phim.phimchieurap[i].title);
        toSearchList_image.add(value.phim.phimchieurap[i].imageUrl);
        toSearchList_category.add(value.phim.phimchieurap[i].category.toString());

      }
      for (var i = 0; i < value.phim.phimhoathinh.length; i++) {
        toSearchList_title.add(value.phim.phimhoathinh[i].title);
        toSearchList_image.add(value.phim.phimhoathinh[i].imageUrl);
        toSearchList_category.add(value.phim.phimhoathinh[i].category.toString());

      }
      for (var i = 0; i < value.phim.phimbo.length; i++) {
        toSearchList_title.add(value.phim.phimbo[i].title);
        toSearchList_image.add(value.phim.phimbo[i].imageUrl);
        toSearchList_category.add(value.phim.phimbo[i].category.toString());

      }
    });
  }
}
