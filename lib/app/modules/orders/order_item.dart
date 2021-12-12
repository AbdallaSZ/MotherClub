import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:motherclub/app/Models/order_model.dart';

class OrderItem extends StatelessWidget {
  const OrderItem({required this.data, Key? key}) : super(key: key);
  final OrderModel data;

  @override
  Widget build(BuildContext context) {
    final DateFormat formatter = DateFormat('yyyy-MM-dd');
    return Container(
      // padding: EdgeInsets.all(2),
      height: 96,
      width: 135,
      // color: Colors.yellow,
      child: Column(
        children: [
          Image.asset(
            'assets/images/product_image.png',
            height: 80.89,
            width: 116.25,
          ),
          Text('${data.total}',),
          Text('${formatter.format(data.dateCreated!)}',),
        ],
      ),
    );
  }
}
