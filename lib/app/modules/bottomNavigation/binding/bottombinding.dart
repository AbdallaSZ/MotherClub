import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:motherclub/app/modules/bottomNavigation/controllers/bottom_conroller.dart';

class BottomBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BottomController>(() => BottomController());

  }
}