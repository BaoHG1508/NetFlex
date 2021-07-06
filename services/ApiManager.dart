// @dart = 2.9

import 'dart:convert';

import 'package:netflex/Models/MovieModel.dart';
import 'package:netflex/constants/constants.dart';
import 'package:http/http.dart' as http;

class ApiManager {
  Future<MoviesModel> getMovie() async {
    var client = http.Client();
    var movieModel;
    var response = await client.get(Uri.parse(kapi));
    try {
      if (response.statusCode == 200) {
        var jsonString = response.body;
        var jsonMap = jsonDecode(jsonString);
        movieModel = MoviesModel.fromJson(jsonMap);
      }
    } catch (e) {
      print(e);
    }
    return movieModel;
  }
}
