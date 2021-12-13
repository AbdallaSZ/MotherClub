import 'package:flutter/material.dart';
import 'package:motherclub/app/Models/order_model.dart';
import 'package:motherclub/app/Shimmers/GridShimmer.dart';
import 'package:motherclub/app/modules/orders/order_item.dart';
import 'package:motherclub/common/CustomWidget/statless/custom_appbar.dart';
import 'package:motherclub/common/Utils/Utils.dart';

class OrderGridView extends StatefulWidget {
  const OrderGridView({Key? key}) : super(key: key);

  @override
  State<OrderGridView> createState() => _OrderGridViewState();
}

class _OrderGridViewState extends State<OrderGridView> {
  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
        appBar: CustomAppBar(withBackButton: true,onBackButtonPressed: (){Navigator.pop(context);},centerTitle: true,title: 'All Orders',),
        body: Container(
          padding: EdgeInsets.all(10),
          // color: Colors.red,
          height: Utils.deviceHeight,
          child: FutureBuilder<List<OrderModel>>(
            future: Utils.bLoC.orders(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                  return GridView.builder(
                    itemCount: snapshot.data!.length,
                    gridDelegate:
                    SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: (1.4),
                    ),
                    itemBuilder: (
                        context,
                        index,
                        ) {
                      return Stack(
                        children: [
                          OrderItem(data: snapshot.data![index]),
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
                                                      .delOrder(snapshot
                                                      .data![
                                                  index]
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
                                                            const Text('Order deleted'),
                                                            duration:
                                                            const Duration(
                                                              seconds:
                                                              3,
                                                            ),
                                                          ),
                                                        ),
                                                  );
                                                  setState(() {
                                                    print(
                                                        'deleted');
                                                  });

                                                  Navigator.of(
                                                      context)
                                                      .pop();
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
                  );

              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }
              return GridShimmer(
                  deviceWidth: Utils.deviceWidth, deviceHeight: Utils.deviceHeight);
            },
          ),
        ),
      );
  }
}
