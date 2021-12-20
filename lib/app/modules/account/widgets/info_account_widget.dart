import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:motherclub/app/Models/UserDetailsModel.dart';
import 'package:motherclub/common/Constant/ColorConstants.dart';
import 'package:motherclub/common/Utils/Utils.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:size_helper/size_helper.dart';

Widget InfoAccountWidget() {
  return FutureBuilder<UserDetailsModel>(
      future: Utils.bLoC.usersDetails(),
      builder: (context, snapshot) {
        return snapshot.hasData
            ? Container(
                width: double.infinity,
                height: SizeHelper.of(context).help(
                  mobileSmall: 48,
                  mobileLarge: 58,
                  tabletNormal: 68,
                  tabletExtraLarge: 88,
                  desktopLarge: 108,
                ),
                decoration: BoxDecoration(
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
                padding: EdgeInsets.fromLTRB(18, 9, 7, 9),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          // color: Colors.yellowAccent,
                          child: CircleAvatar(
                            radius: 24.0,
                            backgroundColor: Colors.white,
                            child: CircleAvatar(
                                radius: 38.0,
                                backgroundImage: NetworkImage(Utils.prefs!
                                        .getString("imageUrl") ??
                                    "https://c0.klipartz.com/pngpicture/434/847/gratis-png-usuario-de-iconos-de-computadora-empresario-ejecutivo-de-negocios-s.png")),
                          ),
                        ),
                        SizedBox(width: 10),
                        Container(
                          // padding: EdgeInsets.fromLTRB(18, 13, 10, 0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                '${Utils.name}',
                                style: GoogleFonts.roboto(
                                    fontSize: SizeHelper.of(context).help(
                                      mobileSmall: 10,
                                      mobileNormal: 12,
                                      mobileLarge: 14,
                                      tabletNormal: 16,
                                      tabletExtraLarge: 18,
                                      desktopLarge: 20,
                                    ),
                                    fontWeight: FontWeight.bold,
                                    fontStyle: FontStyle.normal,
                                    letterSpacing: 0.4,
                                    color: white_color),
                              ),
                              SizedBox(height: 3),
                              Text(
                                'Age : ${snapshot.data!.babyAge}',
                                style: GoogleFonts.roboto(
                                    fontSize: SizeHelper.of(context).help(
                                      mobileSmall: 6,
                                      mobileNormal: 8,
                                      mobileLarge: 10,
                                      tabletNormal: 12,
                                      tabletExtraLarge: 14,
                                      desktopLarge: 16,
                                    ),
                                    fontWeight: FontWeight.w400,
                                    fontStyle: FontStyle.normal,
                                    letterSpacing: 0.25,
                                    color: white_color),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
                      height: 59,
                      width: 48,
                      decoration: BoxDecoration(
                          border: Border.all(color: white_color, width: 1),
                          borderRadius: BorderRadius.circular(10)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "${snapshot.data!.weeksUser}",
                            style: GoogleFonts.roboto(
                                fontSize: SizeHelper.of(context).help(
                                  mobileSmall: 6,
                                  mobileNormal: 8,
                                  mobileLarge: 10,
                                  tabletNormal: 12,
                                  tabletExtraLarge: 14,
                                  desktopLarge: 16,
                                ),
                                fontWeight: FontWeight.w500,
                                fontStyle: FontStyle.normal,
                                color: white_color),
                            textAlign: TextAlign.center,
                          ),
                          Text(
                            "Week",
                            style: GoogleFonts.roboto(
                                fontSize: SizeHelper.of(context).help(
                                  mobileSmall: 6,
                                  mobileNormal: 8,
                                  mobileLarge: 10,
                                  tabletNormal: 12,
                                  tabletExtraLarge: 14,
                                  desktopLarge: 16,
                                ),
                                fontWeight: FontWeight.w500,
                                fontStyle: FontStyle.normal,
                                color: white_color),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    )
                  ],
                ))
            : Container(
            width: double.infinity,
                height: SizeHelper.of(context).help(
                  mobileSmall: 48,
                  mobileLarge: 58,
                  tabletNormal: 68,
                  tabletExtraLarge: 88,
                  desktopLarge: 108,
                ),
                decoration: BoxDecoration(
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
                padding: EdgeInsets.fromLTRB(18, 9, 7, 9),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          // color: Colors.yellowAccent,
                          child: CircleAvatar(
                            radius: 24.0,
                            backgroundColor: Colors.white,
                            child: CircleAvatar(
                                radius: 38.0,
                                backgroundImage: NetworkImage(Utils.prefs!
                                        .getString("imageUrl") ??
                                    "https://c0.klipartz.com/pngpicture/434/847/gratis-png-usuario-de-iconos-de-computadora-empresario-ejecutivo-de-negocios-s.png")),
                          ),
                        ),
                        SizedBox(width: 10),
                        Container(
                          // padding: EdgeInsets.fromLTRB(18, 13, 10, 0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                '${Utils.name}',
                                style: GoogleFonts.roboto(
                                    fontSize: SizeHelper.of(context).help(
                                      mobileSmall: 10,
                                      mobileNormal: 12,
                                      mobileLarge: 14,
                                      tabletNormal: 16,
                                      tabletExtraLarge: 18,
                                      desktopLarge: 20,
                                    ),
                                    fontWeight: FontWeight.bold,
                                    fontStyle: FontStyle.normal,
                                    letterSpacing: 0.25,
                                    color: white_color),
                              ),
                              SizedBox(height: 3),
                              Text(
                                'Age : ...',
                                style: GoogleFonts.roboto(
                                    fontSize: SizeHelper.of(context).help(
                                      mobileSmall: 6,
                                      mobileNormal: 8,
                                      mobileLarge: 10,
                                      tabletNormal: 12,
                                      tabletExtraLarge: 14,
                                      desktopLarge: 16,
                                    ),
                                    fontWeight: FontWeight.w400,
                                    fontStyle: FontStyle.normal,
                                    letterSpacing: 0.25,
                                    color: white_color),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
                      height: 59,
                      width: 48,
                      decoration: BoxDecoration(
                          border: Border.all(color: white_color, width: 1),
                          borderRadius: BorderRadius.circular(10)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            " ... ",
                            style: GoogleFonts.roboto(
                                fontSize: SizeHelper.of(context).help(
                                  mobileSmall: 6,
                                  mobileNormal: 8,
                                  mobileLarge: 10,
                                  tabletNormal: 12,
                                  tabletExtraLarge: 14,
                                  desktopLarge: 16,
                                ),
                                fontWeight: FontWeight.w500,
                                fontStyle: FontStyle.normal,
                                color: white_color),
                            textAlign: TextAlign.center,
                          ),
                          Text(
                            "${Utils.labels!.week}",
                            style: GoogleFonts.roboto(
                                fontSize: SizeHelper.of(context).help(
                                  mobileSmall: 6,
                                  mobileNormal: 8,
                                  mobileLarge: 10,
                                  tabletNormal: 12,
                                  tabletExtraLarge: 14,
                                  desktopLarge: 16,
                                ),
                                fontWeight: FontWeight.w500,
                                fontStyle: FontStyle.normal,
                                color: white_color),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    )
                  ],
                ));
      });
}
