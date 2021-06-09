
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myprofile_flutter/theme/Platecolor.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            alignment: Alignment.center,
            height: MediaQuery.of(context).size.height,
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.only(left: 40, right: 40),
                  decoration: BoxDecoration(
                    color: Platecolor.fullGray,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(5),
                        bottomRight: Radius.circular(5)),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(left:
                    MediaQuery.of(context).size.width/8,
                  ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Stack(
                          children: [
                            SelectableText(
                              "Nur Syahfei",
                              style: GoogleFonts.odibeeSans(
                                fontSize: 100,
                                color: Platecolor.bg2,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 80, left: 220),
                              child: SelectableText(
                                "noersy",
                                style: GoogleFonts.odibeeSans(
                                  fontSize: 35,
                                  color: Platecolor.bg2,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SelectableText(
                          "Junior Flutter Developer",
                          style: GoogleFonts.signika(
                            fontSize: 30,
                            color: Platecolor.bg2,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SelectableText(
                            "GitHub - Linkedin - Twitter - Instagram",
                            style: GoogleFonts.lato(
                              fontSize: 18,
                              color: Platecolor.bg2,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Center(child: Text("test")),
          ),
        ],
      ),
    );
  }
}
