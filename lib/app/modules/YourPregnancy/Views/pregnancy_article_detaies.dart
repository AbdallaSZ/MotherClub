import 'package:flutter/material.dart';
import 'package:motherclub/app/Models/pregnancy_data_model.dart';

import 'package:motherclub/common/CustomWidget/statless/header_widget.dart';

class PregnancyArticleDetails extends StatelessWidget {
  const PregnancyArticleDetails({required this.data, Key? key})
      : super(key: key);
  final Article data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      //
      // CustomAppBar(
      //   centerTitle: true,
      //   titleSize: SizeHelper.of(context).help(
      //     mobileSmall: 10,
      //     mobileNormal: 12,
      //     mobileLarge: 14,
      //     tabletNormal: 16,
      //     tabletExtraLarge: 18,
      //     desktopLarge: 20,
      //   ),
      //   title: data.title!.rendered,
      //   withBackButton: true,
      //   onBackButtonPressed: () {
      //     Navigator.pop(context);
      //   },
      // ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              headerWidget(context,data.title!.rendered!,),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(

                  data.content!.rendered!,
                  textAlign: TextAlign.end,
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
