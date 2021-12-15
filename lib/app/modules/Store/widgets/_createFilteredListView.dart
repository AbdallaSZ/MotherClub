import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:motherclub/app/Models/ProductDetailsModel.dart';
import 'package:motherclub/app/Models/ProductModel.dart';
import 'package:motherclub/common/Constant/ColorConstants.dart';
import 'package:motherclub/common/Utils/Utils.dart';

Widget createFilteredListView(List<ProductDetailsModel> data) {
  return new Flexible(
    child: data.length==0? Container(
      alignment: Alignment.center,
      height: Utils.deviceHeight,
      child: Text(Utils.labels!.no_Products_Found),
    ):  GridView.builder(
      itemCount:data.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount:  2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
        childAspectRatio: (.53 ),
      ),
      itemBuilder: (context,index,) {
        return Container(
          padding: EdgeInsets.only(left: 10),
          width: Utils.deviceWidth/2.3,
          height: Utils.deviceWidth/2.98,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: white_color,),

          child: SingleChildScrollView(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:[
                  SizedBox(height:23),
                  Image.network('${data[index].images![0].src}',height: 130,width: 155,),
                  SizedBox(height:15),

                  Text("${data[index].name}",style: GoogleFonts.roboto(
                    fontSize: 13,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w500,
                    color: Black_textColor,

                  ),
                  ),
                  SizedBox(height:15),
                  Text(Utils.labels!.amd+" ${data[index].price}",style: GoogleFonts.roboto(
                    fontSize: 18,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w700,
                    color: Black_textColor,

                  )
                  ),
                  SizedBox(height:10),
                  Container(
                    alignment: Alignment.bottomRight,
                    padding: EdgeInsets.only(right: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Icon(Icons.favorite_border,size: 28,),
                        SizedBox(width:15),
                        Container(
                          width: 40,
                          height:40,

                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25.0),
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

                            // gradient: colorsConstants.gradient1
                          ),
                          child: Icon(Icons.add_shopping_cart,color: Colors.white,),


                        ),
                      ],
                    ),
                  ),

                ]),
          ),
        );
      },
    ),
  );
}