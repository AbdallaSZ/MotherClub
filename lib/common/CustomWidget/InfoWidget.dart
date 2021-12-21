import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:motherclub/app/Models/UserDetailsModel.dart';
import 'package:motherclub/common/Constant/ColorConstants.dart';
import 'package:motherclub/common/Utils/Utils.dart';
import 'package:size_helper/size_helper.dart';

Widget InfoWidget() {
  return FutureBuilder<UserDetailsModel>(
      future: Utils.bLoC.usersDetails(),
      builder: (context, snapshot) {
        return snapshot.hasData
            ? Container(
                height: SizeHelper.of(context).help(
                  mobileSmall: 48,
                  mobileLarge: 58,
                  tabletNormal: 68,
                  tabletExtraLarge: 88,
                  desktopLarge: 108,
                ),
                width: Utils.width,
                // color: white_color,
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
                padding: EdgeInsets.fromLTRB(7, 7, 7, 7),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          Utils.labels!.hi + ", ${Utils.name}",
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
                        SizedBox(height: 2),
                        Text(
                          '${Utils.labels!.you_are_pregnant_for} ${snapshot.data!.babyAge}',
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
                    Container(
                      height: 59,
                      width: 48,
                      padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
                      decoration: BoxDecoration(
                          border: Border.all(color: white_color, width: 1),
                          borderRadius: BorderRadius.circular(10)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // Text(label3,style: GoogleFonts.roboto(
                          //     fontSize: 12,
                          //     fontWeight: FontWeight.w400,
                          //     fontStyle: FontStyle.normal,
                          //     color: white_color),),
                          // SizedBox(height:1),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 5),
                            child: Column(
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
                          ),
                        ],
                      ),
                    )
                  ],
                ))
            : Container(
            height: SizeHelper.of(context).help(
              mobileSmall: 48,
              mobileLarge: 58,
              tabletNormal: 68,
              tabletExtraLarge: 88,
              desktopLarge: 108,
            ),
                width: Utils.width,
                // color: white_color,
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
                padding: EdgeInsets.fromLTRB(7, 7, 7, 7),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      // padding: EdgeInsets.fromLTRB(18, 13, 10, 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            Utils.labels!.hi + ", ${Utils.name=="" ? Utils.labels!.guest : Utils.name}",
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
                            '${Utils.labels!.you_are_pregnant_for} ...',
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
                    Container(
                      height: 59,
                      width: 48,
                      padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
                      decoration: BoxDecoration(
                          border: Border.all(color: white_color, width: 1),
                          borderRadius: BorderRadius.circular(10)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // Text(label3,style: GoogleFonts.roboto(
                          //     fontSize: 12,
                          //     fontWeight: FontWeight.w400,
                          //     fontStyle: FontStyle.normal,
                          //     color: white_color),),
                          // SizedBox(height:1),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 5),
                            child: Column(
                              children: [
                                Text(
                                  "...",
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
                          ),
                        ],
                      ),
                    )
                  ],
                ));
      });
}
