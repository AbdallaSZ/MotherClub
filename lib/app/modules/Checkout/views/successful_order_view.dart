import 'package:flutter/material.dart';
import 'package:motherclub/app/modules/home/views/home_views.dart';
import 'package:motherclub/common/Constant/ColorConstants.dart';
import 'package:motherclub/common/Utils/Utils.dart';
import 'package:size_helper/size_helper.dart';

class SuccessfulOrder extends StatefulWidget {
  const SuccessfulOrder(this.res, {Key? key}) : super(key: key);

 final res;
  @override
  _SuccessfulOrderState createState() => _SuccessfulOrderState();
}

class _SuccessfulOrderState extends State<SuccessfulOrder> {
  @override
  Widget build(BuildContext context) {
    double h3 = SizeHelper.of(context).help(
      mobileSmall: 15,
      mobileNormal: 16,
      mobileLarge: 17,
      mobileExtraLarge: 20,
      tabletSmall: 22,
      tabletNormal: 25,
      tabletLarge: 29,
      tabletExtraLarge: 35,
      desktopSmall: 40,
      desktopNormal: 40,
      desktopLarge: 45,
      desktopExtraLarge: 45,
    );
    double h4 = SizeHelper.of(context).help(
      mobileSmall: 12,
      mobileNormal: 13,
      mobileLarge: 15,
      mobileExtraLarge: 17,
      tabletSmall: 20,
      tabletNormal: 25,
      tabletLarge: 30,
      tabletExtraLarge: 35,
      desktopSmall: 40,
      desktopNormal: 40,
      desktopLarge: 40,
      desktopExtraLarge: 45,
    );
    double h5 = SizeHelper.of(context).help(
      mobileSmall: 10,
      mobileNormal: 11,
      mobileLarge: 11,
      mobileExtraLarge: 13,
      tabletSmall: 15,
      tabletNormal: 18,
      tabletLarge: 21,
      tabletExtraLarge: 24,
      desktopSmall: 28,
      desktopNormal: 32,
      desktopLarge: 36,
      desktopExtraLarge: 38,
    );
    double h6 = SizeHelper.of(context).help(
      mobileSmall: 8,
      mobileNormal: 9,
      mobileLarge: 9,
      mobileExtraLarge: 10,
      tabletSmall: 12,
      tabletNormal: 14,
      tabletLarge: 15,
      tabletExtraLarge: 17,
      desktopSmall: 19,
      desktopNormal: 22,
      desktopLarge: 24,
      desktopExtraLarge: 25,
    );
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 30, 20, 30),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      // color: cardColor2
                    ),
                    child: Column(
                      children: [
                        Divider(
                          color: Colors.transparent,
                        ),
                        SizedBox(
                          child: Image.asset(
                              'assets/images/check_circle_outline.png'),
                        ),
                        Text(
                          Utils.labels!.thank_you,
                          style: Theme.of(context)
                              .textTheme
                              .headline6!
                              .copyWith(fontSize: h6),
                        ),
                        Text(
                          Utils.labels!.order_done,
                          style: Theme.of(context)
                              .textTheme
                              .headline6!
                              .copyWith(fontSize: h6),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(27, 20, 17, 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                Utils.labels!.order_id,
                                style: Theme.of(context)
                                    .textTheme
                                    .headline6!
                                    .copyWith(fontSize: h6),
                              ),
                              Text(
                                widget.res['id'].toString(),
                                style: Theme.of(context)
                                    .textTheme
                                    .headline6!
                                    .copyWith(fontSize: h5),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                            padding: const EdgeInsets.fromLTRB(27, 0, 17, 15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  Utils.labels!.status,
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline6!
                                      .copyWith(fontSize: h6),
                                ),
                                Text(
                                  widget.res['status'],
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline6!
                                      .copyWith(fontSize: h5),
                                ),
                              ],
                            )),
                        Padding(
                            padding: const EdgeInsets.fromLTRB(27, 0, 17, 15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  Utils.labels!.delivery_charge,
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline6!
                                      .copyWith(fontSize: h6),
                                ),
                                Text(
                                  "AED ${widget.res['shipping_total']}",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline6!
                                      .copyWith(fontSize: h5),
                                ),
                              ],
                            )),
                        Padding(
                            padding: const EdgeInsets.fromLTRB(27, 0, 17, 15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  Utils.labels!.total_price,
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline6!
                                      .copyWith(fontSize: h6),
                                ),
                                Text(
                                  "AED ${widget.res['total']}",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline6!
                                      .copyWith(fontSize: h5),
                                ),
                              ],
                            )),
                      ],
                    ),
                  ),
                ),
              ),

              Divider(
                color: Colors.transparent,
                height: h4,
              ),
              Text(
                "AED 200",
                style: Theme.of(context)
                    .textTheme
                    .headline6!
                    .copyWith(fontSize: h3),
              ),
              Text(
                Utils.labels!.we_have_received_payment,
                style: Theme.of(context)
                    .textTheme
                    .headline6!
                    .copyWith(fontSize: h5, color: Colors.grey),
                textAlign: TextAlign.center,
              ),
              Divider(
                color: Colors.transparent,
                height: h4,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: () {
                    // Navigator.pushReplacement(
                    //   context,
                    //   MaterialPageRoute(builder: (context) => Home()),
                    // );
                  },
                  child: GestureDetector(
                    onTap: (){
                      Navigator.pop(context);
                      Navigator.pop(context);
                    },
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: CustomButton_Color),
                      child: Center(
                          child: Text(
                        Utils.labels!.go_to_home,
                        style: Theme.of(context).textTheme.headline6!.copyWith(
                              fontSize: h4,
                              fontWeight: FontWeight.w400,
                            ),
                        textAlign: TextAlign.center,
                      )),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
