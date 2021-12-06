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
                  height: deviceHeight / 3.5,
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
                                  color: Colors.white,
                                )),
                            Text(
                              Utils.labels!.your_baby,
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
                          Utils.labels!.baby_month,
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                        Divider(
                          height: 15,
                          color: Colors.transparent,
                        ),
                        FutureBuilder<List<MonthsModel>>(
                            future: Utils.bLoC.monthsList(context),
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                List<MonthsModel>? data = snapshot.data;

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
                                          width: deviceWidth / 7,
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
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.black)),
                ),
                BabyDataList(monthSlug: monthSlug,),
              ]),
            ),
          )),
    );
  }
}
