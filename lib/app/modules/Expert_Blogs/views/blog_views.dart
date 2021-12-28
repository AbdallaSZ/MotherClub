import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:motherclub/app/Models/baby_model.dart';
import 'package:motherclub/common/Constant/ColorConstants.dart';
import 'package:motherclub/common/CustomWidget/statless/custom_appbar.dart';
import 'package:motherclub/common/Utils/Utils.dart';
import 'package:size_helper/size_helper.dart';

class BlogViews extends StatelessWidget {
  BlogViews(this.post);

  final Post post;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Background_Color,
      appBar: CustomAppBar(
        title: Utils.labels!.mother_club,
        withBackButton: true,
        centerTitle: true,
        onBackButtonPressed: () {
          Navigator.pop(context);
        },
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Center(
            child: Text(
              post.content!.rendered!,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: SizeHelper.of(context).help(
                  mobileSmall: 12,
                  mobileNormal: 14,
                  mobileLarge: 14,
                  tabletNormal: 18,
                  tabletExtraLarge: 28,
                  desktopLarge: 30,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
