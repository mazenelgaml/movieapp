import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../services/user_auth_services.dart';
import '../../profile/profile_screen.dart';

class SignInController extends GetxController{
  final FirebaseAuthServices auth=FirebaseAuthServices();
  TextEditingController email_controller = new TextEditingController();
  TextEditingController password_controller = new TextEditingController();

  final GlobalKey<FormState> formkey = GlobalKey<FormState>();


  onChanged(String? val){
    formkey.currentState?.validate();
  }
  String? passwordValidator (String? value){
    print(value);
    if(value!.isEmpty){
      return "Please Enter your Password";
    }else if(!RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$').hasMatch(value))
    {
      return "Please Enter a Valid password";
    }
    return null;
  }
  String? emailValidator (String? value){
    print(value);
    if(value!.isEmpty){
      return "Please Enter your Email";
    }else if(!RegExp(r'\S+@\S+\.\S+').hasMatch(value))
    {
      return "Please Enter a Valid Email";
    }
    return null;
  }

  void signIn()async
  {
    String email=email_controller.text;
    String password=password_controller.text;
    User? user= await FirebaseAuthServices().signInwithEmailAndPassword(email, password);
    if(formkey.currentState!.validate())
    {
      if (user!= null)
      {

        Get.to(()=>Profile());
      }else
      {
        print("This Account doesn't exists");
      }
    }}
  @override
  void dispose()
  {
    super.dispose();
    email_controller.dispose();
    password_controller.dispose();
  }
}
