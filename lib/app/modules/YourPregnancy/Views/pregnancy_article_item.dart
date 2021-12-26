import 'package:flutter/material.dart';
import 'package:motherclub/app/Models/pregnancy_data_model.dart';
import 'package:motherclub/app/modules/YourPregnancy/Views/pregnancy_article_detaies.dart';
import 'package:motherclub/common/Constant/ColorConstants.dart';
import 'package:size_helper/size_helper.dart';

class PregnancyArticleItem extends StatelessWidget {
  const PregnancyArticleItem({Key? key,required this.data}) : super(key: key);
  final Article data;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (c) {
              return PregnancyArticleDetails(data: data);
            }));
      },
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Color(0xffe0e0e0),
              spreadRadius: 1,
              blurRadius: 5,
              offset: Offset(0, 0), // changes position of shadow
            ),
          ],
          borderRadius: BorderRadius.circular(10),
          color: white_color,
        ),
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        padding: const EdgeInsets.symmetric(horizontal: 10),
        height: SizeHelper.of(context).help(
          mobileSmall: 180,
          mobileLarge: 200.0,
          tabletNormal: 240.0,
          tabletExtraLarge: 325.0,
          desktopLarge: 380.0,
        ),
        width: SizeHelper.of(context).help(
          mobileSmall: 140,
          mobileLarge: 160,
          tabletNormal: 200,
          tabletExtraLarge: 280,
          desktopLarge: 340,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Flexible(flex:1,child: Image.network(data.image!)),
            Flexible(flex:1,
              child: Text('${data.title!.rendered!}',textAlign: TextAlign.center,style: TextStyle(fontSize: SizeHelper.of(context).help(
                mobileSmall: 8,
                mobileNormal: 10,
                mobileLarge: 11,
                tabletNormal: 14,
                tabletExtraLarge: 16,
                desktopLarge: 18,
              ),),),
            ),
          ],
        ),
      ),
    );
  }
}