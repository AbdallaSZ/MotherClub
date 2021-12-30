import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:motherclub/app/Models/FormsModel.dart';
import 'package:motherclub/app/Shimmers/FurmShimmer.dart';
import 'package:motherclub/app/modules/account/widgets/info_account_widget.dart';
import 'package:motherclub/app/modules/forum/controller/forumController.dart';
import 'package:motherclub/app/modules/forum/views/forum_comment_view.dart';
import 'package:motherclub/common/Constant/ColorConstants.dart';
import 'package:motherclub/common/Utils/Utils.dart';
import 'package:size_helper/size_helper.dart';
import 'package:html/parser.dart';

class ForumView extends GetView<ForumController> {

  String _parseHtmlString(String htmlString) {
    final document = parse(htmlString);
    final String parsedString = parse(document.body!.text).documentElement!.text;

    return parsedString;
  }

  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    double deviceWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            InfoAccountWidget(),
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

            Flexible(
              flex: 5,
              child: FutureBuilder<List<FormsModel>>(
                  future: Utils.bLoC.forumsList(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      List<FormsModel>? data = snapshot.data;
                      // print('datadata ${data![0].Date}');
                      return ListView.builder(
                          shrinkWrap: true,
                          itemCount: data!.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: GestureDetector(
                                onTap: () {
                                  // await Utils.bLoC.UsersDetails();
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ForumCommentView(
                                            formsModel: snapshot.data![index])),
                                  );
                                },
                                child: Card(
                                  color: Colors.blueGrey,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.white,
                                          spreadRadius: 1,
                                          blurRadius: 5,
                                          offset: Offset(0,0), // changes position of shadow
                                        ),
                                      ],
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
                                              _parseHtmlString("${data[index].title!.rendered}"),
                                              style: GoogleFonts.roboto(
                                                fontSize:
                                                    SizeHelper.of(context).help(
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
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
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
                                                        style:
                                                            GoogleFonts.roboto(
                                                                fontSize: SizeHelper.of(
                                                                        context)
                                                                    .help(
                                                                  mobileSmall:
                                                                      6,
                                                                  mobileNormal:
                                                                      8,
                                                                  mobileLarge:
                                                                      10,
                                                                  tabletNormal:
                                                                      12,
                                                                  tabletExtraLarge:
                                                                      14,
                                                                  desktopLarge:
                                                                      16,
                                                                ),
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
                                            _parseHtmlString("${data[index].content!.rendered}"),
                                            style: GoogleFonts.roboto(
                                                fontSize:
                                                    SizeHelper.of(context).help(
                                                  mobileSmall: 6,
                                                  mobileNormal: 8,
                                                  mobileLarge: 10,
                                                  tabletNormal: 12,
                                                  tabletExtraLarge: 14,
                                                  desktopLarge: 16,
                                                ),
                                                letterSpacing: 0.25,
                                                height: 1.4,
                                                fontWeight: FontWeight.w400,
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
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "Open Post",
                                              style: GoogleFonts.roboto(
                                                  fontSize:
                                                      SizeHelper.of(context)
                                                          .help(
                                                    mobileSmall: 10,
                                                    mobileNormal: 12,
                                                    mobileLarge: 14,
                                                    tabletNormal: 16,
                                                    tabletExtraLarge: 18,
                                                    desktopLarge: 20,
                                                  ),
                                                  letterSpacing: 2,
                                                  // height: 1.4,
                                                  fontWeight: FontWeight.w400,
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
                              ),
                            );
                          });
                    } else {
                      return ListView.builder(
                          itemCount: 10,
                          itemBuilder: (BuildContext context, int index) {
                            return Card(
                                child: FurmShimmer(
                                    deviceHeight, deviceWidth, context));
                          });
                    }
                  }),
            ),

            // Padding(
            //   padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
            //   child: Container(
            //     height: SizeHelper.of(context).help(
            //       mobileSmall: 20,
            //       mobileNormal: 25,
            //       mobileLarge: 30,
            //       tabletNormal: 40,
            //       tabletExtraLarge: 45,
            //       desktopLarge: 50,
            //     ),
            //     child: Row(
            //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //       children: [
            //         Icon(
            //           Icons.chat,
            //           color: Black_textColor,
            //         ),
            //         Expanded(
            //           child: Padding(
            //             padding: const EdgeInsets.symmetric(horizontal: 10),
            //             child: Container(
            //               padding: EdgeInsets.symmetric(horizontal: 20),
            //               decoration: BoxDecoration(
            //                 color: Colors.white,
            //                 borderRadius: BorderRadius.all(Radius.circular(5)),
            //                 boxShadow: [
            //                   BoxShadow(
            //                     color: Color(0xffe0e0e0),
            //                     spreadRadius: 1,
            //                     blurRadius: 5,
            //                     offset:
            //                         Offset(0, 0), // changes position of shadow
            //                   ),
            //                 ],
            //               ),
            //               child: TextFormField(
            //                 textAlign: TextAlign.center,
            //                 decoration: InputDecoration(
            //                   contentPadding: EdgeInsets.all(15),
            //                   border: InputBorder.none,
            //                   focusedBorder: InputBorder.none,
            //                   enabledBorder: InputBorder.none,
            //                   errorBorder: InputBorder.none,
            //                   disabledBorder: InputBorder.none,
            //                   hintText: Utils.labels!.write_your_experience,
            //                   hintStyle: GoogleFonts.roboto(
            //                       fontSize: SizeHelper.of(context).help(
            //                         mobileSmall: 10,
            //                         mobileNormal: 12,
            //                         mobileLarge: 13,
            //                         tabletNormal: 15,
            //                         tabletExtraLarge: 16,
            //                         desktopLarge: 17,
            //                       ),
            //                       letterSpacing: 0.25,
            //                       fontWeight: FontWeight.w400,
            //                       color: Black_textColor),
            //                 ),
            //               ),
            //             ),
            //           ),
            //         ),
            //         Padding(
            //           padding: const EdgeInsets.only(right: 10.0),
            //           child: Row(
            //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //             children: [
            //               ShaderMask(
            //                   blendMode: BlendMode.srcIn,
            //                   shaderCallback: (Rect bounds) {
            //                     return ui.Gradient.linear(
            //                       Offset(14.0, 24.0),
            //                       Offset(24.0, 0.0),
            //                       [
            //                         CustomButton_Color,
            //                         CustomButton_Second_Color
            //                       ],
            //                     );
            //                   },
            //                   child: Icon(
            //                     Icons.send,
            //                     color: Black_textColor,
            //                   )),
            //             ],
            //           ),
            //         ),
            //       ],
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
