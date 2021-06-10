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
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
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
                        padding: EdgeInsets.only(
                          left: (constraints.maxWidth > 1400)
                              ? MediaQuery.of(context).size.width / 8
                              : 0,
                        ),
                        child: Row(
                          children: [
                            Container(
                              width: 150,
                              height: 150,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Color(0xFFe0f2f1)),
                            ),
                            Container(
                              padding: const EdgeInsets.only(left: 12),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SelectableText(
                                    "Nur Syahfei",
                                    style: GoogleFonts.signika(
                                      fontSize: 50,
                                      color: Platecolor.bg2,
                                    ),
                                  ),
                                  SelectableText(
                                    "Junior Flutter Developer",
                                    style: GoogleFonts.signika(
                                      fontSize: 20,
                                      color: Platecolor.bg2,
                                      fontStyle: FontStyle.italic,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 2),
                                    child: SelectableText(
                                      "GitHub - Linkedin - Twitter - Instagram",
                                      style: GoogleFonts.lato(
                                        fontSize: 12,
                                        color: Platecolor.bg2,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Scrollbar(
                  child: ListView(
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height,
                        alignment: Alignment.center,
                        child: Column(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 50, bottom: 50),
                              child: SelectableText(
                                "- About -",
                                style: GoogleFonts.satisfy(
                                  fontSize: 35,
                                ),
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width / 2,
                              child: SelectableText(
                                  "         I am a Junior Developer. "
                                   "Currently studying at the University of Muhammadiyah Malang in the Department of Informatics "
                                   "and has been studying for four semesters with two experiences of two project contacts."),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height / 3,
                        alignment: Alignment.center,
                        child: Text("Test"),
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height / 3,
                        alignment: Alignment.center,
                        child: Text("Test"),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
