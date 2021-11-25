import 'package:expandable/expandable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:motherclub/app/Models/MonthsModel.dart';
import 'package:motherclub/app/modules/YourBaby/controller/YourBabyController.dart';
import 'package:motherclub/common/Constant/ColorConstants.dart';
import 'package:motherclub/common/CustomWidget/ResorcesListCard.dart';
import 'package:motherclub/common/CustomWidget/VideoViewList.dart';
import 'package:motherclub/common/CustomWidget/statless/custom_appbar.dart';
import 'package:motherclub/common/Utils/Utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

class YourbabyViews extends StatefulWidget {

  @override
  State<YourbabyViews> createState() => _YourbabyViewsState();
}

class _YourbabyViewsState extends State<YourbabyViews> {

  int tappedIndex = 0;
  late String monthSlug = "1-month";


  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    double deviceWidth = MediaQuery.of(context).size.width;


    Future<void> getMonthSlug() async {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('slug', monthSlug);
    }

    return SafeArea(
      child: Scaffold(
          appBar: CustomAppBar(
            onBackButtonPressed: Navigator.of(context).pop,
            centerTitle: true,
            withBackButton: true,
            title: Utils.labels!.your_baby,
          ),
          backgroundColor: Colors.white.withOpacity(0.96),
          body: CustomScrollView(slivers: <Widget>[
            SliverToBoxAdapter(
              child: Container(
                height: deviceHeight / 3.5,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(0.0),
                  gradient: LinearGradient(
                      colors: [CustomButton_Color, CustomButton_Second_Color]),

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
                          future: Utils.bLoC.months_list(context),
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              List<MonthsModel>? data = snapshot.data;
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
            SliverToBoxAdapter(
              child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Text(
                      'Congratulations on your new bundle of joy! Now that your baby arrived, you can find here everything you have to look forward to, from milestones to baby’s growth, plus tips to make life easier.',
                      style: GoogleFonts.roboto(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Colors.black))),
            ),
            /*  SliverToBoxAdapter(
                  child:   Padding(
                      padding: EdgeInsets.all(10),
                      child: Text('Pregnancy Tools & Resources',style: Theme.of(context).textTheme.headline4,)),
                ),*/

            /* SliverToBoxAdapter(
                 child: Container(
                   height: 500,
                   decoration: BoxDecoration(
                     color:Colors.white),
                   child: Column(
                     children: [

                       Card(
                         child: new ExpansionTile(
                             title: new  Text('Pregnancy Tools & Resources',style: Theme.of(context).textTheme.headline4,),
                             children: <Widget>[
                               Container(
                                 height: 500,
                                 child: ListView.builder(
                                   itemCount: 10,
                                   scrollDirection: Axis.vertical,
                                   itemBuilder: (BuildContext context,int index){
                                     return ResorcesListCard(deviceHeight, deviceWidth, context);
                                   }
                                   ),
                               )
                             ]
                         ),
                       )

      ],
                   ),

                 ),
               ),*/
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return InkWell(
                      onTap: () {},
                      child: Padding(
                          padding: EdgeInsets.all(10),
                          child: Container(
                            //sheight: 500,
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                color: yourbabyCard),
                            //

                            child: Column(
                              children: [
                                Container(
                                  child: ExpansionTile(
                                      onExpansionChanged: (value) {},
                                      title: Text(
                                        'ss',
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline4,
                                      ),
                                      children: <Widget>[
                                        Container(
                                          padding: EdgeInsets.only(
                                              left: 10, right: 10),
                                          height: deviceHeight / 3,
                                          child: ListView.builder(
                                              itemCount: 10,
                                              scrollDirection: Axis.vertical,
                                              itemBuilder:
                                                  (BuildContext context,
                                                      int index) {
                                                return ResorcesListCard(
                                                    deviceHeight,
                                                    deviceWidth,
                                                    context,
                                                    "");
                                              }),
                                        )
                                      ]),
                                )
                              ],
                            ),
                          )));
                },
                childCount: 5,
              ),
            ),
          ])),
    );
  }
}
