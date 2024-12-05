import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart'  hide Response , FormData;
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

// 3mlt el class da 34an agam3 kol 7agat el dio m3 b3d
class ApiServices extends GetxService{

  // da instance mn el class w kman hya btkon function w 5let virable ely asmo ApiServices ynady 3leha
  static final ApiServices apiUtil = ApiServices._();

  ApiServices._(){
    init();
  }

  // el constructor da berg3 function ely hya btg3ml intalization 7ttetha feh 34an 3yaz el intalization
  //y7sl awl ma el app yft7 bs m4 tol el class aw el app w da asmo dependency injection f fslt
  factory ApiServices(){
    return apiUtil;
  }

  Dio dio = Dio();

  void init(){
    dio.options.baseUrl = "https://api.themoviedb.org/3/discover";

    dio.interceptors.add(PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: false,
      compact: false,
    ));
  }

  // function asmhaa request ll 7agat ely httb3t fl call
  Future<dynamic> request <T>(
      //endpoint wl method lazm akon 3arfehom w aktbhom
      String endpoint,
      //get post delete
      String method,
      {
        // 5let no3 el data dynamic 34an ana m5 3araf eh el data ely gaya
        dynamic data,
        Map<String, dynamic>? hedears,
        Map<String, dynamic>? queryParameters,
        //34an bekon nfe anoa3 tanya ze el html bs a7naa bn4t8l json f b7dd

        Function(String errorMsg)? errorDialog,
        Function(String successMsg)? onSuccess,
        //f 7alat an fe error 7sl htb3lo da f message m4 k alert dialog
        Function(String errorMsg)? errorMessage,
      }
      )  async {

    try{
      Response response = await dio.request<T>(
          endpoint,
          data: data?? {},
          queryParameters: queryParameters,
          options: Options(
              method: method,
              headers: hedears)
      );
      if(response.statusCode != 200){
        throw "${
        //el message httb3t mn el server lw fe mo4kela
            response.statusMessage
        }\n${
            response.statusCode
        }" ;
      }
      if(response.statusCode != 200 || response.data == null){
        throw "${response.statusMessage}";
      }
      if(onSuccess != null){
        onSuccess(response.statusMessage.toString());
      }

      // fe 7alaet an el call ng7 heb3t el data
      return response.data;

    }catch(e){
      print("Error : $e");
      if(errorDialog != null){
        errorDialog(e.toString());
      }
      if(errorMessage != null){
        errorMessage(e.toString());
      }
      if(errorDialog == null && errorMessage == null){
        await Get.defaultDialog(
          title: " error has happened",
          content: Text("try again"),
          middleText: "",
        );
      }
    }
  }

}