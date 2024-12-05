import 'package:dio/dio.dart';

import '../models/movie_model.dart';


class MovieServices{

  static Future<MovieModel?>getMoviesData(int page) async {
    final dio = Dio();
    Response response;
    try{
      dio.options.headers["Accept"]="application/json";
      dio.options.headers["authorization"]="Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJjOTQ5YTBlMDliMDZmYmM4N2NhY2ZiZWY0YzUwNDk2MyIsInN1YiI6IjYwNjczMjU2OTQwOGVjMDA3OGFhZDU3OSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.Cc6geu9ql9U2MkchIXPko0pu8_GpNFZGHjp00kjz5I4";
      response= await dio.get("https://api.themoviedb.org/3/discover/movie",queryParameters: {
        "page":page,
      });
      return MovieModel.fromJson(response.data);
    }catch(e)
    {
      print(e.toString());
      return null;
    }


  }
  static Future<MovieModel?> getMovies (int page,String searchKeyword)async{
    Map<String,dynamic>body={
      "Accept":"application/json",
      "authorization":"Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJjOTQ5YTBlMDliMDZmYmM4N2NhY2ZiZWY0YzUwNDk2MyIsInN1YiI6IjYwNjczMjU2OTQwOGVjMDA3OGFhZDU3OSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.Cc6geu9ql9U2MkchIXPko0pu8_GpNFZGHjp00kjz5I4",
    };
    dynamic res=await Dio().get("https://api.themoviedb.org/3/search/movie",queryParameters: {
      "query":searchKeyword,
      "page":page
    },
    options: Options(
      headers: body
    ),
    );
    if(res!= null){
      return MovieModel.fromJson(res.data);
    }else{
      return null;
    }
  }

}