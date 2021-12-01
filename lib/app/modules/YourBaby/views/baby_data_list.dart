import 'package:flutter/material.dart';
import 'package:motherclub/app/Models/baby_model.dart';
import 'package:motherclub/common/Constant/ColorConstants.dart';
import 'package:motherclub/common/CustomWidget/ResorcesListCard.dart';
import 'package:motherclub/common/Utils/Utils.dart';
class BabyDataList extends StatelessWidget {
  const BabyDataList({Key? key,this.monthSlug = '7-month'}) : super(key: key);
final monthSlug;
  @override
  Widget build(BuildContext context) {
    return    FutureBuilder<List<BabyModel>>(
        future: Utils.bLoC.babyList(monthSlug),
        builder: (context, snapshot) {
          return snapshot.connectionState == ConnectionState.waiting
              ? Center(child: CircularProgressIndicator())
              : Container(
            height: Utils.deviceHeight /2,
            child: ListView.builder(
              itemBuilder: (BuildContext _, int index) {
                return Padding(
                    padding: EdgeInsets.all(10),
                    child: Container(
                      //sheight: 500,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                              Radius.circular(10)),
                          color: yourbabyCard),
                      child: Column(
                        children: [
                          Container(
                            child: ExpansionTile(
                                onExpansionChanged:
                                    (value) {},
                                title: Text(
                                  snapshot.data![index].name!,
                                ),
                                children: <Widget>[
                                  Container(
                                    padding: EdgeInsets.only(
                                        left: 10, right: 10),
                                    height: Utils.deviceHeight / 3,
                                    child: ListView.builder(
                                        itemCount: snapshot
                                            .data![index]
                                            .posts!
                                            .length,
                                        scrollDirection:
                                        Axis.vertical,
                                        itemBuilder:
                                            (ctx, int i) {
                                          return ResorcesListCard(
                                            snapshot
                                                .data![index]
                                                .posts![i],
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
          );
        });
  }
}
