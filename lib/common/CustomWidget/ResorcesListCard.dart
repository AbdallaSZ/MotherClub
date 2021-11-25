import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:motherclub/app/routes/app_pages.dart';
import 'package:motherclub/common/Constant/ColorConstants.dart';
import 'package:motherclub/common/Utils/RandomColorModel.dart';
import 'package:motherclub/common/Utils/Utils.dart';

Widget ResorcesListCard(double height , double width,BuildContext context,String slug){

  return
    Container(
      margin: EdgeInsets.only(top: 10),
      padding: EdgeInsets.only(right: 10),
      height: height/8,
      width: width,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.0),
        color: Colors.white/*RandomColorModel().getColor().withOpacity(0.5)*/ ),

      child: GestureDetector(
        onTap: (){
          Get.toNamed(Routes.BLOG);
        },
        child: Row(
          //crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
          Flexible(
            flex: 2,

              child: Image.asset('assets/images/RectangleDemo.png')),
          Flexible(
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              Text(Utils.labels!.your_Pregnancy,style:  Theme.of(context).textTheme.headline3),
              Divider(height: 5,color: Colors.transparent,),
              Text('Free knowledge and medical tips week by week as your pea-pod develops...',style: GoogleFonts.roboto(fontSize: Utils.deviceHeight/58,fontWeight: FontWeight.normal,color: Black_textColor)),

            ],),
          ),
          Flexible(
            flex: 1,
            child: Container(
             // padding: EdgeInsets.only(right: 10),
              width: 40,
              height:40,

              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25.0),
                gradient: LinearGradient(
                  /* begin: FractionalOffset.topCenter,
                  end: FractionalOffset.bottomCenter,*/
                    colors: [
                      CustomButton_Color,
                      CustomButton_Second_Color


                    ]),

                // gradient: colorsConstants.gradient1
              ),
              child: Icon(Icons.arrow_forward_outlined,color: Colors.white,),


            ),
          )


        ],),
      ),




    );
}