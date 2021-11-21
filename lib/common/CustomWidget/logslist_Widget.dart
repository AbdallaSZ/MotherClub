import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:motherclub/common/Constant/ColorConstants.dart';
import 'package:motherclub/common/Utils/RandomColorModel.dart';

Widget Bloglist_Widget(double height , double width,BuildContext context){

  return
    Container(

      margin: EdgeInsets.only(top: 10,left: 5),
      padding: EdgeInsets.only(right: 10,left: 10),
      height: height/6.5,
      width: width,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade50,
              blurRadius: 8,
              spreadRadius: 4,
              offset: Offset(0, 10),
            ),
          ],
          color: Colors.white/*RandomColorModel().getColor().withOpacity(0.5)*/ ),
      child: Row(
        //crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
              flex: 2,

              child: Container(
                decoration: BoxDecoration(
                  color: Colors.black12,
                  borderRadius: BorderRadius.circular(50.0),),
                  child: Image.asset('assets/images/RectangleDemo2.png'))),
          Flexible(
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Dr. Safeena Anas',style: GoogleFonts.roboto(fontSize: 12,fontWeight: FontWeight.normal,color: redTextColor)),
                Divider(height: 5,color: Colors.transparent,),
                Text('Your Pregnancy',style:  Theme.of(context).textTheme.headline3),
                Divider(height: 5,color: Colors.transparent,),
                Text('Free knowledge and medical tips week by week as your pea-pod develops...',style: GoogleFonts.roboto(fontSize: 13,fontWeight: FontWeight.normal,color: Black_textColor)),
                Divider(height: 10,color: Colors.transparent,),
                Align(
                  alignment: Alignment.centerRight,
                    child: Text('Sep 15, 2021',style: GoogleFonts.roboto(fontSize: 12,fontWeight: FontWeight.normal,color: Colors.grey))),

              ],),
          ),



        ],),



    );
}