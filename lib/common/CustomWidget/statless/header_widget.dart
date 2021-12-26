import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:motherclub/common/Constant/ColorConstants.dart';
import 'package:motherclub/common/Utils/Utils.dart';
import 'package:size_helper/size_helper.dart';

Widget HeaderWidget(BuildContext context, String title) {
  return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            stops: [
              0.0,
              0.1,
              10.0
            ],
            colors: [
              // Colors.deepPurple.shade400,
              CustomButton_Color,
              CustomButton_Color,
              CustomButton_Second_Color,
              // Colors.deepPurple.shade200,
            ]),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: ListTile(

          leading: GestureDetector(
            onTap: (){Navigator.pop(context);},
            child: Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            ),
          ),
          title:   Text(
            title,
            style: GoogleFonts.roboto(
              fontSize: SizeHelper.of(context).help(
                mobileSmall: 8,
                mobileNormal: 10,
                mobileLarge: 12,
                tabletNormal: 14,
                tabletExtraLarge: 16,
                desktopLarge: 18,
              ),
              color: Colors.white,
              fontWeight: FontWeight.w400,
              fontStyle: FontStyle.normal,
              letterSpacing: 0.25,
            ),
          ),


          trailing: Image.asset('assets/images/logo.png',fit: BoxFit.fill,scale: 4  ,color: Colors.white,),
          // isThreeLine: true,
        ),
        // child: Row(
        //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //   children: [
        //     Icon(Icons.arrow_back_ios,color: Colors.white,),
        //     Text(
        //       title,
        //       style: GoogleFonts.roboto(
        //           fontSize: SizeHelper.of(context).help(
        //             mobileSmall: 6,
        //             mobileNormal: 8,
        //             mobileLarge: 10,
        //             tabletNormal: 12,
        //             tabletExtraLarge: 14,
        //             desktopLarge: 16,
        //           ),
        //           fontWeight: FontWeight.w400,
        //           fontStyle: FontStyle.normal,
        //           letterSpacing: 0.25,
        //           color: white_color),
        //     ),
        //     Image.asset('assets/images/logo.png',fit: BoxFit.contain,height: 130  ,width: 130,color: Colors.white,),
        //   ],
        // ),
      ));
}
