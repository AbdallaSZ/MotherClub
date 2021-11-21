import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:motherclub/common/Constant/ColorConstants.dart';

Widget InfoWidget(String Label,String Label2,String label3,String label4,double height , double width,BuildContext context){

  return
    Container(
        height: height,
        width: width,
        // color: white_color,
        decoration: BoxDecoration(
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
              ]),
        ),
        padding: EdgeInsets.fromLTRB(18, 9, 7, 9),
        child:

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                      Container(
                        // padding: EdgeInsets.fromLTRB(18, 13, 10, 0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(Label,style: GoogleFonts.roboto(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                fontStyle: FontStyle.normal,
                                letterSpacing: 0.25,
                                color: white_color),),
                            SizedBox(height:3),
                            Text(Label2,style: GoogleFonts.roboto(
                                fontSize:13,
                                fontWeight: FontWeight.w400,
                                fontStyle: FontStyle.normal,
                                letterSpacing: 0.25,
                                color: white_color),),

                          ],
                        ),
                      ),
                     Container(
                       padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
                       height: 59,
                       width: 48,
                       decoration: BoxDecoration(border: Border.all(
                         color: white_color,
                         width: 1
                       ),
                         borderRadius: BorderRadius.circular(10)
                       ),
                       child: Column(
                         children: [
                           Text(label3,style: GoogleFonts.roboto(
                               fontSize: 12,
                               fontWeight: FontWeight.w400,
                               fontStyle: FontStyle.normal,
                               color: white_color),),
                           SizedBox(height:1),
                           Text(label4,style: GoogleFonts.roboto(
                               fontSize:18,
                               fontWeight: FontWeight.w500,
                               fontStyle: FontStyle.normal,
                               color: white_color),),

                         ],
                       ),
                     )







          ],
        )
    );
}