// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:motherclub/app/Models/ProductDetailsModel.dart';
import 'package:motherclub/app/StateEnum.dart';
import 'package:motherclub/app/modules/ProductDetailsModule/ProductDetailsBloc/ProductDetailsBloc.dart';
import 'package:motherclub/app/modules/ProductDetailsModule/ProductDetailsBloc/ProductDetailsEvent.dart';
import 'package:motherclub/app/modules/ProductDetailsModule/ProductDetailsBloc/ProductDetailsState.dart';
import 'package:motherclub/common/CustomWidget/statless/custom_appbar.dart';
import 'package:motherclub/common/Utils/Utils.dart';
import 'package:rxdart/subjects.dart';

class ProductDetailsScreen extends StatefulWidget {
  ProductDetailsScreen(this.id, {Key? key}) : super(key: key);
  String id;

  @override
  _ProductDetailsScreenState createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> with TickerProviderStateMixin   {
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
      appBar: CustomAppBar(withBackButton: true, onBackButtonPressed: (){
        Navigator.pop(context);
      },),
      body: SafeArea(
        bottom: true,
        left: true,
        right: true,
        child: Container(
          width: Utils.width,
          color: Colors.white,
          height: Utils.height,
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
                      SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: Column(children: [
                            _buildSliverHead(state.model!),
                            _buildSliverList(state.model!)
                          ])),
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
        currency: Utils.labels!.amd);
  }

  _buildSliverList(ProductDetailsModel model) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
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
        width: Utils.width,
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
              model.description!,
              maxLines: 10,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                  letterSpacing: 2,
                  color: Colors.grey.shade700),
            ),
            Container(
              alignment: Alignment.topCenter,
              height: Utils.height! * .5,
              width: Utils.width!,
              child:Column(
                mainAxisAlignment: MainAxisAlignment.start,crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildTabView(),
                  SizedBox(height: 8,),
                  Container(
                    height: Utils.height! * .4,
                    child: TabBarView(
                        children: [
                          _buildAdditionalInfoSection(model),
                          _buildReviewSection(),

                        ],
                        controller:tabController
                    ),
                  ),
                ],
              ) ,

            )
          ],
        ));
  }

  _buildHeaderProduct(ProductDetailsModel model) {
    return Container(
        height: Utils.height! * .15,
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
                          fontSize: 20,
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
                          fontSize: 18,
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
                  model.shortDescription!,
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
              fontSize: 16,
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
          border: Border.all(color: Colors.grey.shade400), shape: BoxShape.rectangle),
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
              if(snapshot.hasData)
              return Row(children: [
                buildCountItem(
                    Icon(
                      Icons.remove,
                      color:
                      snapshot.data! > 1 ? Color(0xffFF4550) : Colors.grey,
                      size: 15,
                    ), () {
                  if(snapshot.data! > 1)
                    rxItemsCount.sink.add((snapshot.data!) - 1);
                }),
                SizedBox(
                  width: 10,
                ),
                Text(snapshot.data!.toString(),
                    style: TextStyle(fontSize: 14 , color: Colors.black87)),
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
                  if(snapshot.data! < stockQuantity)
                    rxItemsCount.sink.add((snapshot.data!) + 1);
                })

              ],);
            else
              return Container();
            }
          ),
        ),
        SizedBox(
          width: 8,
        ),
        Expanded(
          flex: 4,
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
                  style: TextStyle(color: Colors.white, fontSize: 16),
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
                fontSize: 18,
                fontWeight: FontWeight.bold),
          ),
        ),
        Tab(
          child: Text(
            Utils.labels!.review,
            style: TextStyle(
                color: Colors.black87,
                fontSize: 18,
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
        Text(Utils.labels!.additional_information, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18 , color: Colors.black87)),
        Divider(height: 1,color: Colors.black87,),
        SizedBox(height: 8,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              Utils.labels!.age + " : ",
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                  letterSpacing: 2,
                  color: Colors.black),
            ),
            Flexible(child: Text(getOptionsStringsConcatenated(model.attributes![0].options!),style: TextStyle(
                fontSize: 12,
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
      children: [
        TextFormField(
          decoration: InputDecoration(
            border: OutlineInputBorder(

            ),
            hintText: Utils.labels!.write_review
          ),
        ),
        SizedBox(height: 16,),
        Row(
          children: [
            Expanded(
                flex: 1,
                child: Text(Utils.labels!.email )),
            Expanded(
              flex: 4,
              child: TextFormField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(

                    ),

                ),
              ),
            ),

          ],
        ),
        SizedBox(height: 16,),
        Row(
          children: [
            Expanded(                flex: 1,
                child: Text(Utils.labels!.name )),
            Expanded(
              flex: 4,
              child: TextFormField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(

                    ),

                ),
              ),
            ),

          ],
        ),
        SizedBox(height: 16,),
        RaisedButton(onPressed: (){},
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
      height: Utils.height! * .3,
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
                left: Utils.width! / 2 - 50,
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
