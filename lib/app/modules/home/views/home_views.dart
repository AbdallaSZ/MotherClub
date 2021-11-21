import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:motherclub/app/modules/home/controllers/home_controllers.dart';
import 'package:motherclub/app/modules/home/widgets/appBarWidget.dart';
import 'package:motherclub/common/Constant/ColorConstants.dart';



class HomeView extends GetResponsiveView<HomeController> {

  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    double deviceWidth = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor:Colors.white ,
          title: Container(
            child: Row(
              children: [
                Align(
                    alignment: Alignment.centerLeft,
                    child: Image.asset('assets/images/sort.png',height: 37,width:  deviceWidth/14,)),

                Image.asset('assets/images/logo.png',width: deviceWidth/5,height: deviceHeight/8,),
                Text('',style: GoogleFonts.roboto(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: Black_textColor),),
                // Image.asset('assets/images/logo.png',width: 120,height: 87,),

              ],
            ),
          ),
          actions: [
            Icon(Icons.search,color: Colors.black87,),
            SizedBox(width: 20,),
            Image.asset('assets/images/translate.png'),

          ],
        ),
        body:
        HomeAppBar("",deviceHeight/9.4,deviceWidth,context),

                    // AppBarWidget("",deviceHeight/9.4,deviceWidth,context),
                    // InfoWidget("Hi, Amara Moussa","You are pregnant for","Week","9-12",deviceHeight/11.6,deviceWidth,context)


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