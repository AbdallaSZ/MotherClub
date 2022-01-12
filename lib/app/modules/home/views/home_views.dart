import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:motherclub/app/modules/home/controllers/home_controllers.dart';
import 'package:motherclub/app/modules/home/widgets/appBarWidget.dart';



class HomeView extends GetResponsiveView<HomeController> {

  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery
        .of(context)
        .size
        .height;
    double deviceWidth = MediaQuery
        .of(context)
        .size
        .width;

    return SafeArea(
      child: Scaffold(
        body:
        homeAppBar("", deviceHeight / 9.4, deviceWidth, context),
      ),
    );
  }
}
