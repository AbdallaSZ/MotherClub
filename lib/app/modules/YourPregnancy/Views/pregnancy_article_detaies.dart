import 'package:flutter/material.dart';
import 'package:motherclub/app/Models/pregnancy_data_model.dart';

import 'package:motherclub/common/CustomWidget/statless/header_widget.dart';
import 'package:motherclub/common/Utils/Utils.dart';

class PregnancyArticleDetails extends StatelessWidget {
  const PregnancyArticleDetails({required this.data, Key? key})
      : super(key: key);
  final Article data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              headerWidget(context,'${data.title!.rendered!}',),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  data.content!.rendered!,
                  textAlign: Utils.locality == Locality.arabic ? TextAlign.start : TextAlign.end,
                  style: TextStyle(color: Colors.black45),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
