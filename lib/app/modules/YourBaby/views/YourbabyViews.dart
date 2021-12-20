import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:motherclub/app/Models/MonthsModel.dart';
import 'package:motherclub/app/Models/baby_model.dart';
import 'package:motherclub/app/modules/YourBaby/views/baby_data_list.dart';
import 'package:motherclub/common/Constant/ColorConstants.dart';
import 'package:motherclub/common/CustomWidget/ResorcesListCard.dart';

import 'package:motherclub/common/Utils/Utils.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:size_helper/size_helper.dart';

class YourBabyViews extends StatefulWidget {
  @override
  State<YourBabyViews> createState() => _YourBabyViewsState();
}

class _YourBabyViewsState extends State<YourBabyViews> {
  int tappedIndex = 0;
  late String monthSlug = "1-month";

  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    double deviceWidth = MediaQuery.of(context).size.width;

    Future<void> getMonthSlug() async {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('monthSlug', monthSlug);
    }

    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.white.withOpacity(0.96),
          body: Container(
            height: Utils.deviceHeight,
            child: SingleChildScrollView(
              child: Column(children: [
                Container(
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
                    gradient: LinearGradient(colors: [
                      CustomButton_Color,
                      CustomButton_Second_Color
                    ]),

                    // gradient: colorsConstants.gradient1
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
                            IconButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                icon: Icon(
                                  Icons.arrow_back_ios,
                                  size: SizeHelper.of(context).help(
                                    mobileSmall: 15,
                                    mobileNormal: 17,
                                    mobileLarge: 19,
                                    tabletNormal: 21,
                                    tabletExtraLarge: 23,
                                    desktopLarge: 25,
                                  ),
                                  color: Colors.white,
                                )),
                            Text(
                              Utils.labels!.your_baby,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: SizeHelper.of(context).help(
                                  mobileSmall: 15,
                                  mobileNormal: 17,
                                  mobileLarge: 19,
                                  tabletNormal: 21,
                                  tabletExtraLarge: 23,
                                  desktopLarge: 25,
                                ),
                              ),
                            ),
                            CircleAvatar(
                              radius: 20,
                              backgroundImage: NetworkImage(Utils.prefs!
                                      .getString("imageUrl") ??
                                  "https://c0.klipartz.com/pngpicture/434/847/gratis-png-usuario-de-iconos-de-computadora-empresario-ejecutivo-de-negocios-s.png"),
                            )
                          ],
                        ),
                        Divider(
                          height: 13,
                          color: Colors.transparent,
                        ),
                        Text(
                          Utils.labels!.baby_month,
                          style: TextStyle(
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
                          height: 15,
                          color: Colors.transparent,
                        ),
                        FutureBuilder<List<MonthsModel>>(
                            future: Utils.bLoC.monthsList(context),
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                return Container(
                                  height: SizeHelper.of(context).help(
                                    mobileSmall: 30,
                                    mobileNormal: 40,
                                    mobileLarge: 50,
                                    tabletNormal: 60,
                                    tabletExtraLarge: 85,
                                    desktopLarge: 90,
                                  ),
                                  child: ListView.builder(
                                      itemCount: snapshot.data!.length,
                                      scrollDirection: Axis.horizontal,
                                      itemBuilder:
                                          (BuildContext context, int index) {
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
                                                monthSlug =
                                                    snapshot.data![index].slug;
                                                getMonthSlug();
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
                                                  Text(
                                                    snapshot.data![index].name,
                                                    textAlign: TextAlign.center,
                                                    style: GoogleFonts.roboto(
                                                      fontSize:
                                                          deviceHeight / 58,
                                                      fontWeight:
                                                          FontWeight.w300,
                                                      color: white_color,
                                                    ),
                                                  ),
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
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Text(
                      'Congratulations on your new bundle of joy! Now that your baby arrived, you can find here everything you have to look forward to, from milestones to baby’s growth, plus tips to make life easier.',
                      style: GoogleFonts.roboto(
                          fontSize: SizeHelper.of(context).help(
                            mobileSmall: 10,
                            mobileNormal: 12,
                            mobileLarge: 14,
                            tabletNormal: 16,
                            tabletExtraLarge: 18,
                            desktopLarge: 20,
                          ),
                          fontWeight: FontWeight.w400,
                          color: Colors.black)),
                ),
                BabyDataList(
                  monthSlug: monthSlug,
                ),
              ]),
            ),
          )),
    );
  }
}
