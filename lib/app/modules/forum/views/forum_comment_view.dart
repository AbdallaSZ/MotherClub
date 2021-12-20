import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:motherclub/app/Models/FormsModel.dart';
import 'package:motherclub/app/Models/baby_model.dart';
import 'package:motherclub/app/Models/replies_model.dart';
import 'package:motherclub/common/Constant/ColorConstants.dart';
import 'package:motherclub/common/CustomWidget/statless/custom_appbar.dart';
import 'dart:ui' as ui;
import 'package:motherclub/common/Utils/Utils.dart';
import 'package:size_helper/size_helper.dart';

import 'all_comments_screen.dart';

class ForumCommentView extends StatelessWidget {
  ForumCommentView({required this.formsModel});

  final FormsModel formsModel;

  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    double deviceWidth = MediaQuery.of(context).size.width;
    return SafeArea(
        child: Scaffold(
      appBar: CustomAppBar(withBackButton: true,onBackButtonPressed: (){Navigator.pop(context);},),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(

            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 15),
                height: SizeHelper.of(context).help(
                  mobileSmall: 190,
                  mobileNormal: 200,
                  mobileLarge: 250,
                  tabletNormal: 300,
                  tabletExtraLarge: 350,
                  desktopLarge: 500,
                ),
                width: deviceWidth,
                child: Card(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7.0),
                      // color: Colors.blue,
                    ),
                    padding:
                        EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                    child: Column(

                      children: [
                        Container(
                          // padding:EdgeInsets.fromLTRB(15,17,10,0),
                          child: Text("${this.formsModel.title!.rendered}",
                              style: GoogleFonts.roboto(
                                fontSize: SizeHelper.of(context).help(
                                  mobileSmall: 10,
                                  mobileNormal: 12,
                                  mobileLarge: 14,
                                  tabletNormal: 16,
                                  tabletExtraLarge: 18,
                                  desktopLarge: 20,
                                ),
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.w700,
                                color: Black_textColor,
                              )),
                        ),
                        SizedBox(height: 10),
                        Container(
                          // padding:EdgeInsets.all(15),
                          child: Row(
                            children: [
                              CircleAvatar(
                                radius: 20,
                                backgroundColor: Colors.blue,
                              ),
                              SizedBox(width: 10),
                              Text(
                                "${this.formsModel.date}",
                                style: GoogleFonts.roboto(
                                    fontSize: SizeHelper.of(context).help(
                                      mobileSmall: 6,
                                      mobileNormal: 8,
                                      mobileLarge: 10,
                                      tabletNormal: 12,
                                      tabletExtraLarge: 14,
                                      desktopLarge: 16,
                                    ),
                                    letterSpacing: 0.35,
                                    height: 1.5,
                                    fontWeight: FontWeight.w400,
                                    color: Black_textColor),
                                maxLines: 2,
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Center(
                            child: Text(
                              "${this.formsModel.content!.rendered}",
                              style: GoogleFonts.roboto(
                                  fontSize: SizeHelper.of(context).help(
                                    mobileSmall: 6,
                                    mobileNormal: 8,
                                    mobileLarge: 10,
                                    tabletNormal: 15,
                                    tabletExtraLarge: 20,
                                    desktopLarge: 22,
                                  ),
                                  letterSpacing: 0.25,
                                  height: 1.4,
                                  fontWeight: FontWeight.w400,
                                  color: Grey_text_Color),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              FutureBuilder<List<RepliesModel>>(
                  future:
                      Utils.bLoC.commentsList(this.formsModel.id.toString()),
                  builder: (context, snapshot) {
                    return (snapshot.connectionState == ConnectionState.waiting ||!snapshot.hasData||snapshot.data!.length==0)
                        ? Container()
                        : Column(

                            children: [
                              Container(
                                padding: EdgeInsets.all(10),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        SizedBox(width: 15),
                                        Text(
                                          Utils.labels!.total_post,
                                          style: GoogleFonts.roboto(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w500,
                                              fontStyle: FontStyle.normal,
                                              letterSpacing: 0.25,
                                              color: Black_textColor),
                                        ),
                                        SizedBox(
                                          width: 9,
                                        ),
                                        Container(
                                          height: 21,
                                          width: 35,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5),
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
                                          child: Center(
                                            child: Text(
                                              "${snapshot.data!.length}",
                                              style: GoogleFonts.roboto(
                                                  fontSize: 13,
                                                  fontWeight: FontWeight.w400,
                                                  fontStyle: FontStyle.normal,
                                                  letterSpacing: 0.25,
                                                  color: white_color),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                    ShaderMask(
                                      blendMode: BlendMode.srcIn,
                                      shaderCallback: (Rect bounds) {
                                        return ui.Gradient.linear(
                                          Offset(14.0, 24.0),
                                          Offset(24.0, 0.0),
                                          [
                                            CustomButton_Color,
                                            CustomButton_Second_Color
                                          ],
                                        );
                                      },
                                      child: GestureDetector(
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    AllCommentsScreen(
                                                        snapshot.data)),
                                          );
                                        },
                                        child: Text(
                                          Utils.labels!.see_all,
                                          style: GoogleFonts.roboto(
                                              fontSize: 13,
                                              fontWeight: FontWeight.w400,
                                              fontStyle: FontStyle.normal,
                                              letterSpacing: 0.25,
                                              color: Text_color),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              // Container(height: 30,child: Text("81" + Utils.labels!.comments)),
                              Container(
                                padding: EdgeInsets.all(15),
                                color: white_color,
                                height: 250,
                                child: ListView.builder(
                                    physics: NeverScrollableScrollPhysics(),
                                    itemCount: 2,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return Card(
                                        child: Container(
                                          padding: EdgeInsets.all(10),
                                          height: 110,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Row(
                                                    children: [
                                                      CircleAvatar(
                                                        radius: 20,
                                                        backgroundColor:
                                                            Colors.blue,
                                                      ),
                                                      SizedBox(width: 10),
                                                      Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            "dummy title",
                                                            style: GoogleFonts.roboto(
                                                                fontSize: 16,
                                                                letterSpacing:
                                                                    1,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                color:
                                                                    Black_textColor),
                                                          ),
                                                          Text(
                                                            "${snapshot.data![index].date}",
                                                            style: GoogleFonts.roboto(
                                                                fontSize: 10,
                                                                letterSpacing:
                                                                    0.35,
                                                                height: 1.5,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                                color:
                                                                    Black_textColor),
                                                          )
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                              SizedBox(height: 10),
                                              Center(
                                                child: SingleChildScrollView(
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 8.0),
                                                    child: Text(
                                                      "${snapshot.data![index].content!.rendered}",
                                                      style: GoogleFonts.roboto(
                                                          fontSize: 12,
                                                          letterSpacing: 0.35,
                                                          height: 1.5,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color:
                                                              Black_textColor),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    }),
                              ),
                            ],
                          );
                  }),
            ],
          ),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
            child: Container(
              height: SizeHelper.of(context).help(
                mobileSmall: 20,
                mobileNormal: 25,
                mobileLarge: 30,
                tabletNormal: 40,
                tabletExtraLarge: 45,
                desktopLarge: 50,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    Icons.chat,
                    color: Black_textColor,
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                          boxShadow: [
                            BoxShadow(
                              color: Color(0xffe0e0e0),
                              spreadRadius: 1,
                              blurRadius: 5,
                              offset:
                              Offset(0, 0), // changes position of shadow
                            ),
                          ],
                        ),
                        child: TextFormField(
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(15),
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                            hintText: Utils.labels!.write_your_experience,
                            hintStyle: GoogleFonts.roboto(
                                fontSize: SizeHelper.of(context).help(
                                  mobileSmall: 10,
                                  mobileNormal: 12,
                                  mobileLarge: 13,
                                  tabletNormal: 15,
                                  tabletExtraLarge: 16,
                                  desktopLarge: 17,
                                ),
                                letterSpacing: 0.25,
                                fontWeight: FontWeight.w400,
                                color: Black_textColor),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ShaderMask(
                            blendMode: BlendMode.srcIn,
                            shaderCallback: (Rect bounds) {
                              return ui.Gradient.linear(
                                Offset(14.0, 24.0),
                                Offset(24.0, 0.0),
                                [
                                  CustomButton_Color,
                                  CustomButton_Second_Color
                                ],
                              );
                            },
                            child: Icon(
                              Icons.send,
                              color: Black_textColor,
                            )),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
