import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
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
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: SizeHelper.of(context).help(
              mobileSmall: 140,
              mobileNormal:  150,
              mobileLarge: 170,
              tabletNormal: 200,
              tabletExtraLarge: 230,
              desktopLarge: 260,
            ),
            child: Text(
              title,
                textAlign: TextAlign.center,
              style: GoogleFonts.roboto(
                fontSize: SizeHelper.of(context).help(
                  mobileSmall: 8,
                  mobileNormal: 12,
                  mobileLarge: 14,
                  tabletNormal: 16,
                  tabletExtraLarge: 18,
                  desktopLarge: 20,
                ),

                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontStyle: FontStyle.normal,
                // letterSpacing: 0.25,
              ),

            ),
          ),
        ],
      ),

      trailing: Container(

        width: 50,
        height: 50,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(32),
          image: DecorationImage(
            image: AssetImage(
              'assets/images/logo_en.jpg',
            ),
            fit: BoxFit.fitWidth,
          )

        ),
      ), // isThreeLine: true,
    ),
  );
}
