
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:untitled10/models/tv_shows_model.dart';
import 'package:untitled10/utilities/api_services.dart';

import '../utilities/services.dart';

class TvShowsServices{

  static Future<TvShowsModel?>getTvShowsData(int page) async {
    final dio = Dio();
    Response response;
    try{
      dio.options.headers["Accept"]="application/json";
      dio.options.headers["authorization"]="Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJjOTQ5YTBlMDliMDZmYmM4N2NhY2ZiZWY0YzUwNDk2MyIsInN1YiI6IjYwNjczMjU2OTQwOGVjMDA3OGFhZDU3OSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.Cc6geu9ql9U2MkchIXPko0pu8_GpNFZGHjp00kjz5I4";
      response= await dio.get("https://api.themoviedb.org/3/discover/tv",queryParameters: {
        "page":page,
      });
      return TvShowsModel.fromJson(response.data);
    }catch(e)
    {
      print(e.toString());
      return null;
    }



  }


}