import 'package:flutter/material.dart';
import 'package:motherclub/app/Models/pregnancy_data_model.dart';
import 'package:motherclub/app/modules/YourPregnancy/Views/pregnancy_article_detaies.dart';
import 'package:motherclub/app/modules/YourPregnancy/Views/pregnancy_article_item.dart';
import 'package:motherclub/common/CustomWidget/statless/custom_appbar.dart';
import 'package:motherclub/common/Utils/Utils.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:size_helper/size_helper.dart';

class AllPregnancyArticles extends StatefulWidget {
  AllPregnancyArticles({required this.slug});

  final String slug;

  @override
  _AllPregnancyArticlesScreenState createState() =>
      _AllPregnancyArticlesScreenState();
}

class _AllPregnancyArticlesScreenState extends State<AllPregnancyArticles> {
  static int _pageSize = 10;
  final PagingController<int, Article> _pagingController =
      PagingController(firstPageKey: 1);

  @override
  void initState() {
    super.initState();
    _pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });
  }

  List<Article>? data;

  _StoreViewScreenState() {
    //Register a closure to be called when the object changes.
  }

  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    double deviceWidth = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(
          withBackButton: true,
          onBackButtonPressed: () {
            Navigator.pop(context);
          },
        ),
        body: Container(
            padding: EdgeInsets.all(10),
            // color: Colors.red,
            height: Utils.height,
            child: PagedGridView(
                pagingController: _pagingController,
                builderDelegate: PagedChildBuilderDelegate<Article>(
                  itemBuilder: (context, item, index) => buildArticleItem(
                    item,
                  ),
                ),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
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
                ))),
      ),
    );
  }

  buildArticleItem(Article model) {
    return PregnancyArticleItem(data: model);
  }

  int page = 1;

  Future<void> _fetchPage(int pageKey) async {
    try {
      var newItems = await Utils.bLoC.weekDetails(widget.slug, page);
      final isLastPage = newItems.articles!.length < _pageSize;
      if (isLastPage) {
        _pagingController.appendLastPage(newItems.articles!);
      } else {
        final nextPageKey = pageKey + newItems.articles!.length;
        _pagingController.appendPage(newItems.articles!, nextPageKey);
      }
      page += 1;
    } catch (error) {
      _pagingController.error = error;
    }
  }
}
