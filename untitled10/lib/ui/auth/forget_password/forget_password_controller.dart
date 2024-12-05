import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class forgetpasswordcontroller extends GetxController{
  TextEditingController email_controller = new TextEditingController();
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  onChanged(String? val){
    formkey.currentState?.validate();
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
  Future resetPassword()async{
    await FirebaseAuth.instance.sendPasswordResetEmail(email: email_controller.text);
  }
}