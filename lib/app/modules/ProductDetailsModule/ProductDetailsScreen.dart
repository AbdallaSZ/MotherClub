// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:motherclub/app/Models/ProductDetailsModel.dart';
import 'package:motherclub/app/StateEnum.dart';
import 'package:motherclub/app/modules/ProductDetailsModule/ProductDetailsBloc/ProductDetailsBloc.dart';
import 'package:motherclub/app/modules/ProductDetailsModule/ProductDetailsBloc/ProductDetailsEvent.dart';
import 'package:motherclub/app/modules/ProductDetailsModule/ProductDetailsBloc/ProductDetailsState.dart';
import 'package:motherclub/common/CustomWidget/statless/custom_appbar.dart';
import 'package:motherclub/common/Utils/Dialogs.dart';
import 'package:motherclub/common/Utils/Utils.dart';
import 'package:rxdart/subjects.dart';
import 'package:html/parser.dart';
import 'package:size_helper/size_helper.dart';

class ProductDetailsScreen extends StatefulWidget {
  ProductDetailsScreen(this.id, {Key? key}) : super(key: key);
  String id;
  @override
  _ProductDetailsScreenState createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen>
    with TickerProviderStateMixin {
  String _parseHtmlString(String htmlString) {
    final document = parse(htmlString);
    final String parsedString = parse(document.body!.text).documentElement!.text;

    return parsedString;
  }
  ProductDetailsBloc? productDetailsBloc;

  ProductDetailsModel? model;
  bool isFavorite = false;
  BehaviorSubject<String> rxSelectedAgeSubject = BehaviorSubject();
  TextEditingController itemNumberController = TextEditingController();
  TabController? tabController;

  @override
  void dispose() {
    rxSelectedAgeSubject.close();
    super.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    productDetailsBloc = BlocProvider.of<ProductDetailsBloc>(context);
    productDetailsBloc!.add(ProductDetailsEvent(widget.id));
    itemNumberController.text = 1.toString();
    rxItemsCount.sink.add(1);
    tabController = TabController(
      initialIndex: 0,
      length: 2,
      vsync: this,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: true,
        left: true,
        right: true,
        child: Container(
          width: Utils.deviceWidth,
          color: Colors.white,
          // height: Utils.deviceHeight-SizeHelper.of(context).help(
          //   mobileSmall: 170,
          //   mobileNormal: 160,
          //   mobileLarge: 130,
          //   mobileExtraLarge: 140,
          //   tabletSmall: 90,
          //   tabletNormal: 85,
          //   tabletLarge: 180,
          //   tabletExtraLarge: 190,
          //   desktopSmall: 200,
          //   desktopNormal: 210,
          //   desktopLarge: 230,
          //   desktopExtraLarge: 260,
          // ),
          child: BlocBuilder<ProductDetailsBloc, ProductDetailsState>(
              bloc: productDetailsBloc,
              builder: (context, state) {
                if (state.status == ResultState.Success) {
                  ProductDetailsState myState = state;
                  model = myState.model;
                  rxSelectedAgeSubject.sink
                      .add(model!.attributes![0].options![0]);
                  return Stack(
                    children: [
                      ListView(
                        children: [
                          _buildSliverHead(state.model!),
                          _buildSliverList(state.model!),
                        ],
                      ),
                    ],
                  );
                } else if (state.status == ResultState.Loading)
                  return Center(child: CircularProgressIndicator());
                else if (state.status == ResultState.Error) {
                  return Center(child: Text(state.errorMessage!));
                } else {
                  return Center();
                }
              }),
        ),
      ),
    );
  }

  _buildSliverHead(ProductDetailsModel model) {
    return DetailsSliver(
      expandedHeight: 270,
      model: model,
      roundedContainerHeight: 20,
      urls: model.images!,
      price: double.parse(model.price!),
      currency: Utils.labels!.amd,
    );
  }

  _buildSliverList(ProductDetailsModel model) {
    return ListView(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      // crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          child: _buildHeaderSection(model),
          padding: EdgeInsetsDirectional.only(start: 23, end: 23),
        ),
        SizedBox(
          height: 20,
        ),
      ],
    );
  }

  _buildHeaderSection(ProductDetailsModel model) {
    return Container(
        width: Utils.deviceWidth,
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            _buildHeaderProduct(model),
            _buildCartSection(model),
            SizedBox(
              height: 16,
            ),
            Text(
              _parseHtmlString(model.description!),
              maxLines: 10,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  fontSize: SizeHelper.of(context).help(
                    mobileSmall: 10,
                    mobileNormal: 12,
                    mobileLarge: 14,
                    tabletNormal: 16,
                    tabletExtraLarge: 18,
                    desktopLarge: 20,
                  ),
                  fontWeight: FontWeight.normal,
                  letterSpacing: 2,
                  color: Colors.grey.shade700),
            ),
            Container(
              alignment: Alignment.topCenter,
              height: Utils.deviceHeight * .5,
              width: Utils.deviceWidth,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildTabView(),
                  SizedBox(
                    height: 8,
                  ),
                  Container(
                    child: Expanded(
                      child: TabBarView(children: [
                        _buildAdditionalInfoSection(model),
                        _buildReviewSection(),
                      ], controller: tabController),
                    ),
                  ),
                ],
              ),
            )
          ],
        ));
  }

  _buildHeaderProduct(ProductDetailsModel model) {
    return Container(
        height: Utils.deviceHeight * .15,
        child: Column(
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                    flex: 3,
                    child: Text(
                      model.name!,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontSize: SizeHelper.of(context).help(
                            mobileSmall: 10,
                            mobileNormal: 12,
                            mobileLarge: 14,
                            tabletNormal: 16,
                            tabletExtraLarge: 18,
                            desktopLarge: 20,
                          ),
                          fontWeight: FontWeight.bold,
                          letterSpacing: 2,
                          color: Colors.black),
                    )),
                Flexible(
                    flex: 1,
                    child: Text(
                      model.price! + " " + Utils.labels!.amd,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontSize: SizeHelper.of(context).help(
                            mobileSmall: 10,
                            mobileNormal: 12,
                            mobileLarge: 14,
                            tabletNormal: 16,
                            tabletExtraLarge: 18,
                            desktopLarge: 20,
                          ),
                          fontWeight: FontWeight.bold,
                          color: Colors.green),
                    )),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Flexible(
                flex: 3,
                child: Text(
                  _parseHtmlString(model.shortDescription!) ,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                      letterSpacing: 2,
                      color: Colors.grey.shade700),
                )),
          ],
        ));
  }

  _buildCartSection(ProductDetailsModel model) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildAgeSection(model),
          SizedBox(
            height: 10,
          ),
          _buildAddToCartSection(model),
        ],
      ),
    );
  }

  _buildAgeSection(ProductDetailsModel model) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          Utils.labels!.age + " : ",
          style: TextStyle(
          fontSize: SizeHelper.of(context).help(
            mobileSmall: 10,
            mobileNormal: 12,
            mobileLarge: 14,
            tabletNormal: 16,
            tabletExtraLarge: 18,
            desktopLarge: 20,
          ),
              fontWeight: FontWeight.normal,
              letterSpacing: 2,
              color: Colors.black),
        ),
        Expanded(
          child: StreamBuilder<String>(
              stream: rxSelectedAgeSubject.stream,
              builder: (context, snapshot) {
                return DropdownButton<String>(
                  isExpanded: true,
                  value: snapshot.data,
                  items: model.attributes![0].options!.map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (_) {
                    rxSelectedAgeSubject.sink.add(_!);
                  },
                );
              }),
        )
      ],
    );
  }

  BehaviorSubject<int> rxItemsCount = BehaviorSubject();

  buildCountItem(Icon icon, Function onPress) {
    return Container(
      width: 25,
      height: 25,
      padding: EdgeInsets.all(2),
      alignment: Alignment.center,
      child: GestureDetector(
          onTap: () {
            onPress();
          },
          child: icon),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade400),
          shape: BoxShape.rectangle),
    );
  }

  _buildAddToCartSection(ProductDetailsModel model) {
    int stockQuantity = model.stockQuantity ?? 3;
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(
          flex: 2,
          child: StreamBuilder<int>(
              stream: rxItemsCount.stream,
              builder: (context, snapshot) {
                if (snapshot.hasData)
                  return Row(
                    children: [
                      buildCountItem(
                          Icon(
                            Icons.remove,
                            color: snapshot.data! > 1
                                ? Color(0xffFF4550)
                                : Colors.grey,
                            size: 15,
                          ), () {
                        if (snapshot.data! > 1)
                          rxItemsCount.sink.add((snapshot.data!) - 1);
                      }),
                      SizedBox(
                        width: 10,
                      ),
                      Text(snapshot.data!.toString(),
                          style:
                              TextStyle(        fontSize: SizeHelper.of(context).help(
                                mobileSmall: 10,
                                mobileNormal: 12,
                                mobileLarge: 14,
                                tabletNormal: 16,
                                tabletExtraLarge: 18,
                                desktopLarge: 20,
                              ), color: Colors.black87)),
                      SizedBox(
                        width: 10,
                      ),
                      buildCountItem(
                          Icon(
                            Icons.add,
                            color: snapshot.data! < stockQuantity
                                ? Color(0xffFF4550)
                                : Colors.grey,
                            size: 15,
                          ), () {
                        if (snapshot.data! < stockQuantity)
                          rxItemsCount.sink.add((snapshot.data!) + 1);
                      })
                    ],
                  );
                else
                  return Container();
              }),
        ),
        SizedBox(
          width: 8,
        ),
        GestureDetector(
          onTap: () async {
            if (Utils.id == "") {
              showDialog(
                  context: context,
                  builder: (c) {
                    return loginDialog;
                  });
            } else {
              String res = await Utils.bLoC.addCartItems(
                  widget.id, rxItemsCount.value, rxSelectedAgeSubject.value);
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    res,
                  ),
                  duration: const Duration(seconds: 3),
                ),
              );
            }
          },
          child: Container(
            padding: const EdgeInsets.all(8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.shopping_cart,
                  color: Colors.white,
                ),
                SizedBox(
                  width: 8,
                ),
                Text(
                  Utils.labels!.add_to_cart,
                  style: TextStyle(color: Colors.white,         fontSize: SizeHelper.of(context).help(
                    mobileSmall: 10,
                    mobileNormal: 12,
                    mobileLarge: 14,
                    tabletNormal: 16,
                    tabletExtraLarge: 18,
                    desktopLarge: 20,
                  ),),
                )
              ],
            ),
            decoration: BoxDecoration(
                color: Colors.purple.shade400,
                borderRadius: BorderRadius.circular(8)),
          ),
        )
      ],
    );
  }

  _buildTabView() {
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
    double h7 = SizeHelper.of(context).help(
      mobileSmall: 7,
      mobileNormal: 7,
      mobileLarge: 8,
      mobileExtraLarge: 8,
      tabletSmall: 10,
      tabletNormal: 12,
      tabletLarge: 13,
      tabletExtraLarge: 14,
      desktopSmall: 15,
      desktopNormal: 17,
      desktopLarge: 18,
      desktopExtraLarge: 20,
    );
    return TabBar(
      indicator: BoxDecoration(color: Colors.grey.shade300),
      labelColor: Colors.grey,
      controller: tabController,
      tabs: [
        Tab(
          child: Text(
            Utils.labels!.additional_information,
            style: TextStyle(
                color: Colors.black87,
                fontSize: h5,
                fontWeight: FontWeight.bold),
          ),
        ),
        Tab(
          child: Text(
            Utils.labels!.review,
            style: TextStyle(
                color: Colors.black87,
                fontSize: h5,
                fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }

  getOptionsStringsConcatenated(List<String> list) {
    return list.map((e) => e).toList().toString();
  }

  _buildAdditionalInfoSection(model) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(Utils.labels!.additional_information,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: SizeHelper.of(context).help(
                  mobileSmall: 15,
                  mobileNormal: 17,
                  mobileLarge: 19,
                  tabletNormal: 21,
                  tabletExtraLarge: 23,
                  desktopLarge: 25,
                ),
                color: Colors.black87)),
        Divider(
          height: 1,
          color: Colors.black87,
        ),
        SizedBox(
          height: 8,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              Utils.labels!.age + " : ",
              style: TextStyle(
                  fontSize: SizeHelper.of(context).help(
                    mobileSmall: 10,
                    mobileNormal: 12,
                    mobileLarge: 14,
                    tabletNormal: 16,
                    tabletExtraLarge: 18,
                    desktopLarge: 20,
                  ),
                  fontWeight: FontWeight.normal,
                  letterSpacing: 2,
                  color: Colors.black),
            ),
            Flexible(
                child: Text(
                    getOptionsStringsConcatenated(
                        model.attributes![0].options!),
                    style: TextStyle(
                        fontSize: SizeHelper.of(context).help(
                          mobileSmall: 8,
                          mobileNormal: 10,
                          mobileLarge: 12,
                          tabletNormal: 14,
                          tabletExtraLarge: 16,
                          desktopLarge: 18,
                        ),
                        fontWeight: FontWeight.normal,
                        letterSpacing: 2,
                        color: Colors.black)))
          ],
        )
      ],
    );
  }

  _buildReviewSection() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextFormField(
          decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: Utils.labels!.write_review),
        ),

        Row(
          children: [
            Expanded(flex: 1, child: Text(Utils.labels!.email)),
            Expanded(
              flex: 4,
              child: TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
            ),
          ],
        ),

        Row(
          children: [
            Expanded(flex: 1, child: Text(Utils.labels!.name)),
            Expanded(
              flex: 4,
              child: TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
            ),
          ],
        ),

        RaisedButton(
          onPressed: () {},
          child: Text(Utils.labels!.submit),
        )
      ],
    );
  }
}

class DetailsSliver extends StatefulWidget {
  double? expandedHeight;
  int? tripId;
  List<Images>? urls;
  double? roundedContainerHeight;
  double? price;
  ProductDetailsModel? model;

  String? currency;

  DetailsSliver(
      {this.expandedHeight,
      this.urls,
      this.roundedContainerHeight,
      this.model,
      this.price,
      this.tripId,
      this.currency});

  @override
  DetailsSliverDelegate createState() => DetailsSliverDelegate();
}

class DetailsSliverDelegate extends State<DetailsSliver> {
  int _numPages = 1;

  StreamBuilder _buildPageIndicator() {
    return StreamBuilder(
      stream: _currentPageIndicator,
      builder: (c, snap) {
        return Row(
          children: getIndicatorList(snap.data),
        );
      },
    );
  }

  getIndicatorList(int? current) {
    if (current == null) {
      current = 0;
    }
    List<Widget> list = [];
    for (int i = 0; i < _numPages; i++) {
      list.add(i == current ? _indicator(true) : _indicator(false));
    }
    return list;
  }

  BehaviorSubject<int> _currentPageIndicator = BehaviorSubject();

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 150),
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      height: 2.0,
      width: isActive ? 30.0 : 10.0,
      decoration: BoxDecoration(
        color: isActive ? Colors.white : Colors.grey.shade300,
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
    );
  }

  _buildPageView(List<Images> items) {
    _numPages = items.length;
    return Container(
      width: Utils.width,
      //color: Colors.red,
      height: Utils.deviceHeight * .3,
      child: PageView.builder(
          itemCount: items.length,
          controller: _pageController,
          itemBuilder: (BuildContext context, int index) {
            return Image.network(items[index].src!, fit: BoxFit.fill);
          },
          onPageChanged: (int index) {
            _currentPageNotifier.value = index;
            _currentPageIndicator.sink.add(index);
          }),
    );
  }

  var _pageController = PageController(initialPage: 0);
  var _currentPageNotifier = ValueNotifier<int>(0);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: widget.expandedHeight,
          child: _buildPageView(widget.urls!),
        ),
        _numPages > 1
            ? Positioned(
                bottom: 40,
                left: Utils.deviceWidth/ 2 - 50,
                child: _buildPageIndicator(),
              )
            : Container(),
        Positioned(
            top: widget.expandedHeight! - widget.roundedContainerHeight!,
            left: 0,
            child: Container(
              width: Utils.width,
              height: widget.roundedContainerHeight,
              decoration: BoxDecoration(
                color: Colors.white,
              ),
            )),
      ],
    );
  }

  @override
  void dispose() {
    _currentPageIndicator.close();
    super.dispose();
  }
}
