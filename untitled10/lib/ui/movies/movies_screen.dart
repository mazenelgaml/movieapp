import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:untitled10/ui/movies/movies_controller.dart';
import 'package:untitled10/utilities/constants.dart';

class Movies extends StatelessWidget {
  const Movies({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MoviesController>(
        init: MoviesController(),
        builder: (MoviesController controller) {
          return SafeArea(
            child: Scaffold(
              body: controller.isLoading
                  ? Center(
                      child: LoadingAnimationWidget.twistingDots(
                        leftDotColor: const Color(0xFFe9d9e9),
                        rightDotColor: const Color(0xFF8a81d2),
                        size: 200,
                      ),
                    )
                  : SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  IconButton(
                                      onPressed: () {
                                        Get.back();
                                      },
                                      icon: Icon(
                                        Icons.keyboard_backspace_outlined,
                                        color: Color(0xff5F6162),
                                        size: 35,
                                      )),
                                  Text(
                                    "Movies",
                                    style: TextStyle(
                                        color: Color(0xff5F6162),
                                        fontFamily: kPoppins,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 25),
                                  ),
                                ],
                              ),
                              IconButton(
                                  onPressed: () {
                                    controller.getdata();
                                  },
                                  icon: Image(
                                    image: AssetImage(
                                        "assets/images/SearchIcon.png"),
                                  ))
                            ],
                          ),
                          Container(
                            height: Get.height * 0.9,
                            width: Get.width * 0.94,
                            child: ListView.builder(
                                controller: controller.moviesScrollController,
                                itemCount: controller.data?.length ?? 0,
                                itemBuilder: (context, index) {
                                  return Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          controller.selectedIndex=index;
                                          controller.data?[controller.selectedIndex].id;
                                        },
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            SizedBox(
                                              width: 3,
                                            ),
                                            Container(
                                              height: 172,
                                              width: 130,
                                              decoration: BoxDecoration(
                                                  border: Border.all(
                                                      color:
                                                          Colors.transparent),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20)),
                                              child: Image(
                                                image: NetworkImage(
                                                    "https://media.themoviedb.org/t/p/w220_and_h330_face/${controller.data?[index].posterPath ?? ""}"),
                                                fit: BoxFit.fill,
                                              ),
                                            ),
                                            SizedBox(
                                              width: 3,
                                            ),
                                            Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Container(
                                                  width: Get.width * 0.56,
                                                  child: Text(
                                                    controller.data?[index]
                                                            .originalTitle ??
                                                        "",
                                                    maxLines: 3,
                                                    overflow: TextOverflow.fade,
                                                    softWrap: true,
                                                    style: TextStyle(
                                                        fontSize: 17,
                                                        fontFamily: kPoppins,
                                                        fontWeight:
                                                            FontWeight.w700),
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 5,
                                                ),
                                                FittedBox(
                                                  fit: BoxFit.scaleDown,
                                                  child: Text(
                                                    controller.data?[index]
                                                            .releaseDate ??
                                                        "",
                                                    style: TextStyle(
                                                        color:
                                                            Color(0xff1F2020),
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontFamily: kPoppins,
                                                        fontSize: 10),
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 5,
                                                ),
                                                Text(
                                                  "Genere : ${controller.data?[index].genreIds}",
                                                  style: TextStyle(
                                                      fontSize: 10,
                                                      fontFamily: kPoppins,
                                                      fontWeight:
                                                          FontWeight.w500),
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
                                                                fontFamily:
                                                                    kPoppins,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500),
                                                          )
                                                        ],
                                                      ),
                                                      width: 70,
                                                      height: 20,
                                                      decoration: BoxDecoration(
                                                          border: Border.all(
                                                              color: Color(
                                                                  0xff0A0A0A)),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
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
                          ),
                          controller.isLoadingMoreData
                              ? Container(
                                  height: 100,
                                  width: 100,
                                  child: Center(
                                    child: LoadingAnimationWidget.twistingDots(
                                      leftDotColor: const Color(0xFFe9d9e9),
                                      rightDotColor: const Color(0xFF8a81d2),
                                      size: 80,
                                    ),
                                  ),
                                )
                              : Container(),
                        ],
                      ),
                    ),
            ),
          );
        });
  }
}
