import 'package:flutter/material.dart';
import 'package:motherclub/common/Constant/ColorConstants.dart';

Widget SocialButtonWidget(String image,BuildContext context,height,width){

  return Container(
    height: height,
    width: width,
    alignment: Alignment.center,
    decoration: BoxDecoration(
      color: Edit_textColor,
      borderRadius: BorderRadius.all(Radius.circular(10)),
      border: Border.all(
        color:Colors.black,
        width: 1,
      ),
    ),
    child: Image.asset(image,height: 26,width: 94,)
  );
}