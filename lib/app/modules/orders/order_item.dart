import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:motherclub/app/Models/order_model.dart';
import 'package:motherclub/app/modules/orders/order_details.dart';
import 'package:motherclub/common/Constant/ColorConstants.dart';
import 'package:motherclub/common/Utils/Utils.dart';

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
          MaterialPageRoute(builder: (context) => OrderDetails(data: widget.data)),
        );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        padding: const EdgeInsets.symmetric(horizontal: 10),
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
        width: 135,
        // color: Colors.yellow,
        child: Column(
          children: [
            Image.asset(
              'assets/images/product_image.png',
              height: 80.89,
              width: 116.25,
            ),
            Text(
              '${widget.data.total} ${widget.data.currency}',
              style: TextStyle(fontSize: 12, color: primary_text_color),
            ),
            Text('${formatter.format(widget.data.dateCreated!)} ',
                style: TextStyle(fontSize: 10, color: Colors.grey)),
          ],
        ),
      ),
    );
  }
}
