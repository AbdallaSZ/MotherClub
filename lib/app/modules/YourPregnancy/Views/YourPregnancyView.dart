import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:motherclub/app/Models/pregnancy_data_model.dart';
import 'package:motherclub/app/Models/WeeksModel.dart';
import 'package:motherclub/app/modules/YourPregnancy/Views/all_pregnancy_articles.dart';
import 'package:motherclub/app/modules/YourPregnancy/Views/pregnancy_article_item.dart';
import 'package:motherclub/app/modules/article_part/article_content.dart';
import 'package:motherclub/app/routes/app_pages.dart';
import 'package:motherclub/common/Constant/ColorConstants.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:motherclub/common/Utils/Utils.dart';
import 'package:rxdart/rxdart.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flick_video_player/flick_video_player.dart';
import 'package:size_helper/size_helper.dart';
import 'package:video_player/video_player.dart';

class YourPregnancyView extends StatefulWidget {
  @override
  _YourPregnancyViewState createState() => _YourPregnancyViewState();
}

class _YourPregnancyViewState extends State<YourPregnancyView> {
  int tappedIndex = 0;

  BehaviorSubject<String> _rxSlug = BehaviorSubject();
  BehaviorSubject<int> _rxIndex = BehaviorSubject();
  VideoPlayerController controller = VideoPlayerController.network(
      "https://mothersclub.me/wp-content/uploads/2021/01/الاسبوع-الثاني.mp4");

  dynamic playVid(String url) {
    controller =
        VideoPlayerController.network(url, formatHint: VideoFormat.other)
          ..initialize();
    // controller.play();
    return controller;
  }

  @override
  void initState() {
    _rxSlug.sink.add('2-week');
    _rxIndex.sink.add(0);
    super.initState();
    playVid(
        "https://mothersclub.me/wp-content/uploads/2021/01/الاسبوع-الثاني.mp4");
  }

  @override
  void dispose() {
    _rxSlug.close();
    _rxIndex.close();
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    double deviceWidth = MediaQuery.of(context).size.width;
    //
    // Future<void> getWeekSlug() nc {
    //   final SharedPreferences prefs = await SharedPreferences.getInstance();
    //   prefs.setString('slug', weekSlug);
    // }

    return Scaffold(
      body: CustomScrollView(slivers: <Widget>[
        SliverToBoxAdapter(
          child: Container(
            height: SizeHelper.of(context).help(
              mobileSmall: 100,
              mobileNormal: 140,
              mobileLarge: 180,
              tabletNormal: 200,
              tabletExtraLarge: 250,
              desktopLarge: 300,
            ),
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
                  Text(
                    Utils.labels!.your_Pregnancy,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: SizeHelper.of(context).help(
                        mobileSmall: 10,
                        mobileNormal: 12,
                        mobileLarge: 14,
                        tabletNormal: 16,
                        tabletExtraLarge: 18,
                        desktopLarge: 20,
                      ),
                    ),
                  ),
                  Divider(
                    height: 13,
                    color: Colors.transparent,
                  ),
                  Text(
                    Utils.labels!.week_pregnancy,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: SizeHelper.of(context).help(
                        mobileSmall: 6,
                        mobileNormal: 8,
                        mobileLarge: 10,
                        tabletNormal: 12,
                        tabletExtraLarge: 14,
                        desktopLarge: 16,
                      ),
                    ),
                  ),
                  Divider(
                    height: SizeHelper.of(context).help(
                      mobileSmall: 15,
                      mobileNormal: 20,
                      mobileLarge: 25,
                      tabletNormal: 35,
                      tabletExtraLarge: 45,
                      desktopLarge: 50,
                    ),
                    color: Colors.transparent,
                  ),
                  FutureBuilder<List<WeeksModel>>(
                      future: Utils.bLoC.weeksList(),
                      builder: (context, snapshot2) {
                        if (snapshot2.hasData) {
                          return Container(
                            height: SizeHelper.of(context).help(
                              mobileSmall: 30,
                              mobileNormal: 40,
                              mobileLarge: 50,
                              tabletNormal: 65,
                              tabletExtraLarge: 75,
                              desktopLarge: 80,
                            ),
                            child: ListView.builder(
                                itemCount: snapshot2.data!.length,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (BuildContext context, int index) {
                                  return StreamBuilder<int>(
                                      stream: _rxIndex.stream,
                                      builder: (context, snapshotStream) {
                                        return Container(
                                          margin: EdgeInsets.symmetric(
                                            horizontal:
                                                SizeHelper.of(context).help(
                                              mobileSmall: 3,
                                              mobileNormal: 5,
                                              mobileLarge: 8,
                                              tabletNormal: 10,
                                              tabletExtraLarge: 13,
                                              desktopLarge: 15,
                                            ),
                                          ),
                                          // height: deviceHeight/,
                                          width: SizeHelper.of(context).help(
                                            mobileSmall: 30,
                                            mobileNormal: 40,
                                            mobileLarge: 50,
                                            tabletNormal: 70,
                                            tabletExtraLarge: 80,
                                            desktopLarge: 100,
                                          ),
                                          decoration: BoxDecoration(
                                            color: snapshotStream.data == index
                                                ? blue_color
                                                : Colors.transparent,
                                            border: Border.all(
                                              color:
                                                  snapshotStream.data == index
                                                      ? Colors.transparent
                                                      : Colors.white24,
                                              width: 1,
                                            ),
                                            borderRadius: BorderRadius.circular(
                                              10.0,
                                            ),
                                          ),
                                          child: GestureDetector(
                                            onTap: () {
                                              _rxIndex.sink.add(index);
                                              //   weekSlug = snapshot2.data![index].slug;
                                              _rxSlug.sink.add(
                                                  snapshot2.data![index].slug);
                                              controller.dispose();
                                              // await getWeekSlug().then((value) {
                                              //   setState(() {});
                                              // });
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
                                                  Text(
                                                      snapshot2
                                                          .data![index].name,
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
                                      });
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
        SliverToBoxAdapter(
          child: StreamBuilder<String>(
              stream: _rxSlug.stream,
              builder: (context, snapshot) {
                if (snapshot.hasData)
                  return FutureBuilder<PregnancyDataModel>(
                      future: Utils.bLoC.weekDetails(snapshot.data!,1),
                      builder: (context, snapshot2) {
                        return snapshot2.connectionState ==
                                ConnectionState.waiting
                            ? Container(
                                padding: EdgeInsets.symmetric(vertical: 50),
                                child:
                                    Center(child: CircularProgressIndicator()))
                            : snapshot2.hasData
                                ? Column(
                                    children: [
                                      Container(
                                        child: FlickVideoPlayer(
                                            flickManager: FlickManager(
                                          videoPlayerController: playVid(
                                            snapshot2.data!.videoLink!,
                                          ),
                                        )),
                                      ),
                                      Padding(
                                          padding: EdgeInsets.all(
                                            SizeHelper.of(context).help(
                                              mobileSmall: 10,
                                              mobileNormal: 12,
                                              mobileLarge: 14,
                                              tabletNormal: 16,
                                              tabletExtraLarge: 18,
                                              desktopLarge: 20,
                                            ),
                                          ),
                                          child: Text(
                                            '${Utils.labels!.pregnancy_tools_resources}',
                                            style: TextStyle(
                                              color: Colors.black45,
                                              fontSize:
                                                  SizeHelper.of(context).help(
                                                mobileSmall: 10,
                                                mobileNormal: 12,
                                                mobileLarge: 14,
                                                tabletNormal: 16,
                                                tabletExtraLarge: 18,
                                                desktopLarge: 20,
                                              ),
                                            ),
                                          )),
                                      Padding(
                                        padding: EdgeInsets.only(
                                            top: 10,
                                            left: 10,
                                            right: 10,
                                            bottom: 50),
                                        child: Container(
                                          margin: EdgeInsets.only(top: 10),
                                          padding: EdgeInsets.only(right: 10),
                                          width: Utils.width,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                              color: Colors
                                                  .white /*RandomColorModel().getColor().withOpacity(0.5)*/),
                                          child: GestureDetector(
                                            onTap: () {
                                              Get.toNamed(Routes.BLOG);
                                            },
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              // mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                               Text(
                                                        snapshot2.data!.name!,
                                                        style: TextStyle(
                                                          fontSize:
                                                              SizeHelper.of(
                                                                      context)
                                                                  .help(
                                                            mobileSmall: 15,
                                                            mobileNormal: 17,
                                                            mobileLarge: 19,
                                                            tabletNormal: 21,
                                                            tabletExtraLarge:
                                                                23,
                                                            desktopLarge: 25,
                                                          ),
                                                        ),
                                                      ),
                                                Divider(
                                                  height: 5,
                                                  color: Colors.red,
                                                ),
                                             Text(
                                                        snapshot2
                                                            .data!.description!,
                                                        style:
                                                            GoogleFonts.roboto(
                                                          fontSize:
                                                              SizeHelper.of(
                                                                      context)
                                                                  .help(
                                                            mobileSmall: 10,
                                                            mobileNormal: 12,
                                                            mobileLarge: 14,
                                                            tabletNormal: 16,
                                                            tabletExtraLarge:
                                                                18,
                                                            desktopLarge: 20,
                                                          ),
                                                          color:
                                                              Black_textColor,
                                                        ),
                                                      ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: SizeHelper.of(context).help(
                                          mobileSmall: 15,
                                          mobileNormal: 17,
                                          mobileLarge: 19,
                                          tabletNormal: 21,
                                          tabletExtraLarge: 23,
                                          desktopLarge: 25,
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                          vertical: SizeHelper.of(context).help(
                                            mobileSmall: 6,
                                            mobileNormal: 8,
                                            mobileLarge: 10,
                                            tabletNormal: 12,
                                            tabletExtraLarge: 14,
                                            desktopLarge: 16,
                                          ),
                                          horizontal:
                                              SizeHelper.of(context).help(
                                            mobileSmall: 6,
                                            mobileNormal: 8,
                                            mobileLarge: 10,
                                            tabletNormal: 12,
                                            tabletExtraLarge: 14,
                                            desktopLarge: 16,
                                          ),
                                        ),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            GestureDetector(
                                              onTap: () {
                                                Navigator.push(context,
                                                    MaterialPageRoute(builder: (c) {
                                                      return AllPregnancyArticles(slug: snapshot.data!);
                                                    }));
                                              },
                                              child: Text(
                                                Utils.labels!.see_all,
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
                                                  fontStyle: FontStyle.normal,
                                                  fontWeight: FontWeight.w500,
                                                  color: primary_text_color,
                                                ),
                                              ),
                                            ),
                                            Container(
                                              height:
                                                  SizeHelper.of(context).help(
                                                mobileSmall: 100,
                                                mobileNormal: 120,
                                                mobileLarge: 140,
                                                mobileExtraLarge: 180,
                                                tabletNormal: 240,
                                                tabletLarge: 300,
                                                tabletExtraLarge: 400,
                                                desktopLarge: 500,
                                              ),
                                              child: ListView.builder(
                                                itemCount: snapshot2
                                                    .data!.articles!.length,
                                                itemBuilder: (
                                                  context,
                                                  index,
                                                ) {
                                                  return PregnancyArticleItem(
                                                    data: snapshot2
                                                        .data!.articles![index],
                                                  );
                                                },
                                                scrollDirection:
                                                    Axis.horizontal,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  )
                                : Container();
                      });
                else
                  return Container();
              }),
        ),
      ]),
    );
  }
}
