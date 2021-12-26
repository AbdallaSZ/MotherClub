import 'package:flutter/material.dart';

class Dialogs {
  static AlertDialog warningDialog (String title , String message ,String dismissText , Function dismissAction , ){
    return AlertDialog(
      title:Text( title, style: TextStyle(color: Colors.red.shade900),),
      content: Text(message),
      backgroundColor: Colors.white,
      actions: [
        FlatButton(onPressed:(){
          dismissAction();
        } , child: Text(dismissText,style: TextStyle(color: Colors.red.shade900))),
      ],
    );
  }
}