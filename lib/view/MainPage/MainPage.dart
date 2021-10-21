import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myprofile_flutter/theme/Platecolor.dart';
import 'package:universal_html/html.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage>
    with SingleTickerProviderStateMixin {
  bool _openNavigate = true;
  final sink = StreamController<double>();
  final pager = PageController();

  @override
  void initState() {
    // Remove `loading` div
    final loader = document.getElementsByClassName('loader-wrapper');
    if (loader.isNotEmpty) {
      loader.first.remove();
    }

    throttle(sink.stream).listen((offset) {
      pager.animateTo(
        offset,
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      );
    });

    super.initState();
  }

  @override
  void dispose() {
    sink.close();
    pager.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return Scaffold(
          body: Row(
            children: [
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                child: constraints.minWidth > 1000 && _openNavigate
                    ? Container(
                        decoration: BoxDecoration(
                          color: Platecolor.fullGray,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(5),
                            bottomRight: Radius.circular(5),
                          ),
                        ),
                        child: Stack(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 40, right: 40),
                              child: Row(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                          color: Colors.grey,
                                        ),
                                        shape: BoxShape.circle,
                                        color: Color(0xFFe0f2f1)),
                                    child: CircleAvatar(
                                      backgroundColor: Colors.grey,
                                      backgroundImage: AssetImage(
                                        "assets/images/profle_img.jpeg",
                                      ),
                                      radius: 80,
                                    ),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.only(left: 12),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
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
                                          padding:
                                              const EdgeInsets.only(top: 2),
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
                            Container(
                              margin: const EdgeInsets.only(bottom: 4),
                              width: 500,
                              alignment: Alignment.bottomRight,
                              child: TextButton(
                                onPressed: () {
                                  setState(() {
                                    _toggle();
                                  });
                                },
                                child: Icon(
                                  Icons.arrow_back_rounded,
                                  color: Colors.white,
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    : Container(
                        width: 30,
                        decoration: BoxDecoration(
                          color: Platecolor.fullGray,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(5),
                            bottomRight: Radius.circular(5),
                          ),
                        ),
                        child: Align(
                          alignment: Alignment.bottomRight,
                          child:TextButton(
                            onPressed: () {
                              setState(() {
                                _toggle();
                              });
                            },
                            child: Icon(
                              Icons.arrow_forward_rounded,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
              ),
              Expanded(
                child: Container(
                  height: 2000,
                  constraints: BoxConstraints.expand(),
                  child: Listener(
                    onPointerSignal: _handlePointerSignal,
                    child: PageView(
                      controller: pager,
                      scrollDirection: Axis.vertical,
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height,
                          alignment: Alignment.center,
                          margin: const EdgeInsets.only(left: 16, right: 16),
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
                                child: SelectableText(
                                    "         I am a Junior Developer. "
                                        "Currently studying at the University of Muhammadiyah Malang in the Department of Informatics "
                                        "and has been studying for four semesters with two experiences of two project contacts."),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          alignment: Alignment.center,
                          child: Text("Test"),
                        ),
                        Container(
                          alignment: Alignment.center,
                          child: Text("Test"),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  _toggle() {
    _openNavigate = !_openNavigate;
  }

  Stream<double> throttle(Stream<double> src) async* {
    double offset = pager.position.pixels;
    DateTime dt = DateTime.now();
    await for (var delta in src) {
      if (DateTime.now().difference(dt) > Duration(milliseconds: 200)) {
        offset = pager.position.pixels;
      }
      dt = DateTime.now();
      offset += delta;
      yield offset;
    }
  }

  void _handlePointerSignal(PointerSignalEvent e) {
    if (e is PointerScrollEvent && e.scrollDelta.dy != 0) {
      sink.add(e.scrollDelta.dy);
    }
  }
}
