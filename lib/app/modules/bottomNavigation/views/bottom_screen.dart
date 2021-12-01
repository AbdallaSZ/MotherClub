import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:motherclub/app/language/LangaugeBloc.dart';
import 'package:motherclub/app/language/LanguageEvent.dart';
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
  List<String> titles= [

  ];
  String _radioValue = Utils.locality == Locality.english
      ? "en"
      : Utils.locality == Locality.arabic
      ? "ar"
      : Utils.locality == Locality.spanish
      ? "es"
      : "ur"; //Initial definition of radio button value
  String? choice;
  LanguageBloc? _bloc;

  void radioButtonChanges(String? value) {
    Navigator.pop(context);
    setState(() {
      _radioValue = value!;
      switch (value) {
        case 'en':
          choice = value;
          break;
        case 'ar':
          choice = value;
          break;
        default:
          choice = null;
      }
      debugPrint(choice); //Debug the choice in console
    });
    //      Strings.isEnglish = value;

    if (choice == "en") {
      _bloc!.add(LanguageEvent( Locale("en", "")));
      Get.updateLocale(Locale("en", ""));
    } else if (choice == "ar") {
      _bloc!.add(LanguageEvent(  Locale("ar", "")));
      Get.updateLocale(Locale("ar", ""));
    }
    Future.delayed(Duration(milliseconds: 500)).then((value) {
      Utils.languageSubject.sink.add(true);

    });
  }
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
  _bloc = BlocProvider.of<LanguageBloc>(context);

  super.initState();
  }
  @override
  Widget build(BuildContext context) {
    Utils.initializeLocality(context);
    titles= [    Utils.labels!.home,
      Utils.labels!.category,
      Utils.labels!.forum,
      Utils.labels!.store,
      Utils.labels!.my_account,];
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
                       GestureDetector(
                           onTap: (){
                             showDialog(
                                 context: context,
                                 builder: (c) {
                                   return Directionality(
                                     textDirection: Utils.locality == Locality.english ? TextDirection.ltr : TextDirection.rtl,
                                     child: AlertDialog(
                                         title: Text(
                                           Utils.labels!.change_language,
                                         ),
                                         content: Container(
                                           alignment: Alignment.centerRight,
                                           height: 120,
                                           width: 200,
                                           child: Column(
                                               crossAxisAlignment:
                                               CrossAxisAlignment.start,
                                               children: [
                                                 GestureDetector(
                                                   onTap: () {
                                                     radioButtonChanges("en");
                                                   },
                                                   child: Row(
                                                     mainAxisAlignment:
                                                     MainAxisAlignment.spaceBetween,
                                                     children: <Widget>[
                                                       Expanded(
                                                         flex: 6,
                                                         child: Text(
                                                           "English",
                                                         ),
                                                       ),
                                                       Expanded(
                                                         flex: 1,
                                                         child: Radio(
                                                           value: 'en',
                                                           groupValue: _radioValue,
                                                           onChanged: radioButtonChanges,
                                                         ),
                                                       ),
                                                     ],
                                                   ),
                                                 ),
                                                 GestureDetector(
                                                   onTap: () {
                                                     radioButtonChanges("ar");
                                                   },
                                                   child: Row(
                                                     mainAxisAlignment:
                                                     MainAxisAlignment.spaceBetween,
                                                     children: <Widget>[
                                                       Expanded(
                                                         flex: 6,
                                                         child: Text(
                                                           "اللغة العربية",
                                                         ),
                                                       ),
                                                       Expanded(
                                                         flex: 1,
                                                         child: Radio(
                                                           value: 'ar',
                                                           groupValue: _radioValue,
                                                           onChanged: radioButtonChanges,
                                                         ),
                                                       ),
                                                     ],
                                                   ),
                                                 ), /*
                                   Row(
                                     mainAxisAlignment: MainAxisAlignment.spaceBetween ,
                                     children: <Widget>[
                                       Expanded(
                                         flex:6,
                                         child: Text(
                                           "Spanish",
                                         ),
                                       ),
                                       Expanded(
                                         flex:1,
                                         child: Radio(
                                           value: 'es',
                                           groupValue: _radioValue,
                                           onChanged: radioButtonChanges,
                                         ),
                                       ),

                                     ],
                                   ),
                                   Row(
                                     mainAxisAlignment: MainAxisAlignment.spaceBetween ,
                                     children: <Widget>[
                                       Expanded(
                                         flex:6,
                                         child: Text(
                                           "اللغة الأردية",
                                         ),
                                       ),
                                       Expanded(
                                         flex:1,
                                         child: Radio(
                                           value: 'ur',
                                           groupValue: _radioValue,
                                           onChanged: radioButtonChanges,
                                         ),
                                       ),

                                     ],
                                   ),*/
                                               ]),
                                         )),
                                   );
                                 });
                             if (choice == "en") {
                               _bloc!.add(LanguageEvent(Locale("en", "")));
                             } else if (choice == "ar") {
                               _bloc!.add(LanguageEvent( Locale("ar", "")));
                             }
                           },
                           child: Image.asset('assets/images/translate.png')),
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

  Widget get currentPage => pages[currentIndex];

  void changePage(int _index) {
    currentIndex = _index;

    rxPages.sink.add(_index);
  }
}