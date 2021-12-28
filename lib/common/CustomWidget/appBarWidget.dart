import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:motherclub/common/Constant/ColorConstants.dart';

Widget AppBarWidget(String Label,double height , double width,BuildContext context){

  return
    Container(
        height: height,
        width: width,
        color: white_color,
        padding: EdgeInsets.fromLTRB(16, height/24.2, 10, 0),
        child:
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Row(
                children: [
                  Stack(children:[
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Image.asset('assets/images/sort.png',height: 37,width: 37,)),

                    Positioned(
                     child:
                         Image.asset('assets/images/logo.png',width: 136,height: 87,),


                     ),

                  ]),
                  Text(Label,style: GoogleFonts.roboto(
                 fontSize: 20,
                 fontWeight: FontWeight.w700,
                 color: Black_textColor),),
                  // Image.asset('assets/images/logo.png',width: 120,height: 87,),

                ],
              ),


           ] ),

            Row(
              children: [
                Icon(Icons.search),
                SizedBox(width: 20,),
                Image.asset('assets/images/translate.png'),
              ],
            ),

          ],
        ));
}