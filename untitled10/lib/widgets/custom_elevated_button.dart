import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({Key? key,required this.onpressed,required this.text, required this.col}) : super(key: key);
  final void Function()  onpressed;
  final String text;
  final Color col;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,width: 300,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(shape:RoundedRectangleBorder
            (borderRadius:BorderRadius.only(topLeft:Radius.circular(50)
              ,bottomRight: Radius.circular(50),
              topRight:Radius.circular(20),
              bottomLeft:Radius.circular(20))), backgroundColor: Color(0xff666666).withOpacity(1)),
          onPressed: onpressed, child:
      Text("${text}",style: TextStyle(fontSize: 17,color:col,fontWeight:FontWeight.w900),)),
    );
  }
}