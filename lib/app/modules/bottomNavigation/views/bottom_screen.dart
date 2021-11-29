import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:motherclub/app/modules/Categories/views/categories_views.dart';
import 'package:motherclub/app/modules/Store/views/store_view.dart';
import 'package:motherclub/app/modules/account/views/account_view.dart';
import 'package:motherclub/app/modules/bottomNavigation/controllers/bottom_conroller.dart';
import 'package:motherclub/app/modules/forum/views/forum_view.dart';
import 'package:motherclub/app/modules/home/views/home_views.dart';
import 'package:motherclub/common/CustomWidget/statless/custom_appbar.dart';
import 'package:motherclub/common/Utils/Utils.dart';
import 'package:rxdart/rxdart.dart';
class a {
  int? id ;
}class w extends a {

}class s extends w {

}
class BottomScreen extends StatefulWidget {

  @override
  _BottomScreenState createState() => _BottomScreenState();
}


class _BottomScreenState extends State<BottomScreen> {
  int currentIndex = 0;
  BehaviorSubject<int> rxPages = BehaviorSubject();
  @override
  void dispose() {
    // TODO: implement dispose
    rxPages.close();
    super.dispose();
  }
  @override
  void initState() {
    // TODO: implement initState
  rxPages.sink.add(currentIndex);

  super.initState();
  }
  @override
  Widget build(BuildContext context) {
    Utils.initializeLocality(context);

    return StreamBuilder<bool>(
            stream: Utils.languageSubject,
            builder: (context, snapshot) {
                if(snapshot.hasData && snapshot.data == true)Utils.initializeMyLocality(context);
              return StreamBuilder<int>(
                stream: rxPages.stream,
                builder: (context, mySnapshot) {
                  return Scaffold(
                   appBar: CustomAppBar(
                     centerTitle: true,
                     title: titles[currentIndex],
                     actions: [
                       if(titles[currentIndex] == Utils.labels!.store)
                       Icon(Icons.search, color: Colors.black87,),
                       SizedBox(width: 20,),
                       Image.asset('assets/images/translate.png'),
                     ],
                   ),
                   body: currentPage,
                   bottomNavigationBar: BottomNavigationBar(
                  type: BottomNavigationBarType.fixed,
                  // backgroundColor: Color(0xFF6200EE),
                  // selectedItemColor: Colors.purple,
                  unselectedItemColor: Colors.black.withOpacity(.60),
                  selectedFontSize: 12,
                  unselectedFontSize: 12,
                  fixedColor: Color(0xffFF4550),
                  currentIndex: mySnapshot.data!,
                  onTap: changePage,
                  items: [
                    BottomNavigationBarItem(icon: Icon(Icons.home), title: Text(Utils.labels!.home)),
                    BottomNavigationBarItem(
                        icon: Icon(Icons.grid_on_sharp), title: Text(Utils.labels!.category)),
                    BottomNavigationBarItem(
                        icon: Icon(Icons.forum), title: Text(Utils.labels!.forum)),
                    BottomNavigationBarItem(
                        icon: Icon(Icons.shopping_basket), title: Text(Utils.labels!.store)),
                    BottomNavigationBarItem(
                        icon: Icon(Icons.account_circle), title: Text(Utils.labels!.my_account)),

                  ],
        ),

    );
                }
              );
  });
}


   List<Widget> pages = [
    HomeView(),
    CategoriesView(),
    ForumView(),
    StoreView(),
    AccountView(),
  ];
  static List<String> titles= [
    Utils.labels!.home,
    Utils.labels!.category,
    Utils.labels!.forum,
    Utils.labels!.store,
    Utils.labels!.my_account,
  ];
  Widget get currentPage => pages[currentIndex];

  void changePage(int _index) {
    currentIndex = _index;

    rxPages.sink.add(_index);
  }
}