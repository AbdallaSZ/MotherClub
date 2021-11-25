
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:motherclub/common/Constant/ColorConstants.dart';
import 'package:motherclub/common/CustomWidget/statless/appbar_back_button.dart';
import 'package:motherclub/common/Utils/Utils.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  CustomAppBar({
    Key ?key,
    this.title = '',
    this.titleSize = 21,
    this.withBackButton = false,
    this.onBackButtonPressed,
    this.tabBar,
    this.actions,
    this.centerTitle = false,
    this.extraHeight = 20.0,
  })  : preferredSize = Size.fromHeight(
      kToolbarHeight + (tabBar?.preferredSize.height ?? 0.0)),
        super(key: key);
  final String ?title;
  final double titleSize;
  final bool withBackButton;
  final bool centerTitle;
  final double extraHeight;

  ///To use this parameter you need first to make:
  ///```dart
  ///withBackButton = true
  ///```
  final Function ?onBackButtonPressed;
  final TabBar ?tabBar;
  final List<Widget> ?actions;
  @override
  final Size preferredSize; // default is 56.0


  @override
  Widget build(BuildContext context) {
    return AppBar(

      toolbarHeight: kToolbarHeight + extraHeight,
      title: Text('$title' , style: TextStyle(color: Colors.pinkAccent),),
        // style: Theme.of(context).textTheme.bodyText1.copyWith(
        //   fontWeight: FontWeight.w400,
        //   fontSize: SizeHelper.of(context).help(
        //     mobileExtraLarge: 20,
        //     tabletLarge: 24,
        //     desktopSmall: 26,
        //   ),
        // ),),
      centerTitle: centerTitle,
      elevation: 0,
      backgroundColor:Colors.white ,
      automaticallyImplyLeading: withBackButton,
      leadingWidth: 100,
      leading: withBackButton
          ? AppBarBackButton(
        onPressed: () {
           onBackButtonPressed!();

        })
          :   Container(
        child: Row(
          children: [
            Align(
                alignment: Alignment.centerLeft,
                child: Image.asset('assets/images/sort.png',height: 37,width:  Utils.deviceWidth/14,)),

            Image.asset('assets/images/logo.png',width: Utils.deviceWidth/6,height: Utils.deviceHeight/8,),
            Text('',style: GoogleFonts.roboto(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: Black_textColor),),
            // Image.asset('assets/images/logo.png',width: 120,height: 87,),

          ],
        ),
      ),
      bottom: tabBar,
      actions: actions,
    );
  }
}
