import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:motherclub/app/Models/CategoriesModel.dart';
import 'package:motherclub/app/Models/ProductDetailsModel.dart';
import 'package:motherclub/app/Models/ProductModel.dart';
import 'package:motherclub/app/Shimmers/Product_Shimmer.dart';
import 'package:motherclub/app/modules/ProductDetailsModule/ProductDetailsBloc/ProductDetailsBloc.dart';
import 'package:motherclub/app/modules/ProductDetailsModule/ProductDetailsScreen.dart';
import 'package:motherclub/app/modules/Store/views/product_item.dart';
import 'package:motherclub/app/modules/article_part/articles.dart';
import 'package:motherclub/app/routes/app_pages.dart';
import 'package:motherclub/common/Constant/ColorConstants.dart';
import 'package:motherclub/common/CustomWidget/InfoWidget.dart';
import 'package:motherclub/common/Utils/RandomColorModel.dart';
import 'package:motherclub/common/Utils/Utils.dart';
import 'package:size_helper/size_helper.dart';

Widget homeAppBar(
  String Label,
  double height,
  double width,
  BuildContext context,
) {
  List<String> categoriesName = [Utils.labels!.your_store,Utils.labels!.your_forum,Utils.labels!.your_baby,Utils.labels!.your_Pregnancy,];
  List<String> routes = [
    Routes.YOURPREGNANCY,
    Routes.YOURBABY,
    Routes.STORE,
    Routes.FORUM,
  ];
  return CustomScrollView(slivers: <Widget>[
    // SliverToBoxAdapter(
    // child: AppBarWidget("",deviceHeight/9.4,deviceWidth,context)),
    SliverPadding(
        padding: EdgeInsets.only(
          bottom: SizeHelper.of(context).help(
            mobileSmall: 15,
            mobileNormal: 17,
            mobileLarge: 19,
            tabletNormal: 21,
            tabletExtraLarge: 23,
            desktopLarge: 25,
          ),
        ),
        sliver: SliverToBoxAdapter(child: InfoWidget())),
    SliverPadding(
      padding: EdgeInsets.only(
        bottom: SizeHelper.of(context).help(
          mobileSmall: 15,
          mobileNormal: 17,
          mobileLarge: 19,
          tabletNormal: 21,
          tabletExtraLarge: 23,
          desktopLarge: 25,
        ),
      ),
      sliver: SliverToBoxAdapter(
        child: Container(
          height: SizeHelper.of(context).help(
            mobileSmall: 90,
            mobileNormal: 100,
            mobileLarge: 110,
            tabletNormal: 120,
            tabletExtraLarge: 130,
            desktopLarge: 140,
          ),
          width: Utils.width,
          child: FutureBuilder<List<CategoriesModel>>(
              future: Utils.bLoC.categoresList(context),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  List<CategoriesModel>? data = snapshot.data;
                  return Center(
                    child: ListView.separated(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: data!.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Get.toNamed(routes[index]);
                          },
                          child: Container(
                              child: Column(children: [
                            Container(
                              height: SizeHelper.of(context).help(
                                mobileSmall: 60,
                                mobileNormal: 65,
                                mobileLarge: 70,
                                tabletNormal: 75,
                                tabletExtraLarge: 80,
                                desktopLarge: 85,
                              ),
                              width: SizeHelper.of(context).help(
                                mobileSmall: 60,
                                mobileNormal: 65,
                                mobileLarge: 70,
                                tabletNormal: 75,
                                tabletExtraLarge: 80,
                                desktopLarge: 85,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),

                                // color: Color(0xFFCDECE4),
                              ),
                              child: Image.network(data[index].image),
                            ),
                            SizedBox(height: 3),
                            Text(

                              (data[index].title == 'Store') ? Utils.labels!.your_store: (data[index].title == 'Forum') ?Utils.labels!.your_forum: (data[index].title == 'Your Baby') ?Utils.labels!.your_baby:(data[index].title == 'Your Pregnancy') ?Utils.labels!.your_Pregnancy:'',
                              style: GoogleFonts.roboto(
                                fontSize: SizeHelper.of(context).help(
                                  mobileSmall: 7,
                                  mobileNormal: 9,
                                  mobileLarge: 10,
                                  tabletNormal: 12,
                                  tabletExtraLarge: 14,
                                  desktopLarge: 16,
                                ),
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.w500,
                                color: Black_textColor,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ])),
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return SizedBox(
                          width: SizeHelper.of(context).help(
                            mobileSmall: 2,
                            mobileNormal: 2,
                            mobileLarge: 2,
                            mobileExtraLarge: 5,
                            tabletSmall: 5,
                            tabletNormal: 10,
                            tabletLarge: 30,
                            tabletExtraLarge: 70,
                            desktopLarge: 80,
                          ),
                        );
                      },
                    ),
                  );
                } else {
                  return ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return snapshot.hasData
                          ? ProductShimer(height, width, context)
                          : Card(
                              // padding: EdgeInsets.all(2),
                              // color: Colors.yellow,
                              child: ProductShimer(height, width, context),
                            );
                    },
                  );
                }
              }),
        ),
      ),
    ),

    SliverToBoxAdapter(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Text(
          Utils.labels!.we_choose_for_you,
          style: GoogleFonts.roboto(
            fontSize: SizeHelper.of(context).help(
              mobileSmall: 10,
              mobileNormal: 12,
              mobileLarge: 14,
              tabletNormal: 16,
              tabletExtraLarge: 18,
              desktopLarge: 20,
            ),
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w700,
            color: Black_textColor,
          ),
        ),
      ),
    ),

    // To convert this infinite list to a list with three items,
    // uncomment the following line:
    // if (index > 3) return null;
    SliverPadding(
      padding: EdgeInsets.only(
        bottom: SizeHelper.of(context).help(
          mobileSmall: 10,
          mobileNormal: 15,
          mobileLarge: 20,
          tabletNormal: 40,
          tabletExtraLarge: 45,
          desktopLarge: 50,
        ),
      ),
      sliver: SliverToBoxAdapter(
        child: SizedBox(
          height: SizeHelper.of(context).help(
            mobileSmall: 180,
            mobileLarge: 200.0,
            tabletNormal: 240.0,
            tabletExtraLarge: 325.0,
            desktopLarge: 380.0,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 3),
            child: ChooseForYouWidget(),
          ),
        ),
      ),
    ),

    SliverToBoxAdapter(
      child: SizedBox(
        height: 29,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                Utils.labels!.shopping_products,
                style: GoogleFonts.roboto(
                  fontSize: SizeHelper.of(context).help(
                    mobileSmall: 10,
                    mobileNormal: 12,
                    mobileLarge: 14,
                    tabletNormal: 16,
                    tabletExtraLarge: 18,
                    desktopLarge: 20,
                  ),
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w700,
                  color: Black_textColor,
                ),
              ),
              GestureDetector(
                onTap: () => Get.toNamed(Routes.STORE),
                child: Text(
                  Utils.labels!.see_all,
                  style: GoogleFonts.roboto(
                    fontSize: SizeHelper.of(context).help(
                      mobileSmall: 6,
                      mobileNormal: 8,
                      mobileLarge: 10,
                      tabletNormal: 12,
                      tabletExtraLarge: 14,
                      desktopLarge: 16,
                    ),
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w500,
                    color: primary_text_color,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ),
    SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.only(left: 10.0),
        child: Container(
          height: SizeHelper.of(context).help(
            mobileSmall: 180,
            mobileLarge: 200.0,
            tabletNormal: 240.0,
            tabletExtraLarge: 325.0,
            desktopLarge: 380.0,
          ),
          child: FutureBuilder<List<ProductDetailsModel>>(
              future: Utils.bLoC.productList(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  List<ProductDetailsModel>? data = snapshot.data;
                  return ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: data!.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (c) => BlocProvider(
                                        create: (c) => ProductDetailsBloc(),
                                        child: ProductDetailsScreen(
                                            data[index].id.toString()))));
                          },
                          child: ProductItem(
                            data: data[index],
                          ));

                    },
                  );
                } else {
                  return ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return Card(
                              child: ProductShimer(height, width, context),
                            );
                    },
                  );
                }
              }),
        ),
      ),
    ),
  ]);
}
