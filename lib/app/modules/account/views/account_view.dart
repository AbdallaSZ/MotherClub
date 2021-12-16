import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:motherclub/app/Models/order_model.dart';
import 'package:motherclub/app/NetworkCalls/Api.dart';
import 'package:motherclub/app/language/LangaugeBloc.dart';
import 'package:motherclub/app/language/LanguageEvent.dart';
import 'package:motherclub/app/modules/Settings/SettingsScreen.dart';
import 'package:motherclub/app/modules/WishList/views/wishlist_list_view.dart';
import 'package:motherclub/app/modules/account/widgets/info_account_widget.dart';
import 'package:motherclub/app/modules/feedback/feedback_view.dart';
import 'package:motherclub/app/modules/orders/order_item.dart';
import 'package:motherclub/app/modules/orders/orders_gridview.dart';
import 'package:motherclub/app/routes/app_pages.dart';
import 'package:motherclub/common/Constant/AppConstant.dart';
import 'package:motherclub/common/Constant/ColorConstants.dart';
import 'dart:ui' as ui;
import 'package:motherclub/common/CustomWidget/InfoWidget.dart';
import 'package:motherclub/common/CustomWidget/appBarWidget.dart';
import 'package:motherclub/common/Utils/Utils.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AccountView extends StatefulWidget {
  @override
  _AccountViewState createState() => _AccountViewState();
}

class _AccountViewState extends State<AccountView> {

  final Shader linearGradient = LinearGradient(
    colors: <Color>[
      CustomButton_Color,
      CustomButton_Color,
      CustomButton_Second_Color
    ],
  ).createShader(Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));

  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    double deviceWidth = MediaQuery.of(context).size.width;
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // AppBarWidget("My Account",deviceHeight/9.4,deviceWidth,context),
            InfoAccountWidget(
                deviceHeight / 10, deviceWidth, context),

            FutureBuilder<List<OrderModel>>(
              future: Utils.bLoC.orders(),
              builder: (context, snapshot) {
                return Column(
                  children: [
                    Container(
                      padding: EdgeInsets.all(20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.shopping_basket),
                              SizedBox(width: 10),
                              Text(
                                Utils.labels!.your_orders,
                                style: GoogleFonts.roboto(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FontStyle.normal,
                                    letterSpacing: 0.25,
                                    color: Black_textColor),
                              ),
                              SizedBox(
                                width: 9,
                              ),
                              Container(
                                height: 21,
                                width: 35,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  gradient: LinearGradient(
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                      stops: [
                                        0.0,
                                        0.1,
                                        10.0
                                      ],
                                      colors: [
                                        // Colors.deepPurple.shade400,
                                        CustomButton_Color,
                                        CustomButton_Color,
                                        CustomButton_Second_Color,
                                        // Colors.deepPurple.shade200,
                                      ]),
                                ),
                                child: Center(
                                  child: Text(
                                    snapshot.hasData
                                        ? snapshot.data!.length.toString()
                                        : '0',
                                    style: GoogleFonts.roboto(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w400,
                                        fontStyle: FontStyle.normal,
                                        letterSpacing: 0.25,
                                        color: white_color),
                                  ),
                                ),
                              )
                            ],
                          ),
                          ShaderMask(
                            blendMode: BlendMode.srcIn,
                            shaderCallback: (Rect bounds) {
                              return ui.Gradient.linear(
                                Offset(14.0, 24.0),
                                Offset(24.0, 0.0),
                                [CustomButton_Color, CustomButton_Second_Color],
                              );
                            },
                            child: GestureDetector(
                             onTap: (){
                               Navigator.push(
                                 context,
                                 MaterialPageRoute(builder: (context) => OrderGridView()),
                               );
                             },
                              child: Text(
                                Utils.labels!.see_all,
                                style: GoogleFonts.roboto(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w400,
                                    fontStyle: FontStyle.normal,
                                    letterSpacing: 0.25,
                                    color: Text_color),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child:(snapshot.hasData && snapshot.data!.length != 0)
                          ? ConstrainedBox(
                              constraints: BoxConstraints(
                                  maxHeight: 130, minHeight: 0),
                              child: ListView.builder(
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemCount: snapshot.data!.length,
                                itemBuilder: (context, index) {
                                  return Stack(
                                    children: [
                                      OrderItem(data: snapshot.data![index]),
                                      Padding(
                                        padding: const EdgeInsets.all(10),
                                        child: Align(
                                          alignment: Alignment.topLeft,
                                          child: GestureDetector(
                                              onTap: () async {
                                                showDialog(
                                                    context: context,
                                                    builder: (c) {
                                                      return AlertDialog(
                                                        title: Text(Utils
                                                            .labels!
                                                            .remove_order),
                                                        actions: [
                                                          ElevatedButton(
                                                            child: Text(Utils
                                                                .labels!.yes),
                                                            onPressed:
                                                                () async {
                                                              await Utils.bLoC
                                                                  .delOrder(snapshot
                                                                      .data![
                                                                          index]
                                                                      .id
                                                                      .toString())
                                                                  .then(
                                                                    (value) =>
                                                                        ScaffoldMessenger
                                                                            .of(
                                                                      context,
                                                                    ).showSnackBar(
                                                                      SnackBar(
                                                                        content:
                                                                        Text('${Utils.labels!.order} ${Utils.labels!.has_deleted}'),
                                                                        duration:
                                                                            const Duration(
                                                                          seconds:
                                                                              3,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  );
                                                              setState(() {
                                                                print(
                                                                    'deleted');
                                                              });

                                                              Navigator.of(
                                                                      context)
                                                                  .pop();
                                                            },
                                                          ),
                                                          ElevatedButton(
                                                            child: Text(Utils
                                                                .labels!
                                                                .cancel),
                                                            onPressed: () {
                                                              Navigator.of(
                                                                      context)
                                                                  .pop();
                                                            },
                                                            style: ElevatedButton
                                                                .styleFrom(
                                                                    primary:
                                                                        Colors
                                                                            .red),
                                                          ),
                                                        ],
                                                      );
                                                    });
                                              },
                                              child: Icon(Icons
                                                  .delete_forever_outlined)),
                                        ),
                                      ),
                                    ],
                                  );
                                },
                              ),
                            )
                          : Container(height: 0,),
                    ),
                  ],
                );
              },
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 20),
              child: Container(
                child: Row(
                  children: [
                    Icon(Icons.touch_app, size: 22),
                    SizedBox(width: 15),
                    Text(
                      Utils.labels!.buy_again,
                      style: GoogleFonts.roboto(
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                          fontStyle: FontStyle.normal,
                          color: Black_textColor),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 30),
              child: GestureDetector(
                onTap: () {
                  // Get.toNamed(Routes.WISHLIST);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => WishlistList()),
                  );
                },
                child: Container(
                  child: Row(
                    children: [
                      Icon(
                        Icons.favorite,
                        size: 22,
                      ),
                      SizedBox(width: 15),
                      Text(
                        Utils.labels!.your_wish_list,
                        style: GoogleFonts.roboto(
                            fontSize: 17,
                            fontWeight: FontWeight.w500,
                            fontStyle: FontStyle.normal,
                            color: Black_textColor),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => FeedBack()),
                );
              },
              child: Padding(
                padding: const EdgeInsets.only(left: 20, top: 30),
                child: Container(
                  child: Row(
                    children: [
                      Icon(Icons.message, size: 22),
                      SizedBox(width: 15),
                      Text(
                        Utils.labels!.contact_us,
                        style: GoogleFonts.roboto(
                            fontSize: 17,
                            fontWeight: FontWeight.w500,
                            fontStyle: FontStyle.normal,
                            color: Black_textColor),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 30),
              child: GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (c)=>SettingsScreen())).whenComplete(() {
                    print("sad");
                    setState(() {

                    });
                  });
                },
                child: Container(
                  child: Row(
                    children: [
                      Icon(
                        Icons.settings,
                      ),
                      SizedBox(width: 15),
                      Text(
                        Utils.labels!.settings,
                        style: GoogleFonts.roboto(
                            fontSize: 17,
                            fontWeight: FontWeight.w500,
                            fontStyle: FontStyle.normal,
                            color: Black_textColor),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 120, bottom: 40),
              child: Container(
                child: InkWell(
                  onTap: () {
                    logout();
                    Get.offAndToNamed(Routes.LOGIN);
                    Utils.userPreferences.removeUser();
                  },
                  child: Row(
                    children: [
                      Icon(Icons.power_settings_new, size: 22),
                      SizedBox(width: 15),
                      Text(
                        Utils.labels!.logout,
                        style: GoogleFonts.roboto(
                            fontSize: 17,
                            fontWeight: FontWeight.w500,
                            fontStyle: FontStyle.normal,
                            color: Black_textColor),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    ));
  }


  void logout() {
    NetworkService.logout("wp-json/cocart/v2/logout");
  }
}
