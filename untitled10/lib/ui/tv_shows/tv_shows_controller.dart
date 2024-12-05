import 'package:flutter/cupertino.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:untitled10/models/tv_shows_model.dart';
import 'package:untitled10/services/tv_shows_services.dart';

class TvShowsController extends GetxController{
  ScrollController tvShowsController= new ScrollController();

 late TvShowsModel? data;
 bool isLoading = true;
  int counter=1;
  bool isLoadingMoreData=false;
 @override
 onInit()  {
   super.onInit();
   getdata();
   tvShowsController.addListener(loadMoreData);
 }
  void getdata() async
  {
    data = await TvShowsServices.getTvShowsData(counter);

    if(data == null)
    {
      print("some error occured");
    }else{
      print(data?.results?[0].originalName);
    }
    isLoading= false;
    update();
  }
  void loadMoreData(){
    if((tvShowsController.position.pixels)==(tvShowsController.position.maxScrollExtent))
    {
      counter=counter+1;
      isLoadingMoreData= true;
      update();
      getdata();
    }
  }
}
