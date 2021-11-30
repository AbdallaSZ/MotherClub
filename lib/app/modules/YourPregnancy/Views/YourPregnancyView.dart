import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:motherclub/app/Models/WeeksDetail.dart';
import 'package:motherclub/app/Models/WeeksModel.dart';
import 'package:motherclub/app/routes/app_pages.dart';
import 'package:motherclub/common/Constant/ColorConstants.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:motherclub/common/Utils/Utils.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flick_video_player/flick_video_player.dart';
import 'package:video_player/video_player.dart';

class YourPregnancyView extends StatefulWidget {
  @override
  _YourPregnancyViewState createState() => _YourPregnancyViewState();
}

class _YourPregnancyViewState extends State<YourPregnancyView> {
  int tappedIndex=0;
  late String weekSlug="0";
  late FlickManager flickManager;

  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    double deviceWidth = MediaQuery.of(context).size.width;


    Future<void> getWeekSlug() async {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('slug', weekSlug);
    }

    return Scaffold(

          body:
          CustomScrollView(slivers: <Widget>[
            SliverToBoxAdapter(
              child: Container(
                height: deviceHeight / 3.7,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(0.0),
                  gradient: LinearGradient(
                      colors: [CustomButton_Color, CustomButton_Second_Color]),
                ),
                child: Padding(
                  padding: EdgeInsets.only(top: 32, left: 20, right: 20),
                  //padding: EdgeInsets.symmetric(vertical: 32,horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            Utils.labels!.your_Pregnancy,
                            style: Theme.of(context).textTheme.headline1,
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.search,
                                color: Colors.white,
                                size: 25,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              CircleAvatar(
                                radius: 20,
                                backgroundColor: Colors.white,
                              )
                            ],
                          )
                        ],
                      ),
                      Divider(
                        height: 13,
                        color: Colors.transparent,
                      ),
                      Text(
                        Utils.labels!.week_pregnancy,
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                      Divider(
                        height: 15,
                        color: Colors.transparent,
                      ),
                      FutureBuilder<List<WeeksModel>>(
                          future: Utils.bLoC.weeks_list(context),
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              List<WeeksModel>? data = snapshot.data;
                              print('DADAD  $data');
                              return Container(
                                height: deviceHeight / 12,
                                child: ListView.builder(
                                    itemCount: 10,
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return Container(
                                        margin: EdgeInsets.only(left: 5),
                                        // height: deviceHeight/,
                                        width: deviceWidth / 6.5,
                                        decoration: BoxDecoration(
                                          color: tappedIndex == index
                                              ? blue_color
                                              : Colors.transparent,
                                          border: Border.all(
                                            color: tappedIndex == index
                                                ? Colors.transparent
                                                : Colors.white24,
                                            width: 1,
                                          ),
                                          borderRadius: BorderRadius.circular(
                                            10.0,
                                          ),
                                        ),
                                        child: GestureDetector(
                                          onTap: () async {
                                            setState(() {
                                              tappedIndex = index;
                                              weekSlug =
                                                  snapshot.data![index].slug;
                                              setState(() {
                                                getWeekSlug();
                                              });
                                            });
                                          },
                                          child: Container(
                                            height: 50,
                                            width: 50,
                                            // color: Colors.red,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Divider(
                                                  height: 5,
                                                  color: Colors.transparent,
                                                ),
                                                Text(snapshot.data![index].name,
                                                    style: GoogleFonts.roboto(
                                                        fontSize:
                                                            deviceHeight / 58,
                                                        fontWeight:
                                                            FontWeight.w300,
                                                        color: white_color)),
                                                //Divider(height: 5,color: Colors.transparent,),
                                                // Text('3',style: Theme.of(context).textTheme.bodyText1,),
                                              ],
                                            ),
                                          ),
                                        ),
                                      );
                                    }),
                              );
                            } else {
                              return Container();
                            }
                          }),
                    ],
                  ),
                ),
              ),
            ),

            // SliverList(
            //   delegate: SliverChildBuilderDelegate(
            //         (BuildContext context, int index) {
            //       return InkWell(
            //           onTap: () {
            //
            //
            //           },
            //           child:VideoView());
            //     },
            //     childCount: 1,
            //   ),
            // ),

            FutureBuilder<List<WeeksDetail>>(
                future: Utils.bLoC.weeks_detail(),
                builder: (context, snapshott) {
                  return SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (BuildContext context, int index) {
                        // print('rammmmmmmmmmmmmmmmmmmmmmmmmmm');
                        // print(snapshott.data![index].video_link);
                        // print(snapshott.data![index].name);

                        return Column(
                          children: [
                            (weekSlug == "0")
                                ? Container(
                                    child: FlickVideoPlayer(
                                        flickManager: FlickManager(
                                      videoPlayerController:
                                          VideoPlayerController.network(
                                              "https://mothersclub.me/wp-content/uploads/2021/01/الاسبوع-الثاني.mp4"),
                                    )),
                                  )
                                : Container(
                                    child: FlickVideoPlayer(
                                        flickManager: FlickManager(
                                      videoPlayerController:
                                          VideoPlayerController.network(
                                              snapshott
                                                  .data![index].video_link),
                                    )),
                                  ),
                            Padding(
                                padding: EdgeInsets.all(10),
                                child: Text(
                                  'Pregnancy Tools & Resources',
                                  style: Theme.of(context).textTheme.headline4,
                                )),
                            Padding(
                                padding: EdgeInsets.only(
                                    top: 10, left: 10, right: 10, bottom: 50),
                                child: Container(
                                  margin: EdgeInsets.only(top: 10),
                                  padding: EdgeInsets.only(right: 10),
                                  height: deviceHeight / 7,
                                  width: deviceWidth,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10.0),
                                      color: Colors
                                          .white /*RandomColorModel().getColor().withOpacity(0.5)*/),
                                  child: GestureDetector(
                                    onTap: () {
                                      Get.toNamed(Routes.BLOG);
                                    },
                                    child: Row(
                                      //crossAxisAlignment: CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Flexible(
                                            flex: 2,
                                            child: Image.asset(
                                              'assets/images/RectangleDemo.png',
                                              fit: BoxFit.fill,
                                            )),
                                        Flexible(
                                          flex: 3,
                                          child: SingleChildScrollView(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              // mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                (weekSlug == "0")
                                                    ? Text(
                                                        Utils.labels!.week +
                                                            "2",
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .headline3)
                                                    : Text(
                                                        snapshott
                                                            .data![index].name,
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .headline3),

                                                Divider(
                                                  height: 5,
                                                  color: Colors.red,
                                                ),
                                                (weekSlug == "0")
                                                    ? Text(
                                                        "يتمكن 400 حيوان منوي فقط من إتمام الرحلة الشاقة والتي تستمر عشر ساعات للوصول إلى البويضة، بينما حيوان منوي واحد فقط الذي يتمكن من اختراق الغشاء الخارجي للبويضة. يكون طفلك في هذا الوقت عبارة عن كرة صغيرة من الخلايا والتي اتفق العلماء على تسميتها بالكيس الأريميّ",
                                                        style: GoogleFonts.roboto(
                                                            fontSize: 12,
                                                            color:
                                                                Black_textColor))
                                                    : Text(
                                                        snapshott.data![index]
                                                            .description,
                                                        style: GoogleFonts.roboto(
                                                            fontSize: 12,
                                                            color:
                                                                Black_textColor)),

                                                // (week_slug=="0")? Text("يتمكن 400 حيوان منوي فقط من إتمام الرحلة الشاقة والتي تستمر عشر ساعات للوصول إلى البويضة، بينما حيوان منوي واحد فقط الذي يتمكن من اختراق الغشاء الخارجي للبويضة. يكون طفلك في هذا الوقت عبارة عن كرة صغيرة من الخلايا والتي اتفق العلماء على تسميتها بالكيس الأريميّ",
                                                //     style: GoogleFonts.roboto(
                                                //         fontSize: Utils
                                                //             .deviceHeight /58,
                                                //         fontWeight: FontWeight
                                                //             .normal,
                                                //         color: Black_textColor)):
                                                // Text(snapshott.data![index].description,
                                                //     style: GoogleFonts.roboto(
                                                //         fontSize: Utils
                                                //             .deviceHeight / 75,
                                                //         fontWeight: FontWeight
                                                //             .normal,
                                                //         color: Black_textColor)),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Flexible(
                                          flex: 1,
                                          child: Container(
                                            // padding: EdgeInsets.only(right: 10),
                                            width: 30,
                                            height: 30,

                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(25.0),
                                              gradient: LinearGradient(
                                                  /* begin: FractionalOffset.topCenter,
                        end: FractionalOffset.bottomCenter,*/
                                                  colors: [
                                                    CustomButton_Color,
                                                    CustomButton_Second_Color
                                                  ]),

                                              // gradient: colorsConstants.gradient1
                                            ),
                                            child: Icon(
                                              Icons.arrow_forward_outlined,
                                              color: Colors.white,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                )),
                          ],
                        );
                      },
                      childCount: 1,
                    ),
                  );
                }),
          ]),
        );

  }
}
