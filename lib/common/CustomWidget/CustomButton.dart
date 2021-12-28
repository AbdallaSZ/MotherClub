import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:motherclub/common/Constant/ColorConstants.dart';

Widget CustomBUttonWidget(String Label,double height , double width,BuildContext context ,
    {onTap}){

  return
    GestureDetector(
      onTap: onTap,
      child: Container(
          height: height,
          width: width,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(7.0),
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                stops: [0.0,0.1,10.0],
                colors: [
                  // Colors.deepPurple.shade400,
                  CustomButton_Color,
                  CustomButton_Color,
                  CustomButton_Second_Color,
                  // Colors.deepPurple.shade200,
                ],
              //   begin: Alignment.centerLeft,
              //   end: Alignment.centerRight,
              // colors: [
              //   CustomButton_Color,
              //   CustomButton_Color,
              //
              //   CustomButton_Second_Color
              // ]
            ), ),
          padding: EdgeInsets.fromLTRB(10, height/10, 10, 0),
          child:

              Center(child: Text(Label,style: GoogleFonts.roboto(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: white_color),
                textAlign: TextAlign.center,)),



          ),
    );
}