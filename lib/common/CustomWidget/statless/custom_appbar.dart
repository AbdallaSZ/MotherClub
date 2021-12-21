import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:motherclub/common/Constant/ColorConstants.dart';
import 'package:motherclub/common/CustomWidget/statless/appbar_back_button.dart';
import 'package:motherclub/common/Utils/Utils.dart';
import 'package:size_helper/size_helper.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  CustomAppBar({
    Key? key,
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
  final String? title;
  final double titleSize;
  final bool withBackButton;
  final bool centerTitle;
  final double extraHeight;

  ///To use this parameter you need first to make:
  ///```dart
  ///withBackButton = true
  ///```
  final Function? onBackButtonPressed;
  final TabBar? tabBar;
  final List<Widget>? actions;
  @override
  final Size preferredSize; // default is 56.0


  @override
  Widget build(BuildContext context) {
    return AppBar(

      toolbarHeight: SizeHelper.of(context).help(
        mobileSmall: 20,
        mobileNormal: 30,
        mobileLarge: 50,
        tabletNormal: 65,
        tabletExtraLarge: 70,
        desktopLarge: 80,
      ),
      title: Text(
        '$title',

        style: TextStyle(color: Colors.black45,fontSize: titleSize,fontWeight: FontWeight.bold,),

      ),
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
      backgroundColor: Colors.white,

      automaticallyImplyLeading: withBackButton,
      leadingWidth: 100,
      leading: withBackButton
          ? GestureDetector(
        onTap: (){
            onBackButtonPressed!();
        },
        child: Icon(
        Icons.arrow_back,color: Colors.black,
          size: SizeHelper.of(context).help(mobileSmall: 15,
            mobileNormal: 17,
            mobileLarge: 19,
            tabletNormal: 21,
            tabletExtraLarge: 23,
            desktopLarge: 25,
          ),
        ),
      ) :   Container(
        height: SizeHelper.of(context).help(
          mobileSmall: 50,
          mobileNormal: 55,
          mobileLarge: 60,
          tabletNormal: 65,
          tabletExtraLarge: 70,
          desktopLarge: 80,
        ),
        width: SizeHelper.of(context).help(
          mobileSmall: 50,
          mobileNormal: 55,
          mobileLarge: 60,
          tabletNormal: 65,
          tabletExtraLarge: 70,
          desktopLarge: 80,
        ),
        child: Row(
          children: [
            Align(
                alignment: Alignment.centerLeft,
                child: Image.asset('assets/images/logo.png',fit: BoxFit.contain,),),

                 ] ),
      ),
      bottom: tabBar,
      actions: actions,
    );
  }
}
