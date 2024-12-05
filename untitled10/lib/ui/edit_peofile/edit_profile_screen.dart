
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:untitled10/ui/edit_peofile/edit_profile_controller.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_text_form_field.dart';
import '../profile/profile_screen.dart';

class EditProfile extends StatelessWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  GetBuilder<EditProfileController>(
      init: EditProfileController(),
      builder: (EditProfileController controller) {
        return Scaffold(body: Column(children: [
          Row(mainAxisAlignment: MainAxisAlignment.start,crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 45.0,left: 17),
                child: IconButton(onPressed: (){Get.to(()=>Profile());}, icon: Icon(Icons.keyboard_backspace_rounded,color:Color(0xff0A0A0A).withOpacity(0.7) ,size:44 ,weight: 20,)),
              ),Padding(
                padding: const EdgeInsets.only(left: 15.0,bottom: 12),
                child: Text("Edit Profile",style: TextStyle(color: Color(0xff0A0A0A).withOpacity(0.7),fontWeight: FontWeight.w700,fontSize: 25),),
              ) ],),Padding(
            padding: const EdgeInsets.only(top: 25.0),
            child: Container(height: 130,width: 130,decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage("assets/images/Profile.png"),fit: BoxFit.fill)),),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 65.0,bottom: 25.0,left: 15.0,right: 20.0),
            child: CustomTextFormField(controller: controller.fullName_controller,
              onChange: (String){}, validator: (String){},
              keyboardType: TextInputType.name, isPassField: false,
              textFieldTitle: "    Full name", col: Color(0xff666666).withOpacity(0.2), icon: Icon(Icons.abc,color: Colors.transparent,),),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10.0,bottom: 25.0,left: 15.0,right: 20.0),
            child:
            CustomTextFormField(controller:controller.phoneNumber_controller,
              onChange: (String){}, validator: (String){},
              keyboardType: TextInputType.name, isPassField: false,
              textFieldTitle: "    Nickname", col:Color(0xff666666).withOpacity(0.2), icon: Icon(Icons.abc,color: Colors.transparent) ,),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10.0,bottom: 25.0,left: 15.0,right: 20.0),
            child:
            CustomTextFormField(controller:controller.email_controller,
              onChange: (String){}, validator: (String){},
              keyboardType: TextInputType.emailAddress, isPassField: false,
              textFieldTitle: "    Email", col: Color(0xff666666).withOpacity(0.2), icon: Icon(Icons.email_outlined,color: Colors.black),),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10.0,bottom: 25.0,left: 15.0,right: 20.0),
            child:
            CustomTextFormField(controller: controller.phoneNumber_controller,
              onChange: (String){}, validator: (String){},
              keyboardType: TextInputType.phone, isPassField: false,
              textFieldTitle: "    Phone Number", col: Color(0xff666666).withOpacity(0.2), icon: Icon(Icons.abc,color: Colors.transparent),),
          ),Padding(
            padding: const EdgeInsets.only(top: 60.0),
            child: CustomButton(onpressed: (){}, text: "Update", col: Colors.white),
          ),TextButton(onPressed: (){Get.to(()=>Profile());}, child: Text('Cancel',style: TextStyle(color: Color(0xff666666),fontWeight: FontWeight.w500),))],),);
      },

    );
  }
}