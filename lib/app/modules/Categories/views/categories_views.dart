import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:motherclub/app/Models/CategoriesModel.dart';
import 'package:motherclub/app/Shimmers/FurmShimmer.dart';
import 'package:motherclub/app/modules/Categories/controllers/CalegoriesController.dart';
import 'package:motherclub/app/routes/app_pages.dart';
import 'package:motherclub/common/Constant/ColorConstants.dart';
import 'package:motherclub/common/CustomWidget/CategoriesCard.dart';
import 'package:motherclub/common/CustomWidget/appBarWidget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:motherclub/common/Utils/Utils.dart';
import 'package:size_helper/size_helper.dart';

class CategoriesView extends GetView<CategoriesController> {
  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    double deviceWidth = MediaQuery.of(context).size.width;
    List<String> routes = [
      Routes.YOURPREGNANCY,
      Routes.YOURBABY,
      Routes.FORUM,
      Routes.STORE
    ];
    return Scaffold(
        backgroundColor: Background_Color,
        body: FutureBuilder<List<CategoriesModel>>(
            future: Utils.bLoC.categoresList(context),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<CategoriesModel>? data = snapshot.data;
                return Center(
                  child: ListView.separated(
                      separatorBuilder: (BuildContext context, int index) {
                        return SizedBox(
                          height: SizeHelper.of(context).help(
                            mobileSmall: 0,
                            mobileNormal: 0,
                            mobileLarge: 0,
                            mobileExtraLarge: 0,
                            tabletSmall: 0,
                            tabletNormal: 14,
                            tabletLarge: 22,
                            tabletExtraLarge: 24,
                            desktopLarge: 25,
                          ),

                        );
                      },
                    shrinkWrap: true,
                      itemCount: data!.length,
                      itemBuilder: (BuildContext context, int index) {
                        return CategoriresCard(deviceHeight, deviceWidth,
                            context, data[index], routes[index]);
                      }),
                );
              } else {
                return ListView.builder(
                    itemCount: 10,
                    itemBuilder: (BuildContext context, int index) {
                      return Card(
                          child: FurmShimmer(
                              deviceHeight, deviceWidth, context));
                    });
              }
            }));
  }
}
