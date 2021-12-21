import 'package:flutter/material.dart';
import 'package:motherclub/app/Models/ProductModel.dart';
import 'package:motherclub/app/Models/order_model.dart';
import 'package:motherclub/app/modules/Store/views/product_item.dart';
import 'package:motherclub/common/Constant/ColorConstants.dart';
import 'package:motherclub/common/CustomWidget/statless/custom_appbar.dart';
import 'package:motherclub/common/Utils/Utils.dart';
import 'package:rxdart/rxdart.dart';
import 'package:size_helper/size_helper.dart';

class OrderDetails extends StatefulWidget {
  const OrderDetails({required this.data, Key? key}) : super(key: key);
  final OrderModel data;

  @override
  State<OrderDetails> createState() => _OrderDetailsState();
}

class _OrderDetailsState extends State<OrderDetails> {
  BehaviorSubject<bool> rxItemsCount = BehaviorSubject();

  @override
  void initState() {
    rxItemsCount.sink.add(false);
    super.initState();
  }
  @override
  void dispose() {
    rxItemsCount.close();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: CustomAppBar(
        title: 'Order Details',
        centerTitle: true,
        onBackButtonPressed: () {
          Navigator.pop(context);
        },
        withBackButton: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // Container(
            //   height: 100,
            //   child: ListView.builder(
            //     shrinkWrap: true,
            //     scrollDirection: Axis.horizontal,
            //     itemCount: data.lineItems!.length,
            //     itemBuilder: (context, index) {
            //       return FutureBuilder<ProductModel>(
            //         future: Utils.bLoC.getSpecificProduct(data.lineItems![index].id!.toString()),
            //         builder: (context, snapshot) {
            //           return snapshot.hasData ? ProductItem(data: snapshot.data!) : Center(child: Container());
            //         }
            //       );
            //     },
            //   ),
            // ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Total : ',
                  style: TextStyle(color: Colors.grey, fontSize: SizeHelper.of(context).help(
                    mobileSmall: 10,
                    mobileNormal: 12,
                    mobileLarge: 14,
                    tabletNormal: 16,
                    tabletExtraLarge: 18,
                    desktopLarge: 20,
                  ),),
                ),
                Text(
                  '${widget.data.total!} ${widget.data.currency!}',
                  style: TextStyle(color: primary_text_color, fontSize: SizeHelper.of(context).help(
                    mobileSmall: 10,
                    mobileNormal: 12,
                    mobileLarge: 13,
                    tabletNormal: 15,
                    tabletExtraLarge: 16,
                    desktopLarge: 17,
                  ),),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Order status : ',
                  style: TextStyle(color: Colors.grey, fontSize: SizeHelper.of(context).help(
                    mobileSmall: 10,
                    mobileNormal: 12,
                    mobileLarge: 14,
                    tabletNormal: 16,
                    tabletExtraLarge: 18,
                    desktopLarge: 20,
                  ),),
                ),
                Text(
                  widget.data.status!,
                  style: TextStyle(color: primary_text_color, fontSize: SizeHelper.of(context).help(
                    mobileSmall: 10,
                    mobileNormal: 12,
                    mobileLarge: 13,
                    tabletNormal: 15,
                    tabletExtraLarge: 16,
                    desktopLarge: 17,
                  ),),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Order Time : ',
                  style: TextStyle(color: Colors.grey, fontSize: SizeHelper.of(context).help(
                    mobileSmall: 10,
                    mobileNormal: 12,
                    mobileLarge: 14,
                    tabletNormal: 16,
                    tabletExtraLarge: 18,
                    desktopLarge: 20,
                  ),),
                ),
                Text(
                  widget.data.dateCreated!.toString(),
                  style: TextStyle(color: primary_text_color, fontSize: SizeHelper.of(context).help(
                    mobileSmall: 10,
                    mobileNormal: 12,
                    mobileLarge: 13,
                    tabletNormal: 15,
                    tabletExtraLarge: 16,
                    desktopLarge: 17,
                  ),),
                ),
              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Payment method : ',
                  style: TextStyle(color: Colors.grey, fontSize: SizeHelper.of(context).help(
                    mobileSmall: 10,
                    mobileNormal: 12,
                    mobileLarge: 14,
                    tabletNormal: 16,
                    tabletExtraLarge: 18,
                    desktopLarge: 20,
                  ),),
                ),
                Text(
                  widget.data.paymentMethodTitle!,
                  style: TextStyle(color: primary_text_color, fontSize: SizeHelper.of(context).help(
                    mobileSmall: 10,
                    mobileNormal: 12,
                    mobileLarge: 13,
                    tabletNormal: 15,
                    tabletExtraLarge: 16,
                    desktopLarge: 17,
                  ),),
                ),
              ],
            ),
            StreamBuilder<bool>(
                stream: rxItemsCount.stream,
                builder: (context, snapshot) {
                  return Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Products : ',
                          style: TextStyle(color: Colors.grey, fontSize: SizeHelper.of(context).help(
                            mobileSmall: 10,
                            mobileNormal: 12,
                            mobileLarge: 14,
                            tabletNormal: 16,
                            tabletExtraLarge: 18,
                            desktopLarge: 20,
                          ),),
                        ),
                        Column(
                          children: [
                            Text(
                              '${widget.data.lineItems!.length.toString()} Products in this order ',
                              style: TextStyle(
                                  color: primary_text_color, fontSize: SizeHelper.of(context).help(
                                mobileSmall: 10,
                                mobileNormal: 12,
                                mobileLarge: 13,
                                tabletNormal: 15,
                                tabletExtraLarge: 16,
                                desktopLarge: 17,
                              ),),
                            ),
                            if (snapshot.data!)
                              Container(
                                width: SizeHelper.of(context).help(
                  mobileSmall: 180,
                  mobileNormal: 200,
                  mobileLarge: 220,
                  tabletNormal: 240,
                  tabletExtraLarge: 260,
                  desktopLarge: 290,
                  ),
                                height: 20.0 * widget.data.lineItems!.length,
                                child: ListView.builder(
                                  itemCount: widget.data.lineItems!.length,
                                  itemBuilder: (context, index) {
                                    return Text(
                                        '${widget.data.lineItems![index].quantity} x ${widget.data.lineItems![index].name}\n',  style: TextStyle(color: Colors.black87, fontSize: SizeHelper.of(context).help(
                                      mobileSmall: 10,
                                      mobileNormal: 12,
                                      mobileLarge: 13,
                                      tabletNormal: 15,
                                      tabletExtraLarge: 16,
                                      desktopLarge: 17,
                                    ),),);
                                  },
                                ),
                              ),
                          ],
                        ),
                        GestureDetector(
                            onTap: () {
                              rxItemsCount.sink.add(!snapshot.data!);
                            },
                            child: Icon((snapshot.data!)
                                ? Icons.expand_less
                                : Icons.expand_more)),
                      ],
                    ),
                  );
                }),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Number : ',
                  style: TextStyle(color: Colors.grey, fontSize: SizeHelper.of(context).help(
                    mobileSmall: 10,
                    mobileNormal: 12,
                    mobileLarge: 14,
                    tabletNormal: 16,
                    tabletExtraLarge: 18,
                    desktopLarge: 20,
                  ),),
                ),
                Text(
                  widget.data.number!,
                  style: TextStyle(color: primary_text_color, fontSize: SizeHelper.of(context).help(
                    mobileSmall: 10,
                    mobileNormal: 12,
                    mobileLarge: 13,
                    tabletNormal: 15,
                    tabletExtraLarge: 16,
                    desktopLarge: 17,
                  ),),
                ),
              ],
            ),
          ],
        ),
      ),
    ));
  }
}
