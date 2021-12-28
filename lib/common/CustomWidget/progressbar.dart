/*
import 'package:awesome_loader/awesome_loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:motherclub/common/Utils/Utils.dart';
import 'package:progress_indicators/progress_indicators.dart';
Widget progress(String label,BuildContext context){
  showGeneralDialog(
    context: context,
    barrierColor: Colors.black12.withOpacity(0.6), // Background color
    barrierDismissible: false,
    barrierLabel: 'Dialog',
    transitionDuration: Duration(milliseconds: 400), // How long it takes to popup dialog after button click
    pageBuilder: (_, __, ___) {
      // Makes widget fullscreen
      return Container(
        alignment: Alignment.center,
        height: Utils.deviceHeight,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            AwesomeLoader(
              loaderType: AwesomeLoader.AwesomeLoader3,
              color: Colors.red,
            ),
            Divider(height: 8,color: Colors.transparent,),
            JumpingText('$label',style: TextStyle(color: Colors.white,wordSpacing: 2,fontStyle: FontStyle.normal,decoration: TextDecoration.none,fontSize: 15),),
          ],
        ),
      )??Container();
    },
  );
}*/
