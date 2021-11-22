import 'package:flutter/material.dart';

class AppBarBackButton extends StatelessWidget {
  const AppBarBackButton({
    Key? key,
    this.margin = const EdgeInsets.only(left: 8, top: 8),
    this.padding = const EdgeInsets.all(8.0),
    required this.onPressed,
  }) : super(key: key);
  final Function onPressed;
  final EdgeInsets margin;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      padding: padding,
      alignment: Alignment.topLeft,
      child: ClipOval(
        child: InkWell(
          borderRadius: BorderRadius.circular(100),
          child: Icon(
            Icons.arrow_back_ios,
color: Colors.black,
            size: 19,
          ),
          onTap:()=> onPressed,
        ),
      ),
    );
  }
}
