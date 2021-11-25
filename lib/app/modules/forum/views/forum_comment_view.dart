import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:motherclub/app/modules/forum/controller/forumController.dart';
import 'package:motherclub/common/Constant/ColorConstants.dart';
import 'dart:ui' as ui;
import 'package:motherclub/common/CustomWidget/appBarWidget.dart';
import 'package:motherclub/common/Utils/Utils.dart';

class ForumCommentView extends GetView<ForumController> {


  @override
  Widget build(BuildContext context) {
    double deviceHeight=MediaQuery.of(context).size.height;
    double deviceWidth=MediaQuery.of(context).size.width;
    return SafeArea(
        child: Scaffold(
          appBar:  AppBar(
            iconTheme: IconThemeData(
              color: Colors.black, //change your color here
            ),
            backgroundColor:Colors.white ,
            title: Container(
              child: Row(
                children: [
                  /*Align(
                      alignment: Alignment.centerLeft,
                      child: Image.asset('assets/images/sort.png',height: 37,width:  deviceWidth/14,)),*/
                  Image.asset('assets/images/logo.png',width: deviceWidth/5,height: deviceHeight/8,),
                  Text(Utils.labels!.forum,style: GoogleFonts.roboto(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: Black_textColor),),
                  // Image.asset('assets/images/logo.png',width: 120,height: 87,),

                ],
              ),
            ),
            actions: [
              Icon(Icons.search,color: Colors.black87,),
              SizedBox(width: 20,),
              Image.asset('assets/images/translate.png'),

            ],
          ),
          body:SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.all(10),
                  height: deviceHeight/6,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(0.0),
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
                  child:   Column(
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
                                    // backgroundImage: AssetImage(
                                    //    'assets/ProductBg.png',)
                                  ),
                                ),
                              ),
                              SizedBox(width:10),
                              Container(
                                // padding: EdgeInsets.fromLTRB(18, 13, 10, 0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Amara Moussa",style: GoogleFonts.roboto(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        fontStyle: FontStyle.normal,
                                        letterSpacing: 0.25,
                                        color: white_color),),

                                    SizedBox(height:3),
                                    Text("Age: 29",style: GoogleFonts.roboto(
                                        fontSize:13,
                                        fontWeight: FontWeight.w400,
                                        fontStyle: FontStyle.normal,
                                        letterSpacing: 0.25,
                                        color: white_color),),

                                  ],
                                ),
                              ),
                            ],
                          ),


                          Container(
                            padding: EdgeInsets.fromLTRB(5, 5, 5, 5),

                            decoration: BoxDecoration(border: Border.all(
                                color: white_color,
                                width: 1
                            ),
                                borderRadius: BorderRadius.circular(10)
                            ),
                            child: Column(
                              children: [
                                Text(Utils.labels!.week,style: GoogleFonts.roboto(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    fontStyle: FontStyle.normal,
                                    color: white_color),),
                                SizedBox(height:1),
                                Text("9-12",style: GoogleFonts.roboto(
                                    fontSize:18,
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FontStyle.normal,
                                    color: white_color),),

                              ],
                            ),
                          )

                        ],
                      ),
                      SizedBox(height:10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            child: Column(
                              children: [
                                Text("870",style: GoogleFonts.roboto(
                                    fontSize:18,
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FontStyle.normal,
                                    color: white_color),),
                                SizedBox(height: 3,),

                                Text(Utils.labels!.following,style: GoogleFonts.roboto(
                                    fontSize:12,
                                    fontWeight: FontWeight.w400,
                                    fontStyle: FontStyle.normal,
                                    color: white_color),),

                              ],
                            ),
                          ),
                          Container(height: 40, child: VerticalDivider(color: Colors.white)),
                          Container(
                            child: Column(
                              children: [
                                Text("120K",style: GoogleFonts.roboto(
                                    fontSize:18,
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FontStyle.normal,
                                    color: white_color),),
                                SizedBox(height: 3,),

                                Text(Utils.labels!.followers,style: GoogleFonts.roboto(
                                    fontSize:12,
                                    fontWeight: FontWeight.w400,
                                    fontStyle: FontStyle.normal,
                                    color: white_color),),

                              ],
                            ),
                          ),
                          Container(height: 40, child: VerticalDivider(color: Colors.white)),
                          Container(
                            child: Column(
                              children: [
                                Text("34K",style: GoogleFonts.roboto(
                                    fontSize:18,
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FontStyle.normal,
                                    color: white_color),),
                                SizedBox(height: 3,),

                                Text(Utils.labels!.likes,style: GoogleFonts.roboto(
                                    fontSize:12,
                                    fontWeight: FontWeight.w400,
                                    fontStyle: FontStyle.normal,
                                    color: white_color),),

                              ],
                            ),
                          ),
                          // VerticalDivider(color: white_color,thickness: 1,)

                        ],
                      )
                    ],
                  ),

                ),




                // AppBarWidget("Forum",deviceHeight/9.4,deviceWidth,context),
                Container(
                  padding: EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [

                          SizedBox(width:15),
                          Text(Utils.labels!.total_post,style: GoogleFonts.roboto(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              fontStyle: FontStyle.normal,
                              letterSpacing: 0.25,
                              color: Black_textColor),),
                          SizedBox(width: 9,),
                          Container(
                            height:21,
                            width: 35,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
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
                            ),
                            child: Center(
                              child: Text("10",style: GoogleFonts.roboto(
                                  fontSize:13,
                                  fontWeight: FontWeight.w400,
                                  fontStyle: FontStyle.normal,
                                  letterSpacing: 0.25,
                                  color: white_color),),
                            ),
                          )
                        ],
                      ),


                      ShaderMask(
                        blendMode: BlendMode.srcIn,
                        shaderCallback: (Rect bounds) { return ui.Gradient.linear(
                          Offset(14.0, 24.0),
                          Offset(24.0, 0.0),
                          [
                            CustomButton_Color,
                            CustomButton_Second_Color
                          ],
                        ); },
                        child: Text(Utils.labels!.see_all,style: GoogleFonts.roboto(
                            fontSize:13,
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal,
                            letterSpacing: 0.25,
                            color:Text_color
                        ),),
                      ),

                    ],
                  ),
                ),

                Column(
                  children: [
                    Container(

                      padding: EdgeInsets.symmetric(horizontal: 15),
                      height: 300,
                      // color: Colors.yellowAccent,
                      width: deviceWidth,
                      child: Card(
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(7.0),
                                  // color: Colors.blue,
                                ),
                                padding: EdgeInsets.symmetric(horizontal: 15,vertical: 15),

                                height: 300,
                                width:270,
                                child: Column(
                                  children: [
                                    Container(
                                      // padding:EdgeInsets.fromLTRB(15,17,10,0),
                                      child: Text("Best postpartum recovery products!",style: GoogleFonts.roboto(
                                        fontSize: 18,
                                        fontStyle: FontStyle.normal,
                                        fontWeight: FontWeight.w700,
                                        color: Black_textColor,
                                      )
                                      ),
                                    ),
                                    SizedBox(height:10),

                                    Container(
                                      // padding:EdgeInsets.all(15),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              CircleAvatar(radius: 20,backgroundColor: Colors.white,),
                                              SizedBox(width:10),
                                              Column(
                                                crossAxisAlignment:CrossAxisAlignment.start,

                                                children: [
                                                  Text("Aditya Diab",style: Theme.of(context).textTheme.headline1,),
                                                  Text("Sep 7, 2021 at 5:42 PM",style: GoogleFonts.roboto(
                                                      fontSize: 10,
                                                      letterSpacing: 0.35,
                                                      height: 1.5,
                                                      fontWeight: FontWeight.w400,
                                                      color: Black_textColor),)

                                                ],

                                              ),


                                            ],
                                          ),
                                          Row(
                                            children: [
                                              ShaderMask(
                                                  shaderCallback: (Rect bounds) {
                                                    return LinearGradient(
                                                      begin: Alignment.centerLeft,
                                                      end: Alignment.centerRight,
                                                      colors: <Color>[Colors.transparent, Colors.red, Colors.yellow, Colors.transparent],
                                                      stops: [0.0, 0.04, 0.96, 1.0],
                                                      tileMode: TileMode.clamp,
                                                    ).createShader(Rect.fromLTRB(0, 0, bounds.width, bounds.height));
                                                  },
                                                  child: Icon(Icons.bookmark_border)),
                                              SizedBox(width: 10,),
                                              Icon(Icons.more_vert)
                                            ],
                                          ),
                                        ],
                                      ),

                                    ),
                                    SizedBox(height:15),
                                    Text("This is my first baby and I’m wondering what products I should stock up on before baby for my postpartum care and recovery at home! Thanks!!",style: GoogleFonts.roboto(
                                        fontSize: 13,
                                        letterSpacing: 0.25,
                                        height: 1.4,
                                        fontWeight: FontWeight.w400,
                                        color: Grey_text_Color),
                                    ),

                                    Padding(
                                      padding: const EdgeInsets.only(top:20),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              Icon(Icons.favorite,color: pinkfavorite_Color,),
                                              SizedBox(width:5),
                                              Text("18 K",style: GoogleFonts.roboto(
                                                  fontSize: 13,
                                                  letterSpacing: 0.25,
                                                  height: 1.3,
                                                  fontWeight: FontWeight.w700,
                                                  color: Grey_text_Color),)

                                            ],
                                          ),
                                          Row(
                                            children: [
                                              ShaderMask(
                                                  blendMode: BlendMode.srcIn,
                                                  shaderCallback: (Rect bounds) { return ui.Gradient.linear(
                                                    Offset(4.0, 4.0),
                                                    Offset(24.0, 4.0),
                                                    [
                                                      CustomButton_Color,
                                                      CustomButton_Second_Color
                                                    ],
                                                  ); },
                                                  child: Icon(Icons.reply)),
                                              SizedBox(width:8),
                                              ShaderMask(
                                                blendMode: BlendMode.srcIn,
                                                shaderCallback: (Rect bounds) { return ui.Gradient.linear(
                                                  Offset(14.0, 24.0),
                                                  Offset(24.0, 0.0),
                                                  [
                                                    CustomButton_Color,
                                                    CustomButton_Second_Color
                                                  ],
                                                ); },
                                                child: Text(Utils.labels!.reply,style: GoogleFonts.roboto(
                                                  fontSize: 16,
                                                  letterSpacing: 0.25,
                                                  height: 1.4,
                                                  fontWeight: FontWeight.w700,
                                                )),
                                              )

                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(height:10),
                                    Divider(thickness: 1,),
                                    SizedBox(height:8),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(" 14 Similar Discussions Found ",style: GoogleFonts.roboto(
                                            fontSize: 13,
                                            letterSpacing: 0.25,
                                            // height: 1.4,
                                            fontWeight: FontWeight.w400,
                                            color: Black_textColor),),
                                        Icon(Icons.play_circle_fill)
                                      ],
                                    )



                                  ],
                                ),

                              ),
                            )



                    ),

                    Text("81"+Utils.labels!.comments),
                    Container(
                      padding: EdgeInsets.all(15),
                      color: white_color,
                      height: 250,
                      child: ListView.builder(
                      itemCount: 2,
                      itemBuilder: (BuildContext context,int index){
                      return Card(
                        child: Container(
                          padding: EdgeInsets.all(10),
                          height: 100,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      CircleAvatar(radius: 20,backgroundColor: Colors.blue,),
                                      SizedBox(width:10),
                                      Column(
                                        crossAxisAlignment:CrossAxisAlignment.start,

                                        children: [
                                          Text("lkocelko",style: Theme.of(context).textTheme.headline1,),
                                          Text("Sep 7, 2021 at 5:42 PM",style: GoogleFonts.roboto(
                                              fontSize: 10,
                                              letterSpacing: 0.35,
                                              height: 1.5,
                                              fontWeight: FontWeight.w400,
                                              color: Black_textColor),)

                                        ],

                                      ),


                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Icon(Icons.reply),
                                      SizedBox(width:8),
                                      Icon(Icons.more_vert)

                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(height:10),
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Text("Dermablast and giant pads and Motrin for",style: GoogleFonts.roboto(
                                    fontSize: 13,
                                    letterSpacing: 0.35,
                                    height: 1.5,
                                    fontWeight: FontWeight.w500,
                                    color: Black_textColor),),
                              )
                            ],
                          ),
                        ),
                      );

                      }),
                    )
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

                          height: deviceHeight/17,
                          width: deviceWidth/1.09,
                          // alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                            border: Border.all(
                                color:white_color,
                                width: 0.5
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Icon(Icons.chat,color: Black_textColor,),
                                  SizedBox(width:10),
                                  Container(
                                    width: 200,
                                    child: TextField(
                                      decoration: InputDecoration(
                                        border: InputBorder.none,
                                        focusedBorder: InputBorder.none,
                                        enabledBorder: InputBorder.none,
                                        errorBorder: InputBorder.none,
                                        disabledBorder: InputBorder.none,
                                        hintText: Utils.labels!.write_your_experience,
                                        hintStyle:  GoogleFonts.roboto(
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
                                    Icon(Icons.attach_file,color: Black_textColor,),
                                    SizedBox(width:15),
                                    ShaderMask(
                                        blendMode: BlendMode.srcIn,
                                        shaderCallback: (Rect bounds) { return ui.Gradient.linear(
                                          Offset(14.0, 24.0),
                                          Offset(24.0, 0.0),
                                          [
                                            CustomButton_Color,
                                            CustomButton_Second_Color
                                          ],
                                        ); },
                                        child: Icon(Icons.send,color: Black_textColor,)),
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

                      ],),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
