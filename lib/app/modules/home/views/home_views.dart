import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:motherclub/app/modules/home/controllers/home_controllers.dart';
import 'package:motherclub/app/modules/home/widgets/appBarWidget.dart';
import 'package:motherclub/common/Constant/ColorConstants.dart';
import 'package:motherclub/common/CustomWidget/statless/custom_appbar.dart';


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
// Container(
// padding: EdgeInsets.all(8),
// color: Colors.yellow,
// child: Container(
// decoration: BoxDecoration(borderRadius: BorderRadius.circular(8),color: Colors.blueGrey),
// height:117,
// width:84.38,
// child:Column(
// children:[
// Image.asset('assets/images/Category_image.png'),
// Text("Your Pregnancy",style: GoogleFonts.roboto(
// fontSize: 13,
// fontStyle: FontStyle.normal,
// fontWeight: FontWeight.w500,
// color: Black_textColor),
// ),
// ]
// )
// ),
// );