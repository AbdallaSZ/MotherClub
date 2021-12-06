import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:motherclub/app/modules/splash/controllers/splash_controllers.dart';
import 'package:motherclub/common/Constant/ColorConstants.dart';
import 'package:motherclub/common/Utils/Utils.dart';


class SplashView extends GetView<SplashController> {
  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    double deviceWidth = MediaQuery.of(context).size.width;
    Utils.initializeLocality(context,myWidth: deviceWidth , myHeight: deviceHeight);
    Utils.initializePref();
    Utils.deviceHeight = MediaQuery.of(context).size.height;
    Utils.deviceWidth = MediaQuery.of(context).size.width;
    Utils.horizontalMargin = MediaQuery.of(context).size.height / 20;
    Utils.verticalMargin = MediaQuery.of(context).size.height / 70;

    return Scaffold(
      backgroundColor: Background_Color,
      body: Container(
        padding: EdgeInsets.only(top: deviceHeight/4.2),
        height: deviceHeight,
        width: deviceWidth,
        child: Column(
          children: [
            Container(
              width: deviceWidth,
              height: deviceHeight/3.4,
              child: Image.asset('assets/images/logo.png'),
            ),
            Text(Utils.labels!.splash_phrase,
              style: Theme.of(context).textTheme.bodyText2,
              textAlign: TextAlign.center,
            )

          ],
        ),

      )
    );
  }
}
