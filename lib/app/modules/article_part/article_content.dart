import 'package:flutter/material.dart';
import 'package:motherclub/app/Models/choose_for_you_model.dart';
import 'package:motherclub/common/CustomWidget/statless/custom_appbar.dart';

class ArticleContent extends StatelessWidget {
  const ArticleContent({required this.data, Key? key}) : super(key: key);
  final ChooseForYouModel data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        centerTitle: true,
        titleSize: 18,
        title: data.title!.rendered,
        withBackButton: true,
        onBackButtonPressed: () {
          Navigator.pop(context);
        },
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Text(data.content!.rendered!, textAlign: TextAlign.center,style: TextStyle(color: Colors.black54),),
        ),
      ),
    );
  }
}
