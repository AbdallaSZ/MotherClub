import 'package:flutter/material.dart';
import 'package:motherclub/app/Models/pregnancy_data_model.dart';
import 'package:motherclub/common/CustomWidget/statless/custom_appbar.dart';

class PregnancyArticleDetails extends StatelessWidget {
  const PregnancyArticleDetails({required this.data, Key? key}) : super(key: key);
  final Article data;

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
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(data.content!.rendered!, textAlign: TextAlign.center,style: TextStyle(color: Colors.black54),),
        ),
      ),
    );
  }
}
