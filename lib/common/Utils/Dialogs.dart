import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:motherclub/app/routes/app_pages.dart';

import 'Utils.dart';

Dialog loginDialog = Dialog(
  shape: RoundedRectangleBorder(
borderRadius: BorderRadius.all(Radius.circular(32.0))),
  child: Container(
    height: 160,
    child: Column(
      children: [

        Row(
        mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsetsDirectional.only(start: 16.0 , top: 16),
              child: Text(Utils.labels!.warning, style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
            ),
          ],
        ),
        SizedBox(height: 15,),
        Text(Utils.labels!.you_have_to_login_first, style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
        Spacer(),
        Row(
          children: [
            Expanded(child:    FlatButton(onPressed: (){
              Get.back();
            },  child: Text(Utils.labels!.not_now,style: TextStyle(color: Colors.red),),),)
           , Expanded(child:   FlatButton(onPressed: (){
             Get.offAndToNamed(Routes.LOGIN);
            },  child: Text(Utils.labels!.login,style: TextStyle(color: Colors.green.shade800),),),),
          ],

        )
      ],
    ),
  ),

);