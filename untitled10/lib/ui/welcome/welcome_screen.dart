import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../widgets/custom_elevated_button.dart';
import '../auth/sign_in/sign_in_screen.dart';
import '../profile/profile_screen.dart';
class WelcomeScreen extends StatelessWidget {
  Welcomes()  {
    final SharedPreferences prefs =  SharedPreferences.getInstance() as SharedPreferences;
    bool? checker = prefs.containsKey("uid"); Welcomes()  {
      final SharedPreferences prefs =  SharedPreferences.getInstance() as SharedPreferences;
      bool? checker = prefs.containsKey("uid");
      if(checker){
        Get.off(()=> Profile());
      }}

  }
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Container(width:Get.width,height:Get.height ,decoration:BoxDecoration(
        image:DecorationImage(image:AssetImage
          ("assets/images/Property 1=Android Large - 1 1.png",),fit: BoxFit.fill )),
      child: Column(mainAxisAlignment: MainAxisAlignment.end,children: [
        Container(
          height: 295,
          width: 420,
          decoration: BoxDecoration(image: DecorationImage(image: AssetImage("assets/images/Rectangle 1.png"),fit:BoxFit.fill )),
          child: Column(mainAxisAlignment: MainAxisAlignment.start,crossAxisAlignment: CrossAxisAlignment.center,
            children: [Padding(
              padding: const EdgeInsets.only(top:45.0,bottom: 15),
              child: Text("Welcome to App",
                style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,
                    fontSize: 35,
                    fontStyle:FontStyle.normal ),),
            ),
              Padding(
                padding: const EdgeInsets.only(left: 75.0,bottom: 8,right: 60,top: 5),
                child: Text("Lorem ipsum dolor sit amet consectetur adipisicing elit."
                    " Voluptates porro  aperiam.",style:TextStyle(),
                ),
              ),
              Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child:CustomButton(onpressed: () {Get.to(()=>SignIn());  }, text: 'Get Started', col: Colors.black)

              )],),
        )],),),);
  }
}
