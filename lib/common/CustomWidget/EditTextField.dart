import 'package:flutter/material.dart';
import 'package:motherclub/common/Constant/ColorConstants.dart';
import 'package:size_helper/size_helper.dart';

Widget EditTextWidget(
    {required String Lable,
    required BuildContext context,
    required IconButton,
    required TextEditingController textEditingController}) {
  return Container(
    alignment: Alignment.center,
    decoration: BoxDecoration(
      color: Edit_textColor,
      borderRadius: BorderRadius.all(Radius.circular(10)),
      border: Border.all(
        color: Edit_textColor,
      ),
    ),
    child: TextFormField(
      validator: (value) {
        print('value ${value}');
        if (value == null || value.isEmpty) {
          return 'Please enter some text';
        }
        return null;
      },
      controller: textEditingController,
      decoration: InputDecoration(
        hintStyle: TextStyle(
          fontSize: SizeHelper.of(context).help(
            mobileSmall: 6,
            mobileNormal: 7,
            mobileLarge: 8,
            mobileExtraLarge: 10,
            tabletSmall: 12,
            tabletNormal: 14,
            tabletLarge: 20,
            tabletExtraLarge: 21,
            desktopLarge: 22,
          ),
        ),

        border: InputBorder.none,
        focusedBorder: InputBorder.none,
        enabledBorder: InputBorder.none,
        errorBorder: InputBorder.none,
        disabledBorder: InputBorder.none,
        labelText: Lable,
        labelStyle: Theme.of(context).textTheme.bodyText2,
        suffixIcon: Icon(
          IconButton,
          color: Black_textColor,
        ),
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
      ),
    ),
  );
}
