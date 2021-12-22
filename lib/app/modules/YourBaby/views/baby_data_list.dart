import 'package:flutter/material.dart';
import 'package:motherclub/app/Models/baby_model.dart';
import 'package:motherclub/common/Constant/ColorConstants.dart';
import 'package:motherclub/common/CustomWidget/ResorcesListCard.dart';
import 'package:motherclub/common/Utils/Utils.dart';
import 'package:size_helper/size_helper.dart';

class BabyDataList extends StatelessWidget {
  const BabyDataList({Key? key, this.monthSlug = '1-month'}) : super(key: key);
  final monthSlug;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<BabyModel>>(
        future: Utils.bLoC.babyList(monthSlug),
        builder: (context, snapshot) {
          return snapshot.connectionState == ConnectionState.waiting
              ? Center(child: CircularProgressIndicator())
              : Column(
                children: [
                  Container(
                      height: SizeHelper.of(context).help(
                        mobileSmall: 200,
                        mobileNormal: 300,
                        mobileLarge: 400,
                        mobileExtraLarge: 500,
                        tabletNormal: 600,
                        tabletLarge: 700,
                        tabletExtraLarge: 800,
                        desktopLarge: 900,
                      ),
                      child: ListView.builder(
                        itemBuilder: (BuildContext _, int index) {
                          return Padding(
                              padding: EdgeInsets.all(10),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10),
                                  ),
                                  color: yourbabyCard,

                                ),
                                child: Column(
                                  children: [
                                    Container(
                                      child: ExpansionTile(
                                          onExpansionChanged: (value) {},
                                          title: Text(
                                            snapshot.data![index].name!,
                                            style: TextStyle(
                                              color: Colors.black45,
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
                                          children: <Widget>[
                                            Container(
                                              padding: EdgeInsets.only(
                                                  left: 10, right: 10),
                                              height: Utils.deviceHeight / 3,
                                              child: ListView.builder(
                                                  itemCount: snapshot
                                                      .data![index].posts!.length,
                                                  scrollDirection: Axis.vertical,
                                                  itemBuilder: (ctx, int i) {
                                                    return ResorcesListCard(
                                                      snapshot
                                                          .data![index].posts![i],
                                                      ctx,
                                                    );
                                                  }),
                                            )
                                          ]),
                                    )
                                  ],
                                ),
                              ));
                        },
                        itemCount: snapshot.data!.length,
                      ),
                    ),
                ],
              );
        });
  }
}
