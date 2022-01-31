import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:motherclub/app/Models/forum_detailes_model.dart';
import 'package:motherclub/app/modules/forum/views/comments_screen.dart';
import 'package:motherclub/common/Constant/ColorConstants.dart';
import 'package:motherclub/common/CustomWidget/statless/header_widget.dart';
import 'dart:ui' as ui;
import 'package:motherclub/common/Utils/Utils.dart';
import 'package:size_helper/size_helper.dart';
import 'package:html/parser.dart';

class ForumDetails extends StatefulWidget {
  ForumDetails({required this.formsId});

  final int formsId;

  @override
  State<ForumDetails> createState() => _ForumDetailsState();
}

class _ForumDetailsState extends State<ForumDetails> {
  TextEditingController _contentController = TextEditingController();
  TextEditingController _titleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    String _parseHtmlString(String htmlString) {
      final document = parse(htmlString);
      final String parsedString =
          parse(document.body!.text).documentElement!.text;

      return parsedString;
    }

    double deviceWidth = MediaQuery.of(context).size.width;
    return SafeArea(
        child: Scaffold(
      resizeToAvoidBottomInset: false,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.purple,
        elevation: 4,
        // shape: BeveledRectangleBorder(
        //     borderRadius: BorderRadius.circular(10)
        // ),
        onPressed: () {
          showDialog<void>(
            context: context,

            // barrierDismissible: false, // user must tap button!
            builder: (BuildContext context) {
              return AlertDialog(
                title:  Text(Utils.labels!.add_new_topic),
                content: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(

                      width: double.infinity,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Row(
                            children: [
                              Text('${Utils.labels!.title}'),
                              SizedBox(
                                width: 20,
                              ),
                              Expanded(
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(color: Colors.grey)),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8.0),
                                    child: TextFormField(
                                      controller: _titleController,
                                      decoration: InputDecoration(
                                        border: InputBorder.none,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Text('${Utils.labels!.content}'),
                              SizedBox(
                                width: 20,
                              ),
                              Expanded(
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(color: Colors.grey)),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8.0),
                                    child: TextFormField(
                                      controller: _contentController,
                                      maxLines: 3,
                                      decoration: InputDecoration(
                                        border: InputBorder.none,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                actions: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.purple,
                    ),
                    child: Text(Utils.labels!.add),
                    onPressed: () async {
                      await Utils.bLoC.createForum(_titleController.text,
                          widget.formsId.toString(), _contentController.text);
                      _titleController.text = '';
                      _contentController.text = '';
                      Navigator.of(context).pop(
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('${Utils.labels!.added}'),
                            duration: const Duration(seconds: 3),
                          ),
                        ),
                      );
                      setState(() {});
                    },
                  ),
                ],
              );
            },
          );
        },
        label: Text(Utils.labels!.add_new_topic),
        icon: const Icon(Icons.add),
      ),
      body: FutureBuilder<ForumDetailsModel>(
          future: Utils.bLoC.forumsDetails(widget.formsId),
          builder: (context, snapshot) {
            return snapshot.hasData
                ? ListView(
                    children: [
                      headerWidget(context, ' '),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        height: SizeHelper.of(context).help(
                          mobileSmall: 190,
                          mobileNormal: 200,
                          mobileLarge: 250,
                          tabletNormal: 300,
                          tabletExtraLarge: 350,
                          desktopLarge: 500,
                        ),
                        width: deviceWidth,
                        child: Card(
                          elevation: 5,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: Theme.of(context).cardColor,
                                  spreadRadius: 2,
                                  blurRadius: 5,

                                  offset: Offset(
                                      2, 2), // changes position of shadow
                                ),
                              ],
                              // color: Colors.blue,
                            ),
                            padding: EdgeInsets.symmetric(
                                horizontal: 15, vertical: 15),
                            child: Column(
                              children: [
                                Container(
                                  // padding:EdgeInsets.fromLTRB(15,17,10,0),
                                  child: Text(
                                      _parseHtmlString(
                                          "${snapshot.data!.title!}"),
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
                                      )),
                                ),

                                // Container(
                                //   // padding:EdgeInsets.all(15),
                                //   child: Row(
                                //     children: [
                                //       // CircleAvatar(
                                //       //   radius: 20,
                                //       //   backgroundColor: Colors.blue,
                                //       // ),
                                //       SizedBox(width: 10),
                                //       Text(
                                //         _parseHtmlString("${snapshot.data!.content!}"),
                                //         textAlign: TextAlign.center,
                                //         style: GoogleFonts.roboto(
                                //             fontSize: SizeHelper.of(context).help(
                                //               mobileSmall: 6,
                                //               mobileNormal: 8,
                                //               mobileLarge: 10,
                                //               tabletNormal: 12,
                                //               tabletExtraLarge: 14,
                                //               desktopLarge: 16,
                                //             ),
                                //             letterSpacing: 0.35,
                                //             height: 1.5,
                                //             fontWeight: FontWeight.w400,
                                //             color: Black_textColor),
                                //         maxLines: 2,
                                //       ),
                                //     ],
                                //   ),
                                // ),
                                Expanded(
                                  child: Center(
                                    child: Text(
                                      _parseHtmlString(
                                          "${snapshot.data!.content!}"),
                                      style: GoogleFonts.roboto(
                                          fontSize: SizeHelper.of(context).help(
                                            mobileSmall: 6,
                                            mobileNormal: 8,
                                            mobileLarge: 10,
                                            tabletNormal: 15,
                                            tabletExtraLarge: 20,
                                            desktopLarge: 22,
                                          ),
                                          letterSpacing: 0.25,
                                          height: 1.4,
                                          fontWeight: FontWeight.w400,
                                          color: Grey_text_Color),
                                    ),
                                  ),
                                ),
                                Row(
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          snapshot.data!.topicCount!.toString(),
                                          style: TextStyle(color: Colors.grey),
                                        ),
                                        Icon(
                                          Icons.topic,
                                          color: Colors.grey,
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                SizedBox(width: 15),
                                Text(
                                  Utils.labels!.total_post,
                                  style: GoogleFonts.roboto(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                      fontStyle: FontStyle.normal,
                                      letterSpacing: 0.25,
                                      color: Black_textColor),
                                ),
                                SizedBox(
                                  width: 9,
                                ),
                                Container(
                                  height: 21,
                                  width: 35,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    gradient: LinearGradient(
                                        begin: Alignment.topLeft,
                                        end: Alignment.bottomRight,
                                        stops: [
                                          0.0,
                                          0.1,
                                          10.0
                                        ],
                                        colors: [
                                          // Colors.deepPurple.shade400,
                                          CustomButton_Color,
                                          CustomButton_Color,
                                          CustomButton_Second_Color,
                                          // Colors.deepPurple.shade200,
                                        ]),
                                  ),
                                  child: Center(
                                    child: Text(
                                      snapshot.data!.topics == null
                                          ? '0'
                                          : "${snapshot.data!.topics!.length}",
                                      style: GoogleFonts.roboto(
                                          fontSize: 13,
                                          fontWeight: FontWeight.w400,
                                          fontStyle: FontStyle.normal,
                                          letterSpacing: 0.25,
                                          color: white_color),
                                    ),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                      // Container(height: 30,child: Text("81" + Utils.labels!.comments)),
                      snapshot.data!.topics == null
                          ? Container()
                          : ListView.builder(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: snapshot.data!.totalTopics,
                              itemBuilder: (BuildContext context, int index) {
                                return Padding(
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
                                                      "${snapshot.data!.topics![index].authorName}",
                                                      style: GoogleFonts.roboto(
                                                          fontSize: 16,
                                                          letterSpacing: 1,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color:
                                                              Black_textColor),
                                                    ),
                                                    Text(
                                                      "${snapshot.data!.topics![index].postDate}",
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
                                                "${snapshot.data!.topics![index].title}",
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
                                              snapshot.data!.topics![index]
                                                  .replyCount
                                                  .toString(),
                                              style:
                                                  TextStyle(color: Colors.grey),
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          CommentsScreen(
                                                              snapshot
                                                                  .data!
                                                                  .topics![
                                                                      index]
                                                                  .id)),
                                                );
                                              },
                                              child: Icon(
                                                Icons.chat,
                                                color: Colors.grey,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              }),
                      SizedBox(height: 50),
                    ],
                  )
                : Center(
                    child: Container(),
                  );
          }),
    ));
  }
}
