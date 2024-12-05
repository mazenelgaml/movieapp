import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:untitled10/ui/tv_shows/tv_shows_controller.dart';
import 'package:untitled10/ui/movies/movies_controller.dart';
import 'package:untitled10/utilities/constants.dart';

class TvShows extends StatefulWidget {
  const TvShows({Key? key}) : super(key: key);

  @override
  State<TvShows> createState() => _TvShowsState();
}

class _TvShowsState extends State<TvShows> {

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TvShowsController>(
        init: TvShowsController(),
        builder: (TvShowsController controller) {
          return  SafeArea(
            child: Scaffold(
              body:controller.isLoading? Center(
                child: LoadingAnimationWidget.twistingDots(
                  leftDotColor: const Color(0xFFe9d9e9),
                  rightDotColor: const Color(0xFF8a81d2),
                  size: 200,
                ),
              ):Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
            
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          IconButton(
                              onPressed: () {Get.back();},
                              icon: Icon(
                                Icons.keyboard_backspace_outlined,
                                color: Color(0xff5F6162),
                                size: 35,
                              )),
                          Text(
                            "Tv Shows",
                            style: TextStyle(
                                color: Color(0xff5F6162),
                                fontFamily: kPoppins,
                                fontWeight: FontWeight.w500,
                                fontSize: 25),
                          ),
                        ],
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: Image(
                            image: AssetImage("assets/images/SearchIcon.png"),
                          ))
                    ],
                  ),
                  Container(
                    height: Get.height * 0.88,
                    width: Get.width * 0.94,
                    child: ListView.builder(
                        physics: const  AlwaysScrollableScrollPhysics(),
                        shrinkWrap: false,
                        controller: controller.tvShowsController,
                        itemCount: controller.data?.results?.length,
                        itemBuilder: (context, index) {
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InkWell(
                                onTap: () {},
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                      height: 172,
                                      width: 130,
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Colors.transparent),
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      child: Image(
                                        image:
                                            NetworkImage("https://media.themoviedb.org/t/p/w220_and_h330_face${controller.data?.results?[index].posterPath??""}"),
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                    SizedBox(width: 5,),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
            
                                        Container(
                                          width: Get.width*0.56,
                                          child: Text(
                                             controller.data?.results?[index].originalName??"",
                                            maxLines: 3,
                                            overflow: TextOverflow.fade,
                                            softWrap: true,
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontFamily: kPoppins,
                                                fontWeight: FontWeight.w700),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          controller.data?.results?[index].firstAirDate??"",
                                          style: TextStyle(
                                              color: Color(0xff1F2020),
                                              fontWeight: FontWeight.w500,
                                              fontFamily: kPoppins,
                                              fontSize: 10),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          "Genere : ${controller.data?.results?[index].genreIds}",
                                          style: TextStyle(
                                              fontSize: 10,
                                              fontFamily: kPoppins,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        InkWell(
                                            onTap: () {},
                                            child: Container(
                                              child: Row(
                                                children: [
                                                  SizedBox(
                                                    width: 2,
                                                  ),
                                                  Icon(
                                                    Icons.add,
                                                    size: 18,
                                                  ),
                                                  SizedBox(
                                                    width: 4,
                                                  ),
                                                  Text(
                                                    "My List",
                                                    style: TextStyle(
                                                        fontSize: 9.38,
                                                        fontFamily: kPoppins,
                                                        fontWeight:
                                                            FontWeight.w500),
                                                  )
                                                ],
                                              ),
                                              width: 70,
                                              height: 20,
                                              decoration: BoxDecoration(
                                                  border: Border.all(
                                                      color: Color(0xff0A0A0A)),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          25)),
                                            ))
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 8,
                              ),
                            ],
                          );
                        }),
                  )
                ],
              ),
            ),
          );
        });
  }
}
