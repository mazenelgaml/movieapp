
import 'package:flutter/cupertino.dart';
import '../services/user_auth_services.dart';

class ValidatorHelper {
  final FirebaseAuthServices auth=FirebaseAuthServices();
  TextEditingController email_controller = new TextEditingController();
  TextEditingController password_controller = new TextEditingController();
  TextEditingController phoneNumber_controller = new TextEditingController();
  TextEditingController userName_controller = new TextEditingController();
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
  String? emailValidator (String?value){
    print(value);
    if(value!.isEmpty){
      return "Please Enter your Email";
    }else if(!RegExp(r'\S+@\S+\.\S+').hasMatch(value))
    {
      return "Please Enter a Valid Email";
    }
    return null;
  }

  String? nameValidator(String? value){
    if(value!.isEmpty){
      return 'Please Enter Your Name';}
    else if(!RegExp(r"^[a-zA-Z]+$").hasMatch(value))
    {return "Enter a Valid Name";}
    return null;}

  String? phoneNumberValidator (value)
  {
    String patttern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
    RegExp regExp = new RegExp(patttern);
    if (value!.length == 0) {
      return 'Please enter mobile number';
    }
    else if (!regExp.hasMatch(value)) {
      return 'Please enter valid mobile number';
    }
    return null;
  }

}