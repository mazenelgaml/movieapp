import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled10/services/user_data_services.dart';

import '../../models/user_model.dart';
class EditProfileController extends GetxController{

  TextEditingController email_controller = new TextEditingController();
  TextEditingController fullName_controller = new TextEditingController();
  TextEditingController phoneNumber_controller = new TextEditingController();
  TextEditingController password_controller = new TextEditingController();
  List<UserModel> users =<UserModel>[];
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();


  @override
  onInit()  {
    super.onInit();
    getUserdata();


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

      users= await services.fetchData();
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

  Future<void> removeTodo(int index) async {
    users.removeAt(index);
    final SharedPreferences prefs = await SharedPreferences.getInstance();

  }

}