import 'dart:js' as js;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myprofile_flutter/theme/costume_icons.dart';
import 'package:myprofile_flutter/theme/platecolor.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return Positioned(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                      width: constraints.maxWidth / (constraints.maxWidth < 1269 ? 100.0 : 50.5),
                  ),
                  Column(
                    children: [
                      Text(
                        "Hello,",
                        style: Theme.of(context)
                            .textTheme
                            .headline6
                            ?.copyWith(fontWeight: FontWeight.w300),
                      ),
                      const SizedBox(height: 8.0),
                      Text("I’m Nur Syahfei",
                          style: Theme.of(context).textTheme.headline2),
                      const SizedBox(height: 8.0),
                      Text(
                        "Flutter Developer, specialized in Mobile.",
                        style: Theme.of(context)
                            .textTheme
                            .headline5
                            ?.copyWith(fontWeight: FontWeight.w200),
                      ),
                      const SizedBox(height: 8.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _button(CostumeIcons.twitter, () {
                            js.context.callMethod(
                                'open', ['https://twitter.com/NurSyahfei']);
                          }),
                          _button(CostumeIcons.github, () {
                            js.context.callMethod(
                                'open', ['https://github.com/noersy']);
                          }),
                          _button(CostumeIcons.linkedin, () {
                            js.context.callMethod(
                                'open', ['https://www.linkedin.com/in/noersy']);
                          }),
                          _button(CostumeIcons.instagram, () {
                            js.context.callMethod('open',
                                ['https://www.instagram.com/nursyahfei']);
                          }),
                        ],
                      ),
                    ],
                  ),
                  if (constraints.maxWidth > 1269)
                    if(constraints.maxHeight > 750)
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 62.0),
                      height: constraints.maxHeight / (constraints.maxHeight < 920 ? 1.6 : 2),
                      width: constraints.maxWidth / (constraints.maxWidth < 1560 ? 1.9 : 2.5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Positioned(
                            left: 240,
                            child: Container(
                              decoration: BoxDecoration(
                                color: Platecolor.bg2.withOpacity(0.5),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              height: constraints.maxHeight / (constraints.maxHeight < 920 ? 1.8 : 2.5),
                              width: 3,
                            ),
                          ),
                          Stack(
                            alignment: Alignment.center,
                            children: [
                              Positioned(
                                left: 145,
                                top: 70,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Padding(
                                      padding: EdgeInsets.symmetric(vertical: 5.0),
                                      child: Text("October 1999"),
                                    ),
                                    const SizedBox(width: 24.0),
                                    SizedBox(
                                      width: constraints.maxWidth/4,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: const [
                                          Text(
                                            "+ Born to the world 👶",
                                            style: TextStyle(
                                                fontSize: 21.0,
                                                fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 16.0, vertical: 8.0),
                                            child: Text(
                                                "I was born in Parigi - Central Sulawesi , Indonesia."),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Positioned(
                                left: 145,
                                top: 70 + 65,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Padding(
                                      padding: EdgeInsets.symmetric(vertical: 5.0),
                                      child: Text("January 2019"),
                                    ),
                                    const SizedBox(width: 24.0),
                                    SizedBox(
                                      width: constraints.maxWidth/4,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: const [
                                          Text(
                                            "+ Student 💻",
                                            style: TextStyle(
                                                fontSize: 21.0,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 16.0, vertical: 8.0),
                                            child: Text(
                                                "I'm an Informatics Student at University of Muhammadiyah Malang."),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Positioned(
                                left: 171.05,
                                top: 70 + 70 + 65,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Padding(
                                      padding: EdgeInsets.symmetric(vertical: 5.0),
                                      child: Text("Juli 2020"),
                                    ),
                                    const SizedBox(width: 24.0),
                                    SizedBox(
                                      width: constraints.maxWidth/3.8,
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: const [
                                          Text(
                                            "+ Laboratory Assistant",
                                            style: TextStyle(
                                                fontSize: 21.0,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                                            child: Text(
                                              "I'm join asisten lab in Infotech UMM. Besides helping with practicum, I also do several projects (mobile & web) with other assistants.",
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 2.0),
                                            child: Text(
                                              "Position : ",
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.symmetric(horizontal: 16.0),
                                            child: Text(
                                              "- Member of Information System Division",
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.symmetric(horizontal: 16.0),
                                            child: Text(
                                              "- Member of Infotech Research Division",
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Positioned(
                                left: 171.05,
                                top: 70 + 70 + 70 + 145,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.symmetric(vertical: 5.0),
                                      child: const Text("Mei 2021"),
                                    ),
                                    const SizedBox(width: 24.0),
                                    SizedBox(
                                      width: constraints.maxWidth/4,
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: const [
                                          Text(
                                            "+ Build Community",
                                            style: TextStyle(
                                                fontSize: 21.0,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 16.0, vertical: 8.0),
                                            child: Text(
                                              "I built a Developer Community at UMM and became the Community Leader.",
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const Expanded(child: SizedBox.expand())
                            ],
                          ),
                        ],
                      ),
                    ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  Padding _button(IconData icon, Function() onPressed) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 11.0),
      child: TextButton(
        onPressed: onPressed,
        child: Icon(icon, size: 36),
        style: TextButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          backgroundColor: Colors.transparent,
          primary: Colors.white,
        ),
      ),
    );
  }
}
