import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:motherclub/app/Models/baby_model.dart';
import 'package:motherclub/app/modules/Expert_Blogs/views/blog_views.dart';

import 'package:motherclub/common/Constant/ColorConstants.dart';

import 'package:motherclub/common/Utils/Utils.dart';
import 'package:size_helper/size_helper.dart';
import 'package:html/parser.dart';
Widget ResorcesListCard(Post post, context) {
  String _parseHtmlString(String htmlString) {
    final document = parse(htmlString);
    final String parsedString = parse(document.body!.text).documentElement!.text;

    return parsedString;
  }
  return Container(
    margin: EdgeInsets.only(top: 10),
    padding: EdgeInsets.only(right: 10),
    height: SizeHelper.of(context).help(
      mobileSmall: 80,
      mobileNormal: 90,
      mobileLarge: 100,
      tabletNormal: 120,
      tabletExtraLarge: 140,
      desktopLarge: 180,
    ),
    width: Utils.deviceWidth,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0), color: Colors.white),
    child: GestureDetector(
      onTap: () {
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
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: Image.network(
                  post.image!,
                  fit: BoxFit.fitHeight,
                  scale: SizeHelper.of(context).help(
                    mobileSmall: .5,
                    mobileNormal: .4,
                    mobileLarge: .3,
                    tabletNormal: .2,
                    tabletExtraLarge: .1,
                    desktopLarge: .09,
                  ),
                ),
              )),
          // child: Image.network("${post.sourceImage!}"),),
          Flexible(
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  _parseHtmlString(post.title!.rendered!),
                  style: TextStyle(
                      fontSize: SizeHelper.of(context).help(
                        mobileSmall: 10,
                        mobileNormal: 12,
                        mobileLarge: 14,
                        tabletNormal: 16,
                        tabletExtraLarge: 18,
                        desktopLarge: 20,
                      ),
                      fontWeight: FontWeight.bold),
                ),
                Divider(
                  height: 5,
                  color: Colors.transparent,
                ),
                Text('${post.content!.rendered!.substring(0, 30)} .......',
                    style: GoogleFonts.roboto(
                        fontSize: SizeHelper.of(context).help(
                          mobileSmall: 6,
                          mobileNormal: 8,
                          mobileLarge: 10,
                          tabletNormal: 12,
                          tabletExtraLarge: 14,
                          desktopLarge: 16,
                        ),
                        fontWeight: FontWeight.normal,
                        color: Black_textColor,),),
              ],
            ),
          ),
          // Flexible(
          //   flex: 1,
          //   child: Container(
          //    // padding: EdgeInsets.only(right: 10),
          //     width: 40,
          //     height:40,
          //
          //     decoration: BoxDecoration(
          //       borderRadius: BorderRadius.circular(25.0),
          //       gradient: LinearGradient(
          //         /* begin: FractionalOffset.topCenter,
          //         end: FractionalOffset.bottomCenter,*/
          //           colors: [
          //             CustomButton_Color,
          //             CustomButton_Second_Color
          //           ]),
          //
          //       // gradient: colorsConstants.gradient1
          //     ),
          //     child: Icon(Icons.arrow_forward_outlined,color: Colors.white,),
          //
          //
          //   ),
          // )
        ],
      ),
    ),
  );
}
