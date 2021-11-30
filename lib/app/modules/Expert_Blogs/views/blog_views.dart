import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:motherclub/app/Models/baby_model.dart';
import 'package:motherclub/common/Constant/ColorConstants.dart';
import 'package:motherclub/common/CustomWidget/statless/custom_appbar.dart';
import 'package:motherclub/common/Utils/Utils.dart';

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
        child: Center(
           child: Text(post.content!.rendered!),
        ),
      ),
    );
  }
}
