import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:motherclub/app/Models/baby_model.dart';
import 'package:motherclub/app/modules/Expert_Blogs/views/blog_views.dart';

import 'package:motherclub/common/Constant/ColorConstants.dart';

import 'package:motherclub/common/Utils/Utils.dart';

Widget ResorcesListCard(Post post,context){

  return
    Container(
      margin: EdgeInsets.only(top: 10),
      padding: EdgeInsets.only(right: 10),
      height: Utils.deviceHeight/7,
      width: Utils.deviceWidth,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.0),
        color: Colors.white/*RandomColorModel().getColor().withOpacity(0.5)*/ ),

      child: GestureDetector(
        onTap: (){
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => BlogViews(post)),
          );
        },
        child: Row(
          //crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
          Flexible(
            flex: 2,
              child: Image.network("https://image.freepik.com/free-photo/cute-young-girl-drinking-juice_23-2148305302.jpg"),),
              // child: Image.network("${post.sourceImage!}"),),
          Flexible(
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              Text(post.title!.rendered!,style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
              Divider(height: 5,color: Colors.transparent,),
              Text('${post.content!.rendered!.substring(0,30)} .......',style: GoogleFonts.roboto(fontSize: Utils.deviceHeight/58,fontWeight: FontWeight.normal,color: Black_textColor)),
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