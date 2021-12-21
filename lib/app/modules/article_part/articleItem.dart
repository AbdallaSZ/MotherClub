import 'package:flutter/material.dart';
import 'package:motherclub/app/Models/choose_for_you_model.dart';
import 'package:motherclub/app/modules/article_part/article_content.dart';
import 'package:motherclub/common/Constant/ColorConstants.dart';
import 'package:motherclub/common/Utils/Utils.dart';
import 'package:size_helper/size_helper.dart';

class ArticleItem extends StatelessWidget {
  const ArticleItem({Key? key, required this.data}) : super(key: key);
  final ChooseForYouModel data;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (c) {
                return ArticleContent(data: data);
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
            Image.network(data.image!),
            Text('${data.title!.rendered!}',textAlign: TextAlign.center,style: TextStyle(fontSize: SizeHelper.of(context).help(
              mobileSmall: 8,
              mobileNormal: 10,
              mobileLarge: 11,
              tabletNormal: 14,
              tabletExtraLarge: 16,
              desktopLarge: 18,
            ),),),
          ],
        ),
      ),
    );
  }
}
