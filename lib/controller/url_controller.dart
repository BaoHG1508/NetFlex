import 'package:get/get.dart';
import 'package:netflex/Models/MovieModel.dart';

class UrlController extends GetxController
{

  List url = [];

  void getUrl(list_of_episodes){
    for(var i = 0; i < list_of_episodes.length; i++){
      url.add(list_of_episodes[i].url);
    }
  }

}