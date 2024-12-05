import'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({Key? key, required this.controller, required this.onChange, required this.validator, required this.keyboardType, required this.isPassField, required this.textFieldTitle, required this.col, required this.icon}) : super(key: key);
  final TextEditingController controller;
  final Function(String) onChange;
  final String?Function(String?) validator;
  final TextInputType keyboardType;
  final bool isPassField;
  final String textFieldTitle;
  final Color col ;
  final Icon icon;
  @override
  Widget build(BuildContext context) {
    return TextFormField(validator: validator,controller: controller,onChanged: onChange,obscureText: isPassField,keyboardType: keyboardType,
        decoration:InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 15.0),
          suffixIcon: icon,
          hintText:"${textFieldTitle}",hintStyle:
        TextStyle(color:  Color(0xff0A0A0A).withOpacity(0.7),
            fontWeight: FontWeight.w400,fontSize: 17)
          ,focusedBorder:OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),borderSide:
        BorderSide(color:Color(0xff0A0A0A),width: 1.5 ))
          ,hoverColor: Colors.white,fillColor: Colors.white,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(15),borderSide:
          BorderSide(color: Color(0xff0A0A0A),width:1.5)),
          enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(15),borderSide: BorderSide(color: Color(0xff0A0A0A),width: 1.5)),
        ) );
  }
}
