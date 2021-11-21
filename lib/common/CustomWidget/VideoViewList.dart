import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:motherclub/common/Constant/ColorConstants.dart';

Widget VideoView(){
  
  return Container(
    margin:EdgeInsets.all(10) ,
    padding: EdgeInsets.all(10),
    decoration: BoxDecoration(
      color: Colors.white,
        
        borderRadius: BorderRadius.all(Radius.circular(10))),
    child: Column(
      children: [
        Text('We are pleased to join your journey and provide you with free knowledge and medical tips week by week as your pea-pod develops into a full-grown sweet baby.',style: GoogleFonts.roboto(fontSize: 14,fontWeight: FontWeight.w400,color:Colors.black)),
        Divider(height: 10,color: Colors.transparent,),
        Stack(
          alignment: Alignment.center,
          children: [
          Image.asset('assets/images/Rectangle.png'),
          Icon(Icons.play_circle_filled_outlined,color: Colors.white,size: 35,)
        ],),
        Divider(height: 10,color: Colors.transparent,),
        Align(
          alignment: Alignment.centerLeft,
            child: Text('11 Weeks Pregnancy Helps',style: GoogleFonts.roboto(fontSize: 12,fontWeight: FontWeight.normal,color:Colors.black))),


      ],
    ),
  );

}