import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:motherclub/app/Models/CategoriesModel.dart';
import 'package:motherclub/app/routes/app_pages.dart';
import 'package:motherclub/common/Constant/ColorConstants.dart';
import 'package:motherclub/common/Utils/Dialogs.dart';
import 'package:motherclub/common/Utils/RandomColorModel.dart';
import 'package:size_helper/size_helper.dart';
import 'package:motherclub/common/Utils/Utils.dart';

Widget CategoriresCard(double height, double width, BuildContext context,
    CategoriesModel categoriesModel, String route) {
  return GestureDetector(
    onTap: () => Get.toNamed(route, arguments: {'fromCat': true}),
    child: Container(
      margin: EdgeInsets.only(top: 10),
      padding: EdgeInsets.all(10),
      height: SizeHelper.of(context).help(
        mobileSmall: 90,
        mobileLarge: 110,
        tabletNormal: 130,
        tabletExtraLarge: 150,
        desktopLarge: 170,
      ),
      width: width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: RandomColorModel().getColor().withOpacity(0.5)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
              flex: 2,
              child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  child: Image.network(categoriesModel.image))),
Widget CategoriresCard(double height, double width, BuildContext context,
    CategoriesModel categoriesModel, String route) {
  return GestureDetector(
    onTap: () {
      if (Utils.id == "" && route == Routes.FORUM) {
        showDialog(
            context: context,
            builder: (c) {
              return loginDialog;
            });
      }
      else
      Get.toNamed(route, arguments: {'fromCat': true});
    },
    child: Container(
      margin: EdgeInsets.only(top: 10),
      padding: EdgeInsets.all(10),
      height: height / 6,
      width: width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: RandomColorModel().getColor().withOpacity(0.5)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(flex: 2, child: Image.network(categoriesModel.image)),
          Flexible(
            flex: 4,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('${categoriesModel.title}',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: SizeHelper.of(context).help(
                          mobileSmall: 10,
                          mobileNormal: 12,
                          mobileLarge: 14,
                          tabletNormal: 16,
                          tabletExtraLarge: 18,
                          desktopLarge: 20,
                        ),
                        color: Colors.white)),
                Divider(
                  height: 5,
                  color: Colors.transparent,
                ),
                Text('${categoriesModel.description}',
                    style: TextStyle(
                        fontSize: SizeHelper.of(context).help(
                          mobileSmall: 6,
                          mobileNormal: 8,
                          mobileLarge: 10,
                          tabletNormal: 12,
                          tabletExtraLarge: 14,
                          desktopLarge: 16,
                        ),
                        color: Colors.white)),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
