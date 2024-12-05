
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:untitled10/ui/auth/sign_up/sign_up_controller.dart';
import 'package:untitled10/ui/edit_peofile/edit_profile_screen.dart';
import '../../../widgets/custom_elevated_button.dart';
import '../../../widgets/custom_text_form_field.dart';
import '../../profile/profile_screen.dart';
import '../../welcome/welcome_screen.dart';
import '../sign_in/sign_in_screen.dart';

class SignUp extends StatelessWidget {
  SignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  GetBuilder<SignUpController>(
      init: SignUpController(),
      builder: (SignUpController controller) {
        return Scaffold(body:SingleChildScrollView(
          child: Column(crossAxisAlignment: CrossAxisAlignment.center,mainAxisAlignment: MainAxisAlignment.start
            ,
            children: [Padding(
              padding: const EdgeInsets.only(right: 318.0,top:50),
              child:
              IconButton(icon: Icon(Icons.keyboard_backspace_sharp,size: 33,weight: 15.0,), onPressed: ()
              { Get.to(()=>WelcomeScreen()); },),
            ),Center(child: Container(height: 110,width: 110,decoration:
            BoxDecoration(image: DecorationImage(image:AssetImage
              ("assets/images/Group 5.png") ,fit: BoxFit.fill)))),
              Padding(
                padding: const EdgeInsets.only(bottom: 30.0),
                child: Text("Create your Account",style: TextStyle(fontWeight: FontWeight.w900,fontSize: 30),),
              ),Container(width:Get.width,height:580,decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 15.0,
                    ),

                  ],color: Colors.white,border:Border(top: BorderSide(color:Colors.white))
                  ,borderRadius: BorderRadius.only(topLeft: Radius.circular(35),
                  topRight: Radius.circular(35)) ),child:
              Form(
                key: controller.formkey,
                child: SingleChildScrollView(
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                    children: [Padding(
                      padding: const EdgeInsets.only(left: 30.0,top:30),
                      child: Text("Email",
                        style: TextStyle(color: Color(0xff0A0A0A),
                            fontWeight: FontWeight.w600,fontSize: 18),),
                    ),
                      Padding(
                        padding: const EdgeInsets.only(left: 27.0,right: 20.0,top:7),
                        child:

                        CustomTextFormField(controller:controller.email_controller , onChange: controller.onChanged, validator: controller.emailValidator,
                          keyboardType: TextInputType.emailAddress, isPassField: false, textFieldTitle: '      Enter your email', col: Colors.white, icon: Icon(Icons.abc,color: Colors.transparent),),
                      ),Padding(
                        padding: const EdgeInsets.only(left: 30.0,top: 12),
                        child: Text("Phone NO", style: TextStyle(color: Color(0xff0A0A0A),
                            fontWeight: FontWeight.w600,fontSize: 18)),
                      ),Padding(
                        padding: const EdgeInsets.only(left: 27.0,right: 20.0,top: 7),
                        child:

                        CustomTextFormField(controller:controller.phoneNumber_controller , onChange: controller.onChanged, validator:controller.phoneNumberValidator, keyboardType:TextInputType.phone, isPassField:false, textFieldTitle:"     Enter your Phone-no", col: Colors.white, icon: Icon(Icons.abc,color: Colors.transparent),),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 30.0,top: 12),
                        child: Text("Password", style: TextStyle(color: Color(0xff0A0A0A),
                            fontWeight: FontWeight.w600,fontSize: 18)),
                      ),Padding(
                        padding: const EdgeInsets.only(left: 27.0,right: 20.0,top: 7),
                        child:

                        CustomTextFormField(controller: controller.password_controller, onChange: controller.onChanged, validator: controller.passwordValidator, keyboardType:TextInputType.visiblePassword, isPassField:true, textFieldTitle:"     Enter your password", col: Colors.white, icon: Icon(Icons.abc,color: Colors.transparent),),
                      ),Padding(
                        padding: const EdgeInsets.only(left: 30.0,top: 12),
                        child: Text("Confirm Password", style: TextStyle(color: Color(0xff0A0A0A),
                            fontWeight: FontWeight.w600,fontSize: 18)),
                      ),Padding(
                        padding: const EdgeInsets.only(left: 27.0,right: 20.0,top: 7),
                        child:

                        CustomTextFormField(controller: controller.confirm_password_controller, onChange: controller.onChanged, validator: controller.confirmValidator, keyboardType:TextInputType.visiblePassword, isPassField:true, textFieldTitle:"     Re-enter password", col: Colors.white, icon: Icon(Icons.abc,color: Colors.transparent),),
                      )
                      ,Padding(
                        padding: const EdgeInsets.only(left: 65.0,top: 30),
                        child: CustomButton(text: 'Sign Up', onpressed: () {
                          controller.signUp();
                          }, col: Colors.white,),
                      ),Row(crossAxisAlignment: CrossAxisAlignment.end,mainAxisAlignment: MainAxisAlignment.center,children: [Padding(
                        padding: const EdgeInsets.only(bottom: 18.0),
                        child: Text("Already have an account!!",style: TextStyle(color: Color(0xff0A0A0A).withOpacity(0.8),fontWeight: FontWeight.w500),),
                      ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 5.0),
                          child: TextButton(onPressed: (){Get.to(()=>SignIn());}, child: Text("Sign in",style: TextStyle(color: Color(0xff666666),fontWeight: FontWeight.w900),)),
                        )],)],),
                ),
              ),),
            ],),
        ));
      },

    );
  }}