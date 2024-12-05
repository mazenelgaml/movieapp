import 'package:get/get.dart';

import '../../models/movie_model.dart';
import '../../models/tv_shows_model.dart';
import '../../services/movie_services.dart';
import '../../services/tv_shows_services.dart';

class HomeController extends GetxController{
  final List<String> tvShowImages = [
  "assets/images/Madaari Movie Review 1.png",
  "assets/images/Photoshop Tutorials_ 28 New Tutorials to Create Photo Effects & Manipulation 1.png",
  "assets/images/Carteles _Interstellar_ 1.png"];
  bool isLoading = true;
  late TvShowsModel? TVShow;
  late MovieModel? movie ;

  @override
  onInit()  {
    super.onInit();
    getTvShows();
    getMovies();

  }
  void getTvShows() async
  {
    TVShow = await TvShowsServices.getTvShowsData(1);
    isLoading= false;
    update();
    if(TVShow == null)
    {
      print("some error occured");
    }else{
      print(TVShow?.results?[0]);
    } isLoading= false;
    update();
  }
  void getMovies() async
  {

    movie = await MovieServices.getMoviesData(1);
    if(movie == null)
    {
      print("some error occured");
    }else{
      print(movie?.results?[0]);
    } isLoading= false;
    update();
  }

}