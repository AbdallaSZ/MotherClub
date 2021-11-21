import 'package:flutter/cupertino.dart';
import 'package:motherclub/app/Shimmers/CustWidget.dart';
import 'package:motherclub/common/Constant/ColorConstants.dart';

Widget FurmShimmer(double height , double width,BuildContext context){

  return Container(
    padding: EdgeInsets.only(left: 10),
    width: width/2.3,
    //height: 117,
    decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: white_color,),

    child: SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children:[
             // CustWidget.square(width/4, height),
              //SizedBox(height:10),
              CustWidget.rectangular(width, 3),
              SizedBox(height:5),
              CustWidget.rectangular(width, 3),
              SizedBox(height:5),
              CustWidget.rectangular(width, 3),
              SizedBox(height:5),
              CustWidget.rectangular(width, 3),
              SizedBox(height:5),
             /* Container(
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
              ),*/

            ]),
      ),
    ),
  );


}