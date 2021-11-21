import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:motherclub/common/Constant/ColorConstants.dart';
import 'package:motherclub/common/Utils/RandomColorModel.dart';

Widget SliverListWidget(){

  return Container(
    padding:EdgeInsets.fromLTRB(10,10,10,10),
    child: CustomScrollView(
      slivers: <Widget>[

        SliverToBoxAdapter(
          child: Container(
            height: 120.0,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 5,
              itemBuilder: (context, index) {
                return Container(
                  padding: EdgeInsets.all(8),
                  color: Colors.white,
                  child: Container(
                      // decoration: BoxDecoration(color: Colors.blueGrey),
                      height:117,
                      width:84.38,
                      child:Column(
                          children:[
                            Container(
                              height:66.66 ,
                              width: 78.47,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: RandomColorModel().getColor().withOpacity(0.3),
                              ),
                              child: Image.asset('assets/images/Category_image.png'),
                            ),
                            SizedBox(height:3),

                            Text("Your Pregnancy",style: GoogleFonts.roboto(
                                fontSize: 13,
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.w500,
                                color: Black_textColor,

                            ),textAlign: TextAlign.center,
                            ),
                          ]
                      )
                  ),
                );
              },
            ),
          ),
        ),


           SliverList(
          delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
    // To convert this infinite list to a list with three items,
    // uncomment the following line:
    // if (index > 3) return null;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: white_color,

        ),
         height: 98.0,width: 394,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Image.asset('assets/images/home_listimage.png',height: 98,width: 98,),
              SizedBox(width: 20,),
              Text("Thiamine (Vitamin B1) in\n your diet \nduring pregnancy",style: GoogleFonts.roboto(
                fontSize: 13,
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.w500,
                color: Black_textColor,

              ),
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.only(right: 10),
            child: CircleAvatar(
              backgroundColor: Colors.pinkAccent,
              radius: 18.0,
              child: Icon(
                Icons.arrow_right_alt,
                size: 30.0,
                color:white_color,
              ),
            ),
          ),
        ],
      ),
      ),
    );

    },
    // Or, uncomment the following line:
    childCount: 3,

    ),
    ),

        SliverToBoxAdapter(
          child: Container(
            height: 300.0,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 5,
              itemBuilder: (context, index) {
                return Container(
                  padding: EdgeInsets.all(2),
                  color: Colors.yellow,
                  child: Container(
                    decoration: BoxDecoration(color: Colors.blueGrey),
                      height:117,
                      width:180,
                      child:Column(

                          children:[
                            SizedBox(height:23),
                            Image.asset('assets/images/product_image.png',height: 130,width: 155,),
                            SizedBox(height:15),

                            Text("Maternity Bladder Control Pads",style: GoogleFonts.roboto(
                              fontSize: 13,
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w500,
                              color: Black_textColor,

                            )
                            ),
                            SizedBox(height:15),
                            Text("AMD 150.00",style: GoogleFonts.roboto(
                              fontSize: 13,
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w500,
                              color: Black_textColor,

                            )
                            ),
                            SizedBox(height:10),
                            Container(
                              padding: EdgeInsets.only(right: 10),
                              child: CircleAvatar(
                                backgroundColor: Colors.pinkAccent,
                                radius: 22.0,
                                child: Icon(
                                  Icons.add_shopping_cart_outlined,
                                  size: 30.0,
                                  color:white_color,
                                ),
                              ),
                            ),
                          ]
                      )
                  ),
                );
              },
            ),
          ),
        ),
      
      ],
    ),
  );
}