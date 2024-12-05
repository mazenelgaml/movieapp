
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import '../../../widgets/custom_elevated_button.dart';
import '../../../widgets/custom_text_form_field.dart';
import '../sign_in/sign_in_screen.dart';
import 'forget_password_controller.dart';
import 'package:get/get.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<forgetpasswordcontroller>(
        init: forgetpasswordcontroller(),
        builder: (forgetpasswordcontroller controller) {
          return Scaffold(
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 150, top: 70),
                    child: Row(
                      children: [
                        IconButton(
                          icon: Icon(
                            Icons.keyboard_backspace_sharp,
                            size: 33,
                          ),
                          onPressed: () {},
                        ),
                        SizedBox(width: 10),
                        Text(
                          'Forget Password',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 0.0),
                    child: Center(
                      child: Container(
                        height: 250,
                        width: 250,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(
                                "assets/images/Group 8.png"),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: 400,
                    height: 480,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          blurRadius: 15.0,
                        ),
                      ],
                      color: Colors.white,
                      border: Border(top: BorderSide(color: Colors.white)),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(35),
                        topRight: Radius.circular(35),
                      ),
                    ),
                    child: Form(
                      key: controller.formkey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 30.0, top: 55),
                            child: Text(
                              "Email",
                              style: TextStyle(
                                color: Color(0xff0A0A0A),
                                fontWeight: FontWeight.w700,
                                fontSize: 20,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 20, right: 10, top: 10.0),
                            child: CustomTextFormField(
                              controller: controller.email_controller,
                              onChange: controller.onChanged,
                              validator: controller.emailValidator,
                              keyboardType: TextInputType.emailAddress,
                              isPassField: false,
                              textFieldTitle: "  Enter your email",
                              col: Colors.white,
                              icon: Icon(Icons.abc,
                                  color: Colors.transparent),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 50.0, top: 100),
                            child: CustomButton(
                              text: 'Send',
                              onpressed: () {controller.resetPassword();},
                              col: Colors.white,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 150, right: 10, top: 5.0),
                            child: TextButton(
                              onPressed: () {Get.to(()=>SignIn());},
                              child: Text(
                                "Back to Login",
                                style: TextStyle(
                                    color: Colors.grey.shade800,
                                    fontWeight: FontWeight.w900),
                              ),
                            ),
                          )],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}