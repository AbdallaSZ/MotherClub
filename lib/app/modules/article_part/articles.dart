import 'package:flutter/material.dart';
import 'package:motherclub/app/Models/choose_for_you_model.dart';
import 'package:motherclub/app/Shimmers/GridShimmer.dart';
import 'package:motherclub/app/modules/article_part/articleItem.dart';
import 'package:motherclub/common/Utils/Utils.dart';
import 'package:size_helper/size_helper.dart';
class ChooseForYouWidget extends StatelessWidget {
  const ChooseForYouWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
        padding: EdgeInsets.all(10),
      height: SizeHelper.of(context).help(
        mobileSmall: 180,
        mobileLarge: 200.0,
        tabletNormal: 240.0,
        tabletExtraLarge: 325.0,
        desktopLarge: 380.0,
      ),

        child: FutureBuilder<List<ChooseForYouModel>>(
          future: Utils.bLoC.articles(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              var data = snapshot.data;
                return ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: data!.length,
                  itemBuilder: (
                      context,
                      index,
                      ) {
                    return GestureDetector(
                        onTap: () {

                        },
                        child: ArticleItem(
                          data: data[index],
                          // isLiked: false,
                        ));
                  },
                );
              } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }
            return GridShimmer(
                deviceWidth: Utils.deviceWidth, deviceHeight: 200);
          },
        ),
      );

  }
}
