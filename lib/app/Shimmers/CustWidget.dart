import 'package:flutter/material.dart';
import 'package:motherclub/common/Constant/ColorConstants.dart';
import 'package:shimmer/shimmer.dart';

class CustWidget extends StatelessWidget {

  final double width;
  final double height;
  final ShapeBorder shapeBorder;

  const CustWidget.rectangular(this.width, this.height): this.shapeBorder = const RoundedRectangleBorder();
  const CustWidget.square(this.width, this.height): this.shapeBorder = const RoundedRectangleBorder();

  const CustWidget.circular({
    this.width = double.infinity,
    required this.height,
    this.shapeBorder = const CircleBorder()
  });

  @override
  Widget build(BuildContext context)  => Shimmer.fromColors(
    baseColor:  shimmerfirstColor,
    highlightColor: shimmerSecondColor,
    period: Duration(seconds: 2),
    child: Container(
      width: width,
      height: height,
      decoration: ShapeDecoration(
        color: Colors.grey[400],
        shape: shapeBorder,

      ),
    ),
  );
}