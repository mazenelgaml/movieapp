
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:untitled10/models/movie_model.dart' as dada;
import 'package:untitled10/services/movie_services.dart';

import '../../models/tv_shows_model.dart';

class MoviesController extends GetxController{

  List<dada.Result>? data ;
 bool isLoading = true;
 int counter=1;
 bool isLoadingMoreData=false;
 late int selectedIndex ;
 ScrollController moviesScrollController= ScrollController();
 @override
 onInit()   {
   super.onInit();
    getdata();
   moviesScrollController.addListener(loadMoreData);
 }
   getdata() async
  {
    if(
    counter==1
    ) {
      var response = await MovieServices.getMoviesData(counter);

      if (response == null) {
        print("some error occured");
      } else {
        data= response.results;

      }

      isLoading = false;

      update();

    }else{
      var response = await MovieServices.getMoviesData(counter);
      data?.addAll(response!.results!);
      isLoadingMoreData= false;
      update();
      getdata();
    }
  }

 void loadMoreData(){
   if((moviesScrollController.position.pixels)==(moviesScrollController.position.maxScrollExtent))
   {
     counter=counter+1;
     isLoadingMoreData= true;
     update();
     getdata();
   }
 }
}
