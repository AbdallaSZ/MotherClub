import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:motherclub/app/Models/reply_model.dart' as rep;
import 'package:motherclub/app/Models/topic_model.dart';
import 'package:motherclub/common/Constant/ColorConstants.dart';
import 'package:html/parser.dart';
import 'package:motherclub/common/CustomWidget/statless/header_widget.dart';
import 'package:motherclub/common/Utils/Utils.dart';
import 'dart:ui' as ui;

import 'package:size_helper/size_helper.dart';

class CommentsScreen extends StatefulWidget {
  CommentsScreen(this.topicId);

  final int? topicId;

  @override
  State<CommentsScreen> createState() => _CommentsScreenState();
}

class _CommentsScreenState extends State<CommentsScreen> {
  TextEditingController _repController = TextEditingController();
  final PagingController<int, Reply> _pagingController =
  PagingController(firstPageKey: 1);
  String _parseHtmlString(String htmlString) {
    final document = parse(htmlString);
    final String parsedString =
        parse(document.body!.text).documentElement!.text;

    return parsedString;
  }

@override
  void initState() {
    // TODO: implement initState

  _pagingController.addPageRequestListener((pageKey) {
    Future.delayed(Duration(seconds: 2),
            (){
          _fetchPage(widget.topicId! ,pageKey,);
        }
    );
  });

  super.initState();
  }
  static const _pageSize = 5;

  int pageNumber = 1 ;
  Future<void> _fetchPage(int formsId,int pageKey) async {
    try {
      final result = await Utils.bLoC.topicDetails(formsId, pageNumber , _pageSize);
      List<Reply> newItems = result.replies ?? [];
      final isLastPage = newItems.length < _pageSize;
      if (isLastPage) {
        _pagingController.appendLastPage(newItems);
      } else {
        pageNumber++;
        final nextPageKey = pageKey + newItems.length;
        _pagingController.appendPage(newItems, nextPageKey);
      }
    } catch (error) {
      _pagingController.error = error;
    }
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomSheet: Padding(
          padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
          child: Container(
            height: SizeHelper.of(context).help(
              mobileSmall: 20,
              mobileNormal: 25,
              mobileLarge: 30,
              tabletNormal: 40,
              tabletExtraLarge: 45,
              desktopLarge: 50,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(
                  Icons.chat,
                  color: Black_textColor,
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0xffe0e0e0),
                            spreadRadius: 1,
                            blurRadius: 5,
                            offset: Offset(0, 0), // changes position of shadow
                          ),
                        ],
                      ),
                      child: TextFormField(
                        controller: _repController,
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(15),
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          hintText: Utils.labels!.write_your_experience,
                          hintStyle: GoogleFonts.roboto(
                              fontSize: SizeHelper.of(context).help(
                                mobileSmall: 10,
                                mobileNormal: 12,
                                mobileLarge: 13,
                                tabletNormal: 15,
                                tabletExtraLarge: 16,
                                desktopLarge: 17,
                              ),
                              letterSpacing: 0.25,
                              fontWeight: FontWeight.w400,
                              color: Black_textColor),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ShaderMask(
                          blendMode: BlendMode.srcIn,
                          shaderCallback: (Rect bounds) {
                            return ui.Gradient.linear(
                              Offset(14.0, 24.0),
                              Offset(24.0, 0.0),
                              [CustomButton_Color, CustomButton_Second_Color],
                            );
                          },
                          child: GestureDetector(
                            onTap: () async {
                              await Utils.bLoC.createForumRep(widget.topicId.toString(),_repController.text);
                              _repController.text = '';
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text('${Utils.labels!.added}'),
                                  duration: const Duration(seconds: 3),
                                ),
                              );
                              setState(() {});
                            },
                            child: Icon(
                              Icons.send,
                              color: Black_textColor,
                            ),
                          )),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        body: ListView(
          physics: NeverScrollableScrollPhysics(),
          children: [
            headerWidget(context, ' '),
            FutureBuilder<TopicModel>(
                future: Utils.bLoC.topicDetails(widget.topicId!,1,200),
                builder: (context, snapshot) {
                  return snapshot.connectionState == ConnectionState.waiting
                      ? !snapshot.hasData
                          ? Container()
                          : Center(
                              child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: 50,
                                ),
                              ],
                            ))
                      : (!snapshot.hasData)
                          ? Container()
                          : Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          width: 1, color: Colors.grey),
                                      borderRadius: BorderRadius.circular(10),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.1),
                                          spreadRadius: 1,
                                          blurRadius: 1,
                                          offset: Offset(0,
                                              3), // changes position of shadow
                                        ),
                                      ],
                                    ),
                                    padding: EdgeInsets.all(10),
                                    // height: 110,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              children: [
                                                CircleAvatar(
                                                  radius: 20,
                                                  backgroundColor: Colors.blue,
                                                ),
                                                SizedBox(width: 10),
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      "${snapshot.data!.authorName}",
                                                      style: GoogleFonts.roboto(
                                                          fontSize: 16,
                                                          letterSpacing: 1,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color:
                                                              Black_textColor),
                                                    ),
                                                    Text(
                                                      "${snapshot.data!.postDate}",
                                                      style: GoogleFonts.roboto(
                                                        fontSize: 10,
                                                        letterSpacing: 0.35,
                                                        height: 1.5,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        color: Black_textColor,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 10),
                                        Center(
                                          child: SingleChildScrollView(
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 8.0),
                                              child: Text(
                                                _parseHtmlString(
                                                    "${snapshot.data!.content}"),
                                                style: GoogleFonts.roboto(
                                                  fontSize: 12,
                                                  letterSpacing: 0.35,
                                                  height: 1.5,
                                                  fontWeight: FontWeight.w500,
                                                  color: Black_textColor,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            Text(
                                              snapshot.data!.replyCount
                                                  .toString(),
                                              style:
                                                  TextStyle(color: Colors.grey),
                                            ),
                                            Icon(
                                              Icons.chat,
                                              color: Colors.grey,
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15),
                                  child: snapshot.data!.replies == null
                                      ? Container(
                                          child: Center(
                                            child: Text(
                                              'no replies for this topic',
                                              style:
                                                  TextStyle(color: Colors.grey),
                                            ),
                                          ),
                                        )
                                      : Container(
                                    height: MediaQuery.of(context).size.height * .6,
                                    child: PagedListView<int, Reply>(
                                      pagingController: _pagingController,
                                      builderDelegate: PagedChildBuilderDelegate<Reply>(
                                        itemBuilder: (context,Reply item, index) => buildFutureBuilder(item),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            );
                }),
            SizedBox(height: 100,)

          ],
        ),
      ),
    );
  }

  FutureBuilder<rep.ReplyModel> buildFutureBuilder(Reply item) {
    return FutureBuilder<rep.ReplyModel>(
                                              future: Utils.bLoC.repDetails(
                                                  item.id!),
                                              builder: (context,
                                                  repDetailsSnapshot) {
                                                return !repDetailsSnapshot
                                                        .hasData
                                                    ? Container()
                                                    : Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8.0),
                                                        child: Container(
                                                          decoration:
                                                              BoxDecoration(
                                                            border: Border.all(
                                                                width: 1,
                                                                color: Colors
                                                                    .grey),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10),
                                                            boxShadow: [
                                                              BoxShadow(
                                                                color: Colors
                                                                    .white
                                                                    .withOpacity(
                                                                        0.1),
                                                                spreadRadius:
                                                                    1,
                                                                blurRadius: 1,
                                                                offset: Offset(
                                                                    0,
                                                                    3), // changes position of shadow
                                                              ),
                                                            ],
                                                          ),
                                                          padding:
                                                              EdgeInsets.all(
                                                                  10),
                                                          // height: 110,
                                                          child: Column(
                                                            // crossAxisAlignment: CrossAxisAlignment.start,

                                                            children: [
                                                              Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: [
                                                                  Row(
                                                                    children: [
                                                                      CircleAvatar(
                                                                        radius:
                                                                            20,
                                                                        backgroundColor:
                                                                            Colors.blue,
                                                                      ),
                                                                      SizedBox(
                                                                          width:
                                                                              10),
                                                                      Column(
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.start,
                                                                        children: [
                                                                          Text(
                                                                            "${item.authorName}",
                                                                            style: GoogleFonts.roboto(fontSize: 16, letterSpacing: 1, fontWeight: FontWeight.w500, color: Black_textColor),
                                                                          ),
                                                                          Text(
                                                                            "${item.postDate}",
                                                                            style: GoogleFonts.roboto(
                                                                              fontSize: 10,
                                                                              letterSpacing: 0.35,
                                                                              height: 1.5,
                                                                              fontWeight: FontWeight.w400,
                                                                              color: Black_textColor,
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                      // Row(
                                                                      //   mainAxisAlignment: MainA,
                                                                      //   children: [

                                                                      //   ],
                                                                      // ),
                                                                    ],
                                                                  ),
                                                                  Text(
                                                                    "${repDetailsSnapshot.data!.title}",
                                                                    style: GoogleFonts
                                                                        .roboto(
                                                                      fontSize:
                                                                          8,
                                                                      letterSpacing:
                                                                          0.35,
                                                                      height:
                                                                          1.5,
                                                                      fontWeight:
                                                                          FontWeight.w500,
                                                                      color: Colors
                                                                          .blue,
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                              Center(
                                                                child: Text(
                                                                  _parseHtmlString(
                                                                      "${repDetailsSnapshot.data!.content}"),
                                                                  style: GoogleFonts
                                                                      .roboto(
                                                                    fontSize:
                                                                        15,
                                                                    letterSpacing:
                                                                        0.35,
                                                                    height:
                                                                        1.5,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                    color: Colors
                                                                        .grey,
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      );
                                              });
  }
}
