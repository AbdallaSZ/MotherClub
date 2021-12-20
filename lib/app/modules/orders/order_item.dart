import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:motherclub/app/Models/order_model.dart';
import 'package:motherclub/app/modules/orders/order_details.dart';
import 'package:motherclub/common/Constant/ColorConstants.dart';
import 'package:motherclub/common/Utils/Utils.dart';
import 'package:size_helper/size_helper.dart';

class OrderItem extends StatefulWidget {
  const OrderItem({required this.data, Key? key}) : super(key: key);
  final OrderModel data;

  @override
  State<OrderItem> createState() => _OrderItemState();
}

class _OrderItemState extends State<OrderItem> {
  @override
  Widget build(BuildContext context) {
    final DateFormat formatter = DateFormat('yyyy-MM-dd');
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => OrderDetails(data: widget.data)),
        );
      },
      child: Container(
        margin: EdgeInsets.symmetric(
          vertical: SizeHelper.of(context).help(
            mobileSmall: 3,
            mobileNormal: 5,
            mobileLarge: 8,
            tabletNormal: 10,
            tabletExtraLarge: 13,
            desktopLarge: 15,
          ),
          horizontal: SizeHelper.of(context).help(
            mobileSmall: 3,
            mobileNormal: 5,
            mobileLarge: 8,
            tabletNormal: 10,
            tabletExtraLarge: 13,
            desktopLarge: 15,
          ),
        ),
        padding: EdgeInsets.symmetric(
          horizontal: SizeHelper.of(context).help(
            mobileSmall: 3,
            mobileNormal: 5,
            mobileLarge: 8,
            tabletNormal: 10,
            tabletExtraLarge: 13,
            desktopLarge: 15,
          ),
        ),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Color(0xffe0e0e0),
              spreadRadius: 1,
              blurRadius: 5,
              offset: Offset(0, 0), // changes position of shadow
            ),
          ],
          borderRadius: BorderRadius.circular(10),
          color: white_color,
        ),
        width: SizeHelper.of(context).help(
          mobileSmall: 80,
          mobileNormal: 80,
          mobileLarge: 90,
          mobileExtraLarge: 100,
          tabletNormal: 120,
          tabletLarge: 150,
          tabletExtraLarge: 170,
          desktopLarge: 190,
        ),
        height: SizeHelper.of(context).help(
          mobileSmall: 80,
          mobileNormal: 80,
          mobileLarge: 90,
          mobileExtraLarge: 100,
          tabletNormal: 120,
          tabletLarge: 150,
          tabletExtraLarge: 170,
          desktopLarge: 190,
        ),
        // color: Colors.yellow,
        child: Column(
          children: [
            Image.asset(
              'assets/images/product_image.png',
              height: SizeHelper.of(context).help(
                mobileSmall: 60,
                mobileNormal: 60,
                mobileLarge: 65,
                mobileExtraLarge: 70,
                tabletNormal: 75,
                tabletLarge: 80,
                tabletExtraLarge: 110,
                desktopLarge: 130,
              ),
              width: 116.25,
            ),
            Text(
              '${widget.data.total} ${widget.data.currency}',
              style: TextStyle(
                  fontSize: SizeHelper.of(context).help(
                    mobileSmall: 15,
                    mobileNormal: 12,
                    mobileLarge: 14,
                    tabletNormal: 15,
                    tabletExtraLarge: 17,
                    desktopLarge: 18,
                  ),
                  color: primary_text_color),
            ),
            Text('${formatter.format(widget.data.dateCreated!)} ',
                style: TextStyle(
                    fontSize: SizeHelper.of(context).help(
                      mobileSmall: 8,
                      mobileNormal: 9,
                      mobileLarge: 10,
                      tabletNormal: 11,
                      tabletExtraLarge: 12,
                      desktopLarge: 12,
                    ),
                    color: Colors.grey)),
          ],
        ),
      ),
    );
  }
}
