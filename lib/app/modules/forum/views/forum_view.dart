import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:motherclub/app/Models/FormsModel.dart';
import 'package:motherclub/app/Shimmers/FurmShimmer.dart';
import 'package:motherclub/app/modules/forum/controller/forumController.dart';
import 'package:motherclub/app/modules/forum/views/forum_comment_view.dart';
import 'package:motherclub/app/routes/app_pages.dart';
import 'package:motherclub/common/Constant/ColorConstants.dart';
import 'dart:ui' as ui;
import 'package:motherclub/common/CustomWidget/appBarWidget.dart';
import 'package:motherclub/common/Utils/Utils.dart';

class ForumView extends GetView<ForumController> {
  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    double deviceWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.all(10),
                height: deviceHeight / 9.5,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(0.0),
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

                  // gradient: colorsConstants.gradient1
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              // color: Colors.yellowAccent,
                              child: CircleAvatar(
                                radius: 24.0,
                                backgroundColor: Colors.white,
                                child: CircleAvatar(
                                    radius: 38.0,
                                    backgroundImage: NetworkImage(Utils.prefs!
                                            .getString("imageUrl") ??
                                        "https://c0.klipartz.com/pngpicture/434/847/gratis-png-usuario-de-iconos-de-computadora-empresario-ejecutivo-de-negocios-s.png")),
                              ),
                            ),
                            SizedBox(width: 10),
                            Container(
                              // padding: EdgeInsets.fromLTRB(18, 13, 10, 0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "${Utils.name}",
                                    style: GoogleFonts.roboto(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        fontStyle: FontStyle.normal,
                                        letterSpacing: 0.25,
                                        color: white_color),
                                  ),
                                  SizedBox(height: 3),
                                  Text(
                                    "Age: 29",
                                    style: GoogleFonts.roboto(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w400,
                                        fontStyle: FontStyle.normal,
                                        letterSpacing: 0.25,
                                        color: white_color),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Container(
                          padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                          decoration: BoxDecoration(
                              border: Border.all(color: white_color, width: 1),
                              borderRadius: BorderRadius.circular(10)),
                          child: Column(
                            children: [
                              Text(
                                Utils.labels!.week,
                                style: GoogleFonts.roboto(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    fontStyle: FontStyle.normal,
                                    color: white_color),
                              ),
                              SizedBox(height: 1),
                              Text(
                                "9-12",
                                style: GoogleFonts.roboto(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FontStyle.normal,
                                    color: white_color),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ],
                ),),
                    // AppBarWidget("Forum",deviceHeight/9.4,deviceWidth,context),
                    Container(
                      padding: EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                  borderRadius: BorderRadius.circular(5),
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
                                child: FutureBuilder<List<FormsModel>>(
                                    future: Utils.bLoC.forumsList(),
                                    builder: (context, snapshot) {
                                      if (snapshot.hasData) {
                                        List<FormsModel>? data = snapshot.data;

                                        return Center(
                                          child: Text(
                                            "${data!.length}",
                                            style: GoogleFonts.roboto(
                                                fontSize: 13,
                                                fontWeight: FontWeight.w400,
                                                fontStyle: FontStyle.normal,
                                                letterSpacing: 0.25,
                                                color: white_color),
                                          ),
                                        );
                                      } else {
                                        return Container();
                                      }
                                    }),
                              )
                            ],
                          ),
                          // Padding(
                          //   padding: const EdgeInsets.all(8.0),
                          //   child: ShaderMask(
                          //     blendMode: BlendMode.srcIn,
                          //     shaderCallback: (Rect bounds) {
                          //       return ui.Gradient.linear(
                          //         Offset(14.0, 24.0),
                          //         Offset(24.0, 0.0),
                          //         [
                          //           CustomButton_Color,
                          //           CustomButton_Second_Color
                          //         ],
                          //       );
                          //     },
                          //   ),
                          // ),
                        ],
                      ),
                    ),


              ConstrainedBox(
                constraints: BoxConstraints(maxHeight: 480, minHeight: 400),
                child: FutureBuilder<List<FormsModel>>(
                    future: Utils.bLoC.forumsList(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        List<FormsModel>? data = snapshot.data;
                        // print('datadata ${data![0].Date}');
                        return ListView.builder(
                            shrinkWrap: true,
                            itemCount: data!.length,
                            itemBuilder:
                                (BuildContext context, int index) {
                              return GestureDetector(
                                onTap: () {
                                  // await Utils.bLoC.UsersDetails();
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            ForumCommentView(
                                                formsModel: snapshot
                                                    .data![index])),
                                  );
                                },
                                child: Card(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius:
                                      BorderRadius.circular(7.0),
                                      // color: Colors.blue,
                                    ),
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 15, vertical: 15),
                                    height: 250,
                                    width: 270,
                                    child: Column(
                                      children: [
                                        Container(
                                          // padding:EdgeInsets.fromLTRB(15,17,10,0),
                                          child: Text(
                                              "${data[index].title!.rendered}",
                                              style: GoogleFonts.roboto(
                                                fontSize: 18,
                                                fontStyle:
                                                FontStyle.normal,
                                                fontWeight:
                                                FontWeight.w700,
                                                color: Black_textColor,
                                              )),
                                        ),
                                        SizedBox(height: 10),
                                        Container(
                                          // padding:EdgeInsets.all(15),
                                          child: Row(
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
                                                      //Text("Aditya Diab",style: Theme.of(context).textTheme.headline1,),
                                                      Text(
                                                        "${data[index].date}",
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
                                                        maxLines: 2,
                                                      )
                                                    ],
                                                  ),
                                                ],
                                              ),

                                            ],
                                          ),
                                        ),
                                        SizedBox(height: 15),
                                        Flexible(
                                          child: Text(
                                            "${data[index].content!.rendered}",
                                            style: GoogleFonts.roboto(
                                                fontSize: 13,
                                                letterSpacing: 0.25,
                                                height: 1.4,
                                                fontWeight:
                                                FontWeight.w400,
                                                color: Grey_text_Color),
                                          ),
                                        ),
                                        // Padding(
                                        //   padding: const EdgeInsets.only(
                                        //       top: 30),
                                        //   child: Row(
                                        //     mainAxisAlignment:
                                        //     MainAxisAlignment
                                        //         .spaceBetween,
                                        //     children: [
                                        //       Row(
                                        //         children: [
                                        //           Icon(
                                        //             Icons.favorite,
                                        //             color:
                                        //             pinkfavorite_Color,
                                        //           ),
                                        //           SizedBox(width: 5),
                                        //           Text(
                                        //             "18 K",
                                        //             style: GoogleFonts.roboto(
                                        //                 fontSize: 13,
                                        //                 letterSpacing:
                                        //                 0.25,
                                        //                 height: 1.3,
                                        //                 fontWeight:
                                        //                 FontWeight
                                        //                     .w700,
                                        //                 color:
                                        //                 Grey_text_Color),
                                        //           )
                                        //         ],
                                        //       ),
                                        //       Row(
                                        //         children: [
                                        //           ShaderMask(
                                        //               blendMode:
                                        //               BlendMode.srcIn,
                                        //               shaderCallback:
                                        //                   (Rect bounds) {
                                        //                 return ui.Gradient
                                        //                     .linear(
                                        //                   Offset(
                                        //                       4.0, 4.0),
                                        //                   Offset(
                                        //                       24.0, 4.0),
                                        //                   [
                                        //                     CustomButton_Color,
                                        //                     CustomButton_Second_Color
                                        //                   ],
                                        //                 );
                                        //               },
                                        //               child: Icon(
                                        //                   Icons.reply)),
                                        //           SizedBox(width: 8),
                                        //           ShaderMask(
                                        //             blendMode:
                                        //             BlendMode.srcIn,
                                        //             shaderCallback:
                                        //                 (Rect bounds) {
                                        //               return ui.Gradient
                                        //                   .linear(
                                        //                 Offset(
                                        //                     14.0, 24.0),
                                        //                 Offset(24.0, 0.0),
                                        //                 [
                                        //                   CustomButton_Color,
                                        //                   CustomButton_Second_Color
                                        //                 ],
                                        //               );
                                        //             },
                                        //             child: Text(
                                        //                 Utils.labels!
                                        //                     .reply,
                                        //                 style: GoogleFonts
                                        //                     .roboto(
                                        //                   fontSize: 16,
                                        //                   letterSpacing:
                                        //                   0.25,
                                        //                   height: 1.4,
                                        //                   fontWeight:
                                        //                   FontWeight
                                        //                       .w700,
                                        //                 )),
                                        //           )
                                        //         ],
                                        //       ),
                                        //     ],
                                        //   ),
                                        // ),
                                        SizedBox(height: 10),
                                        Divider(
                                          thickness: 1,
                                        ),
                                       SizedBox(height: 8),
                                        Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment
                                              .spaceBetween,
                                          children: [
                                            Text(
                                              "Open Post",
                                              style: GoogleFonts.roboto(
                                                  fontSize: 16,
                                                  letterSpacing: 2,
                                                  // height: 1.4,
                                                  fontWeight:
                                                  FontWeight.w400,
                                                  color: Black_textColor),
                                            ),
                                            Icon(
                                              Icons.open_in_new,
                                              color: Black_textColor,
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            });
                      } else {
                        return ListView.builder(
                            itemCount: 10,
                            itemBuilder:
                                (BuildContext context, int index) {
                              return Card(
                                  child: FurmShimmer(deviceHeight,
                                      deviceWidth, context));
                            });
                      }
                    }),
              ),



                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Card(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 10),

                              // alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5)),
                                border:
                                    Border.all(color: white_color, width: 0.5),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.chat,
                                        color: Black_textColor,
                                      ),
                                      SizedBox(width: 10),
                                      Container(
                                        width: 200,
                                        child: TextField(
                                          decoration: InputDecoration(
                                            border: InputBorder.none,
                                            focusedBorder: InputBorder.none,
                                            enabledBorder: InputBorder.none,
                                            errorBorder: InputBorder.none,
                                            disabledBorder: InputBorder.none,
                                            hintText: Utils
                                                .labels!.write_your_experience,
                                            hintStyle: GoogleFonts.roboto(
                                                fontSize: 13,
                                                letterSpacing: 0.25,
                                                height: 1.9,
                                                fontWeight: FontWeight.w400,
                                                color: Black_textColor),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 10.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Icon(
                                          Icons.attach_file,
                                          color: Black_textColor,
                                        ),
                                        SizedBox(width: 15),
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
                            // SizedBox(width: 10,),
                            // Icon(Icons.sort,color: Colors.black,size: 25,),
                            /*Icon(Icons.arrow_back,color: Colors.black,),
                        SizedBox(width: 20,),
                        Text('Category List',style: Theme.of(context).textTheme.headline1,),
*/
                          ],
                        ),
                      ),
                    ),


            ],
          ),
        ),
      ),
    );
  }
}
