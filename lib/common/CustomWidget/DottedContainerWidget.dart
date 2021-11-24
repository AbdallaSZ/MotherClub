import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:motherclub/common/Constant/ColorConstants.dart';

Widget DottedContainerWidget(BuildContext context,height,width,String  text) {
  return Container(
    color: Edit_textColor,
    child: DottedBorder(
      color: Colors.grey,
      dashPattern: [5, 5],
      radius: Radius.circular(12),
      strokeWidth: 1,
      child: Container(
        width: width,
        height: height,
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(width:18),
             CircleAvatar(
              backgroundColor: Colors.white,
              radius: 28.0,
              child: Icon(
                Icons.camera_alt,
                size: 30.0,
                color: Color(0xFF404040),
              ),
            ),
            SizedBox(width: 14,),
            Flexible(
              child: Text(text, style: GoogleFonts.roboto(fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Grey_text_Color,)),
            )
          ],
        ),
      ),
    ),
  );
}