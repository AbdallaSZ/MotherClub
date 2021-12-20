import 'package:flutter/material.dart';
import 'dart:ui' as ui;

import 'package:motherclub/common/Constant/ColorConstants.dart';

Widget CustomLogoWidget(String Label,double height , double width,BuildContext context){

  return
    Container(
    padding: EdgeInsets.fromLTRB(10, height/18, 10, 0),
    child:
    Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(Icons.arrow_back,size: 33,),
                SizedBox(width:10),
                Text(Label),
              ],
            ),

            Image.asset('assets/images/translate.png')
          ],
        ),
        Container(
          height:height/1.34,
          width: width/1.2,
          alignment: Alignment.center,

          decoration: BoxDecoration(image: DecorationImage(
            image: AssetImage("assets/images/logo.png"),
            //fit: BoxFit.fill
          )
          ),
        ),
      ],
    ));
}