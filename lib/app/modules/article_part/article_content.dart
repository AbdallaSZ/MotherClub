import 'package:flutter/material.dart';
import 'package:motherclub/app/Models/choose_for_you_model.dart';
import 'package:motherclub/common/CustomWidget/statless/custom_appbar.dart';
import 'package:motherclub/common/CustomWidget/statless/header_widget.dart';
import 'package:motherclub/common/Utils/Utils.dart';

class ArticleContent extends StatelessWidget {
  const ArticleContent({required this.data, Key? key}) : super(key: key);
  final ChooseForYouModel data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              headerWidget(context, data.title!.rendered!),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(data.content!.rendered!, textAlign: Utils.locality == Locality.arabic ? TextAlign.start : TextAlign.end,style: TextStyle(color: Colors.black54),),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
