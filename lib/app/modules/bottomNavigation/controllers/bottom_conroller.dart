
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:motherclub/app/SearchModule/SearchBloc.dart';
import 'package:motherclub/app/modules/Categories/views/categories_views.dart';
import 'package:motherclub/app/modules/Store/views/store_view.dart';
import 'package:motherclub/app/modules/account/views/account_view.dart';
import 'package:motherclub/app/modules/forum/views/forum_view.dart';
import 'package:motherclub/app/modules/home/views/home_views.dart';
import 'package:motherclub/app/routes/app_pages.dart';

class BottomController extends GetxController {
  static BottomController get to => Get.find();

  final currentIndex = 0.obs;

  List<Widget> pages = [
    HomeView(),
    CategoriesView(),
    ForumView(),
    StoreView(),
    AccountView(),
  ];



  Widget get currentPage => pages[currentIndex.value];


  void changePage(int _index) {
    currentIndex.value = _index;
  }
}