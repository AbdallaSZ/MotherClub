

import 'package:flutter/material.dart';
import 'package:progress_indicators/progress_indicators.dart';

class ConfigDialog{


  void showDailog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return WillPopScope(
            onWillPop: () async => false,
            child: AlertDialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8.0))
              ),
              backgroundColor: Colors.white,
              content: Container(
                height: 50,
                alignment: Alignment.center,
                  child: JumpingText('Loading...',style: TextStyle(color: Colors.pink),)),
            )
        );
      },
    );
  }

  void hideOpenDialog(BuildContext context) {
    Navigator.of(context).pop();
  }
}