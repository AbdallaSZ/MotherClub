import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:motherclub/common/Constant/ColorConstants.dart';
import 'package:size_helper/size_helper.dart';

Widget headerWidget(BuildContext context, String title) {
  return Container(
    decoration: BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        stops: [
          0.0,
          0.1,
          10.0,
        ],
        colors: [
          CustomButton_Color,
          CustomButton_Color,
          CustomButton_Second_Color,
        ],
      ),
    ),
    child: Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: ListTile(
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
        ),
        title: Text(
          title,
          style: GoogleFonts.roboto(
            fontSize: SizeHelper.of(context).help(
              mobileSmall: 8,
              mobileNormal: 10,
              mobileLarge: 12,
              tabletNormal: 14,
              tabletExtraLarge: 16,
              desktopLarge: 18,
            ),
            color: Colors.white,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
            letterSpacing: 0.25,
          ),
        ),
        trailing: Image.asset(

          'assets/images/logo_en.jpg',

          fit: BoxFit.fill,
          scale: 4,
        ),
        // isThreeLine: true,
      ),
    ),
  );
}
