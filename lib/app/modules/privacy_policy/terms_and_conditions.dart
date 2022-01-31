import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:motherclub/common/Constant/ColorConstants.dart';
import 'package:motherclub/common/CustomWidget/statless/header_widget.dart';
import 'package:motherclub/common/Utils/Utils.dart';
import 'package:size_helper/size_helper.dart';
import 'package:url_launcher/url_launcher.dart';

class PrivacyPolicy extends StatelessWidget {
  const PrivacyPolicy({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double h3 = SizeHelper.of(context).help(
      mobileSmall: 15,
      mobileNormal: 16,
      mobileLarge: 17,
      mobileExtraLarge: 20,
      tabletSmall: 22,
      tabletNormal: 25,
      tabletLarge: 29,
      tabletExtraLarge: 35,
      desktopSmall: 40,
      desktopNormal: 40,
      desktopLarge: 45,
      desktopExtraLarge: 45,
    );
    double h4 = SizeHelper.of(context).help(
      mobileSmall: 12,
      mobileNormal: 13,
      mobileLarge: 15,
      mobileExtraLarge: 17,
      tabletSmall: 20,
      tabletNormal: 25,
      tabletLarge: 30,
      tabletExtraLarge: 35,
      desktopSmall: 40,
      desktopNormal: 40,
      desktopLarge: 40,
      desktopExtraLarge: 45,
    );
    double h5 = SizeHelper.of(context).help(
      mobileSmall: 10,
      mobileNormal: 11,
      mobileLarge: 11,
      mobileExtraLarge: 13,
      tabletSmall: 15,
      tabletNormal: 18,
      tabletLarge: 21,
      tabletExtraLarge: 24,
      desktopSmall: 28,
      desktopNormal: 32,
      desktopLarge: 36,
      desktopExtraLarge: 38,
    );
    double h6 = SizeHelper.of(context).help(
      mobileSmall: 8,
      mobileNormal: 9,
      mobileLarge: 9,
      mobileExtraLarge: 10,
      tabletSmall: 12,
      tabletNormal: 14,
      tabletLarge: 15,
      tabletExtraLarge: 17,
      desktopSmall: 19,
      desktopNormal: 22,
      desktopLarge: 24,
      desktopExtraLarge: 25,
    );
    double h7 = SizeHelper.of(context).help(
      mobileSmall: 7,
      mobileNormal: 7,
      mobileLarge: 8,
      mobileExtraLarge: 8,
      tabletSmall: 10,
      tabletNormal: 12,
      tabletLarge: 13,
      tabletExtraLarge: 14,
      desktopSmall: 15,
      desktopNormal: 17,
      desktopLarge: 18,
      desktopExtraLarge: 20,
    );
    return SafeArea(
      child: Scaffold(
        body: ListView(

          children: [
            headerWidget(context, Utils.labels!.privacy_policy,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                children: [
                  SizedBox(
                    height: h3,
                  ),
                  Text(
                    Utils.labels!.privacy_policy_title1,
                    style: GoogleFonts.roboto(
                        fontSize: h3,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                        color: Colors.black),
                  ),
                  Divider(
                    thickness: 1,
                    color: Colors.black,
                  ),
                  Text(
                    Utils.labels!.privacy_policy1,
                    style: GoogleFonts.roboto(
                        fontSize: h6,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                        color: Colors.grey),
                  ),
                  SizedBox(
                    height: h3,
                  ),
                  Text(
                    Utils.labels!.privacy_policy_title2,
                    style: GoogleFonts.roboto(
                        fontSize: h3,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                        color: Colors.black),
                  ),
                  Divider(
                    thickness: 1,
                    color: Colors.black,
                  ),
                  Text(
                    Utils.labels!.privacy_policy2,
                    style: GoogleFonts.roboto(
                        fontSize: h6,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                        color: Colors.grey),
                  ),
                  SizedBox(
                    height: h3,
                  ),  Text(
                    Utils.labels!.privacy_policy_title3,
                    style: GoogleFonts.roboto(
                        fontSize: h3,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                        color: Colors.black),
                  ),
                  Divider(
                    thickness: 1,
                    color: Colors.black,
                  ),
                  Text(
                    Utils.labels!.privacy_policy3,
                    style: GoogleFonts.roboto(
                        fontSize: h6,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                        color: Colors.grey),
                  ),
                  SizedBox(
                    height: h3,
                  ),  Text(
                    Utils.labels!.privacy_policy_title4,
                    style: GoogleFonts.roboto(
                        fontSize: h3,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                        color: Colors.black),
                  ),
                  Divider(
                    thickness: 1,
                    color: Colors.black,
                  ),
                  Text(
                    Utils.labels!.privacy_policy4,
                    style: GoogleFonts.roboto(
                        fontSize: h6,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                        color: Colors.grey),
                  ),
                  SizedBox(
                    height: h3,
                  ),  Text(
                    Utils.labels!.privacy_policy_title5,
                    style: GoogleFonts.roboto(
                        fontSize: h3,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                        color: Colors.black),
                  ),
                  Divider(
                    thickness: 1,
                    color: Colors.black,
                  ),
                  Text(
                    Utils.labels!.privacy_policy5,
                    style: GoogleFonts.roboto(
                        fontSize: h6,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                        color: Colors.grey),
                  ),
                  SizedBox(
                    height: h3,
                  ),  Text(
                    Utils.labels!.privacy_policy_title6,
                    style: GoogleFonts.roboto(
                        fontSize: h3,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                        color: Colors.black),
                  ),
                  Divider(
                    thickness: 1,
                    color: Colors.black,
                  ),
                  Text(
                    Utils.labels!.privacy_policy6,
                    style: GoogleFonts.roboto(
                        fontSize: h6,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                        color: Colors.grey),
                  ),
                  SizedBox(
                    height: h3,
                  ),  Text(
                    Utils.labels!.privacy_policy_title7,
                    style: GoogleFonts.roboto(
                        fontSize: h3,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                        color: Colors.black),
                  ),
                  Divider(
                    thickness: 1,
                    color: Colors.black,
                  ),
                  Text(
                    Utils.labels!.privacy_policy7,
                    style: GoogleFonts.roboto(
                        fontSize: h6,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                        color: Colors.grey),
                  ),
                  SizedBox(
                    height: h3,
                  ),
                  Text(
                    Utils.labels!.privacy_policy_title8,
                    style: GoogleFonts.roboto(
                        fontSize: h3,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                        color: Colors.black),
                  ),
                  Divider(
                    thickness: 1,
                    color: Colors.black,
                  ),
                  Text(
                    Utils.labels!.privacy_policy8,
                    style: GoogleFonts.roboto(
                        fontSize: h6,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                        color: Colors.grey),
                  ),
                  SizedBox(
                    height: h3,
                  ),  Text(
                    Utils.labels!.privacy_policy_title9,
                    style: GoogleFonts.roboto(
                        fontSize: h3,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                        color: Colors.black),
                  ),
                  Divider(
                    thickness: 1,
                    color: Colors.black,
                  ),
                  Text(
                    Utils.labels!.privacy_policy9,
                    style: GoogleFonts.roboto(
                        fontSize: h6,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                        color: Colors.grey),
                  ),
                  SizedBox(
                    height: h3,
                  ),  Text(
                    Utils.labels!.privacy_policy_title10,
                    style: GoogleFonts.roboto(
                        fontSize: h3,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                        color: Colors.black),
                  ),
                  Divider(
                    thickness: 1,
                    color: Colors.black,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        Utils.labels!.privacy_policy10,
                        style: GoogleFonts.roboto(
                            fontSize: h6,
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal,
                            color: Colors.grey),
                      ),
                      Text(
                        'info@mothersclub.me',
                        style: GoogleFonts.roboto(
                            fontSize: h6,
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal,
                            color: Text_color),
                      )
                    ],
                  ),
                  SizedBox(
                    height: h3,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
