import 'package:flutter/material.dart';
import 'package:motherclub/common/Constant/ColorConstants.dart';

Widget EditTextwidget(String Lable,TextEditingController textEditingController,BuildContext context){

  return Container(
    alignment: Alignment.center,
    decoration: BoxDecoration(
      color: Edit_textColor,
      borderRadius: BorderRadius.all(Radius.circular(10)),
      border: Border.all(
        color:Edit_textColor,
      ),
    ),
    child: TextField(
      controller:  textEditingController,
      decoration: InputDecoration(
        border: InputBorder.none,
        focusedBorder: InputBorder.none,
        enabledBorder: InputBorder.none,
        errorBorder: InputBorder.none,
        disabledBorder: InputBorder.none,
        labelText: Lable,labelStyle: Theme.of(context).textTheme.bodyText2,
        // suffixIcon:  Icon(IconButton,color: Black_textColor,),
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
      ),
    ),
  );
}