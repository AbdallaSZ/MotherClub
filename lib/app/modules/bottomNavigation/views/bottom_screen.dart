import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:motherclub/app/modules/bottomNavigation/controllers/bottom_conroller.dart';
import 'package:motherclub/app/modules/home/views/home_views.dart';

class BottomScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Obx(
          () => Scaffold(

        body: BottomController.to.currentPage,
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          // backgroundColor: Color(0xFF6200EE),
          // selectedItemColor: Colors.purple,
          unselectedItemColor: Colors.black.withOpacity(.60),
          selectedFontSize: 12,
          unselectedFontSize: 12,
          fixedColor: Color(0xffFF4550),
          currentIndex: BottomController.to.currentIndex.value,
          onTap: BottomController.to.changePage,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), title: Text("Home")),
            BottomNavigationBarItem(
                icon: Icon(Icons.grid_on_sharp), title: Text("Category")),
            BottomNavigationBarItem(
                icon: Icon(Icons.forum), title: Text("Forum")),
            BottomNavigationBarItem(
                icon: Icon(Icons.shopping_basket), title: Text("Store")),
            BottomNavigationBarItem(
                icon: Icon(Icons.account_circle), title: Text("My Account")),

          ],
        ),
      ),
    );
  }
}