import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:motherclub/app/Shimmers/CustWidget.dart';
import 'package:motherclub/common/Constant/ColorConstants.dart';

class GridShimmer extends StatelessWidget{
  double deviceWidth;
  double deviceHeight;

  GridShimmer({required this.deviceWidth,required this.deviceHeight});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GridView.builder(
      itemCount:10,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount:  2,
       // crossAxisSpacing: 20,
       // mainAxisSpacing: 20,
       // childAspectRatio: (.53 ),
      ),
      itemBuilder: (context,index,) {
        return Container(
          padding: EdgeInsets.only(left: 10),
          width: deviceWidth/2.3,
          height: deviceHeight/4,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: white_color,),

          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children:[
                  CustWidget.square(deviceWidth/4, deviceHeight/10),
                  SizedBox(height:10),
                  CustWidget.rectangular(deviceWidth, deviceHeight/60),
                  SizedBox(height:10),
                  CustWidget.rectangular(deviceWidth, deviceHeight/60),
                  SizedBox(height:10),
                  Container(
                    alignment: Alignment.bottomRight,
                    padding: EdgeInsets.only(right: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                       // CustWidget.circular(height: deviceHeight/10),
                        SizedBox(width:15),
                      // CustWidget.circular(height: deviceHeight/10),
                      ],
                    ),
                  ),

                ]),
          ),
        );
      },
    );
  }

}