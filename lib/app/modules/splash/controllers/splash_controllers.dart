import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:motherclub/app/NetworkCalls/Api.dart';
import 'package:motherclub/app/routes/app_pages.dart';
import 'package:motherclub/common/Utils/Utils.dart';

class SplashController extends GetxController {
  @override
  void onReady() {
    super.onReady();
     getNonceKey();
    loading();
  }

  getNonceKey()async{
    var myData = await NetworkService.getMyData("api/get_nonce/?controller=user&method=register");
    Utils.userPreferences.setNonce(myData["nonce"]);
  }
  Future<void> loading() async {
    Timer(Duration(seconds: 5), () async {

      if(await Utils.checkapp()==true) {
        String Id = await Utils.userPreferences.getToken();
        print('IDDDD $Id');
        if (Id != '') {
          getursedata();
          Get.offAndToNamed(Routes.BOTTOM);
        }
        else {
          Get.offAndToNamed(Routes.LOGIN);
        }
      }
      else{
        Get.toNamed(Routes.NONETWORKVIEW);
      }
     // Get.offAndToNamed(Routes.LOGIN);
    });

  }
  getursedata(){
    Utils.userPreferences.getUser().then((value){
      Utils.id=value.userId;
      Utils.name=value.display_name;
      Utils.email=value.user_email;
      Utils.ImageUrl=value.user_url;
      print(Utils.name);
    });
  }

// ... Criar outro método
}