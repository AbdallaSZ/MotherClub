import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:motherclub/app/Models/FormsModel.dart';
import 'package:motherclub/app/Models/baby_model.dart';
import 'package:motherclub/app/Models/replies_model.dart';
import 'package:motherclub/common/Constant/ColorConstants.dart';
import 'dart:ui' as ui;
import 'package:motherclub/common/Utils/Utils.dart';

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
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
        backgroundColor: Colors.white,
        title: Container(
          child: Row(
            children: [
              /*Align(
                      alignment: Alignment.centerLeft,
                      child: Image.asset('assets/images/sort.png',height: 37,width:  deviceWidth/14,)),*/
              Image.asset(
                'assets/images/logo.png',
                width: deviceWidth / 5,
                height: deviceHeight / 8,
              ),
              Text(
                Utils.labels!.forum,
                style: GoogleFonts.roboto(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: Black_textColor),
              ),
              // Image.asset('assets/images/logo.png',width: 120,height: 87,),
            ],
          ),
        ),
        actions: [
          Icon(
            Icons.search,
            color: Colors.black87,
          ),
          SizedBox(
            width: 20,
          ),
          Image.asset('assets/images/translate.png'),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  height: 250,
                  // color: Colors.yellowAccent,
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
                                  fontSize: 18,
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
                                      fontSize: 10,
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
                                    fontSize: 13,
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
                      return snapshot.connectionState == ConnectionState.waiting
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

            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Card(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),

                      height: deviceHeight / 17,
                      width: deviceWidth / 1.09,
                      // alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                        border: Border.all(color: white_color, width: 0.5),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                    hintText:
                                        Utils.labels!.write_your_experience,
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
                              mainAxisAlignment: MainAxisAlignment.end,
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
    ));
  }
}
