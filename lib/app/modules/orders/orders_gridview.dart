import 'package:flutter/material.dart';
import 'package:motherclub/app/Models/order_model.dart';
import 'package:motherclub/app/Shimmers/GridShimmer.dart';
import 'package:motherclub/app/modules/orders/order_item.dart';
import 'package:motherclub/common/CustomWidget/statless/custom_appbar.dart';
import 'package:motherclub/common/Utils/Utils.dart';
import 'package:size_helper/size_helper.dart';

class OrderGridView extends StatefulWidget {
  const OrderGridView({Key? key}) : super(key: key);

  @override
  State<OrderGridView> createState() => _OrderGridViewState();
}

class _OrderGridViewState extends State<OrderGridView> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: CustomAppBar(
          withBackButton: true,
          onBackButtonPressed: () {
            Navigator.pop(context);
          },
          centerTitle: true,
          title: 'All Orders',
          tabBar: TabBar(
            tabs: [
              Tab(
                child: Text('Complete',style:TextStyle(color: Colors.black),),
              ),
              Tab(
                child: Text('Incomplete',style:TextStyle(color: Colors.black),),
              ),
            ],
          ),
        ),
        body:  TabBarView(
          children: [

            Container(
              padding: EdgeInsets.all(10),
              // color: Colors.red,
              height: Utils.deviceHeight,
              child: FutureBuilder<List<OrderModel>>(
                future: Utils.bLoC.orders(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    List<OrderModel> ordersLis = snapshot.data!.where((element) => element.status == 'completed').toList();
                    return !(ordersLis.length == 0) ?GridView.builder(
                      itemCount: ordersLis.length,
                      gridDelegate:
                      SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: SizeHelper.of(context).help(
                          mobileSmall: 2,
                          mobileNormal: 2,
                          mobileLarge: 2,
                          mobileExtraLarge: 2,
                          tabletSmall: 2,
                          tabletNormal: 2,
                          tabletLarge: 3,
                          tabletExtraLarge: 3,
                          desktopLarge: 4,
                        ),
                        childAspectRatio: (.68),
                      ),
                      itemBuilder: (
                          context,
                          index,
                          ) {
                        return Stack(
                          children: [
                            OrderItem(data: ordersLis[index]),
                            Padding(
                              padding: const EdgeInsets.all(10),
                              child: Align(
                                alignment: Alignment.topLeft,
                                child: GestureDetector(
                                    onTap: () async {
                                      showDialog(
                                          context: context,
                                          builder: (c) {
                                            return AlertDialog(
                                              title: Text(Utils
                                                  .labels!
                                                  .remove_order),
                                              actions: [
                                                ElevatedButton(
                                                  child: Text(Utils
                                                      .labels!.yes),
                                                  onPressed:
                                                      () async {

                                                    await Utils.bLoC
                                                        .delOrder(ordersLis[index]
                                                        .id
                                                        .toString())
                                                        .then(
                                                          (value) =>
                                                          ScaffoldMessenger
                                                              .of(
                                                            context,
                                                          ).showSnackBar(
                                                            SnackBar(
                                                              content:
                                                              Text('${Utils.labels!.order} ${Utils.labels!.has_deleted}'),
                                                              duration:
                                                              const Duration(
                                                                seconds:
                                                                3,
                                                              ),
                                                            ),
                                                          ),
                                                    );
                                                    Navigator.of(
                                                        context)
                                                        .pop();
                                                    setState(() {
                                                      print('deleted');
                                                    });


                                                  },
                                                ),
                                                ElevatedButton(
                                                  child: Text(Utils
                                                      .labels!
                                                      .cancel),
                                                  onPressed: () {
                                                    Navigator.of(
                                                        context)
                                                        .pop();
                                                  },
                                                  style: ElevatedButton
                                                      .styleFrom(
                                                      primary:
                                                      Colors
                                                          .red),
                                                ),
                                              ],
                                            );
                                          });
                                    },
                                    child: Icon(Icons
                                        .delete_forever_outlined)),
                              ),
                            ),
                          ],
                        );
                      },
                    ) :Center(child: Text("No Orders Yet  !"));
                  } else if (snapshot.hasError) {
                    return Center(child: Text("${snapshot.error}"));
                  }
                  return GridShimmer(
                      deviceWidth: Utils.deviceWidth, deviceHeight: Utils.deviceHeight);
                },
              ),
            ),

            Container(
              padding: EdgeInsets.all(10),
              // color: Colors.red,
              height: Utils.deviceHeight,
              child: FutureBuilder<List<OrderModel>>(
                future: Utils.bLoC.orders(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    List<OrderModel> ordersLis = snapshot.data!.where((element) => element.status != 'completed').toList();

                    return !(ordersLis.length == 0) ?GridView.builder(
                      itemCount: ordersLis.length,
                      gridDelegate:
                      SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: SizeHelper.of(context).help(
                          mobileSmall: 2,
                          mobileNormal: 2,
                          mobileLarge: 2,
                          mobileExtraLarge: 2,
                          tabletSmall: 2,
                          tabletNormal: 2,
                          tabletLarge: 3,
                          tabletExtraLarge: 3,
                          desktopLarge: 4,
                        ),
                        childAspectRatio: (.68),
                      ),
                      itemBuilder: (
                          context,
                          index,
                          ) {
                        return Stack(
                          children: [
                            OrderItem(data: ordersLis[index]),
                            Padding(
                              padding: const EdgeInsets.all(10),
                              child: Align(
                                alignment: Alignment.topLeft,
                                child: GestureDetector(
                                    onTap: () async {
                                      showDialog(
                                          context: context,
                                          builder: (c) {
                                            return AlertDialog(
                                              title: Text(Utils
                                                  .labels!
                                                  .remove_order),
                                              actions: [
                                                ElevatedButton(
                                                  child: Text(Utils
                                                      .labels!.yes),
                                                  onPressed:
                                                      () async {

                                                    await Utils.bLoC
                                                        .delOrder(ordersLis[index]
                                                        .id
                                                        .toString())
                                                        .then(
                                                          (value) =>
                                                          ScaffoldMessenger
                                                              .of(
                                                            context,
                                                          ).showSnackBar(
                                                            SnackBar(
                                                              content:
                                                              Text('${Utils.labels!.order} ${Utils.labels!.has_deleted}'),
                                                              duration:
                                                              const Duration(
                                                                seconds:
                                                                3,
                                                              ),
                                                            ),
                                                          ),
                                                    );
                                                    Navigator.of(
                                                        context)
                                                        .pop();
                                                    setState(() {
                                                      print('deleted');
                                                    });


                                                  },
                                                ),
                                                ElevatedButton(
                                                  child: Text(Utils
                                                      .labels!
                                                      .cancel),
                                                  onPressed: () {
                                                    Navigator.of(
                                                        context)
                                                        .pop();
                                                  },
                                                  style: ElevatedButton
                                                      .styleFrom(
                                                      primary:
                                                      Colors
                                                          .red),
                                                ),
                                              ],
                                            );
                                          });
                                    },
                                    child: Icon(Icons.delete_forever_outlined)),
                              ),
                            ),
                          ],
                        );
                      },
                    ) :Center(child: Text("No Orders Yet  !"));
                  } else if (snapshot.hasError) {
                    return Center(child: Text("${snapshot.error}"));
                  }
                  return GridShimmer(
                      deviceWidth: Utils.deviceWidth, deviceHeight: Utils.deviceHeight);
                },
              ),
            ),
          ],
        ),

      ),
    );
  }
}
