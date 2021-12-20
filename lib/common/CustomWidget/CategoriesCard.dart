import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:motherclub/app/Models/CategoriesModel.dart';
import 'package:motherclub/app/routes/app_pages.dart';
import 'package:motherclub/common/Constant/ColorConstants.dart';
import 'package:motherclub/common/Utils/Dialogs.dart';
import 'package:motherclub/common/Utils/RandomColorModel.dart';
import 'package:motherclub/common/Utils/Utils.dart';

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
                    style: Theme.of(context).textTheme.headline1),
                Divider(
                  height: 5,
                  color: Colors.transparent,
                ),
                Text(
                  '${categoriesModel.description}',
                  style: Theme.of(context).textTheme.bodyText1,
                  maxLines: 3,
                ),
              ],
            ),
          ),
          Flexible(
            flex: 2,
            child: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25.0),
                gradient: LinearGradient(
                    /* begin: FractionalOffset.topCenter,
                  end: FractionalOffset.bottomCenter,*/
                    colors: [CustomButton_Color, CustomButton_Second_Color]),

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
  );
}
