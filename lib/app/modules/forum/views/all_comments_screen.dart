import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:motherclub/app/Models/replies_model.dart';
import 'package:motherclub/common/Constant/ColorConstants.dart';

class AllCommentsScreen extends StatelessWidget {
  AllCommentsScreen(this.data);
  final List<RepliesModel>? data;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView.builder(
            itemCount: data!.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                padding: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
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
                                  "dummy title",
                                  style: GoogleFonts.roboto(
                                      fontSize: 16,
                                      letterSpacing: 1,

                                      fontWeight: FontWeight.w500,
                                      color: Black_textColor),
                                ),
                                Text(
                                  "${data![index].date}",
                                  style: GoogleFonts.roboto(
                                      fontSize: 10,
                                      letterSpacing: 0.35,
                                      height: 1.5,
                                      fontWeight: FontWeight.w400,
                                      color: Black_textColor),
                                )
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
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Text(
                            "${data![index].content!.rendered}",
                            style: GoogleFonts.roboto(
                                fontSize: 12,
                                letterSpacing: 0.35,
                                height: 1.5,
                                fontWeight: FontWeight.w500,
                                color: Black_textColor),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }),
      ),
    );
  }
}
