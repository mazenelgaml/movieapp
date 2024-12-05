import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import '../../../models/user_model.dart';
import '../../../services/user_auth_services.dart';
import '../../../services/user_data_services.dart';
import '../../profile/profile_screen.dart';

import 'package:untitled10/models/user_model.dart';

class SignUpController extends GetxController{
  final FirebaseAuthServices auth=FirebaseAuthServices();
  TextEditingController fullName_controller = new TextEditingController();
  TextEditingController email_controller = new TextEditingController();
  TextEditingController password_controller = new TextEditingController();
  TextEditingController phoneNumber_controller = new TextEditingController();
  TextEditingController confirm_password_controller = new TextEditingController();
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  List<UserModel> users =<UserModel>[];
  @override
  void onInit(){
    super.onInit();


  }
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
  String? confirmValidator (String? val){
    if(val!.isEmpty)
      return 'Empty';
    if(val != password_controller.text)
      return 'Not Match';
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

  String? phoneNumberValidator (String? value)
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
  addUser() async {
    String newUserName = fullName_controller.text;
    String newUserEmail = email_controller.text;
    String newUserPassword = password_controller.text;
    String newUserPhoneNumber = password_controller.text;

    if (newUserName.isNotEmpty && newUserEmail.isNotEmpty && newUserPassword.isNotEmpty && newUserPhoneNumber.isNotEmpty) {
      UserDataServices services = UserDataServices();
      await services.saveUser(UserModel(
          userName: newUserName,
          emailAddress: newUserEmail,
          password: newUserPassword,
          phoneNumber: newUserPhoneNumber));

      users = await services.fetchData();
      print(users.length);
      update();
    }
  }

  getUserdata() async {
    UserDataServices services = UserDataServices();

    users= await services.fetchData();
    update();
    print(users.length);
    print(users[0].userName??"");
  }


  void signUp()async
  {
    String phoneNumber=phoneNumber_controller.text;
    String email=email_controller.text;
    String password=password_controller.text;
    User? user= await auth.signUpwithEmailAndPassword(email, password);
    if(formkey.currentState!.validate())
    {
      if (user!= null )
      {
        addUser();
        Get.to(()=>Profile());
        print("user is successfully created");
      }else
      {
        print("some error happened");
      }
    }}
  @override
  void dispose()
  {
    super.dispose();
    email_controller.dispose();
    password_controller.dispose();
    phoneNumber_controller.dispose();
    confirm_password_controller.dispose();
  }
}