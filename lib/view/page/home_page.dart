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
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: constraints.maxWidth /
                      (constraints.maxWidth < 1269 ? 100.0 : 50.5),
                ),
                Column(
                  children: [
                    const Text("Hello,",
                        style: TextStyle(fontWeight: FontWeight.w300)),
                    const SizedBox(height: 8.0),
                    Text("I’m Nur Syahfei",
                        style: Theme.of(context).textTheme.headline2),
                    const SizedBox(height: 8.0),
                    Text(
                      "Flutter Developer, specialized in Mobile.",
                      style: Theme.of(context).textTheme.headline5?.copyWith(fontWeight: FontWeight.w200),
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
                          js.context.callMethod(
                              'open', ['https://www.instagram.com/nursyahfei']);
                        }),
                      ],
                    ),
                  ],
                ),
                if (constraints.maxWidth > 1269)
                  if (constraints.maxHeight > 750)
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
                          Positioned(
                            left: 145,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                ChildHistory(
                                  width: constraints.maxWidth / 3.8,
                                  date: "October 1999",
                                  title: "+ Born to the world 👶",
                                  subtitle: "I was born in Parigi - Central Sulawesi , Indonesia.",
                                ),
                                ChildHistory(
                                  width: constraints.maxWidth / 3.8,
                                  date: "January 2019",
                                  title: "+ Student 💻",
                                  subtitle: "I'm an Informatics Student at University of Muhammadiyah Malang.",
                                ),
                                ChildHistory(
                                  left: 25.5,
                                  width: constraints.maxWidth / 3.8,
                                  date: "Juli 2020",
                                  title: "+ Laboratory Assistant",
                                  subtitle: "I'm join asisten lab in Infotech UMM. Besides helping with practicum, I also do several projects (mobile & web) with other assistants.",
                                  textChild: const [
                                    "Position : ",
                                    "- Member of Information System Division",
                                    "- Member of Infotech Research Division",
                                  ],
                                ),
                                ChildHistory(
                                  left: 4.5,
                                  width: constraints.maxWidth / 4,
                                  date: "Mei 2021",
                                  title: "+ Build Community",
                                  subtitle: "I built a Developer Community at UMM and became the Community Leader.",
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
              ],
            ),
          ],
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

class ChildHistory extends StatelessWidget {
  final String title, date;
  final String subtitle;
  final List<String>? textChild;
  final double width;
  final double? left;

  const ChildHistory(
      {Key? key,
      required this.title,
      required this.subtitle,
      required this.width,
      required this.date,
        this.textChild,
        this.left,
      }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
         SizedBox(width: left ?? 0),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 5.0),
          child: Text(date),
        ),
        const SizedBox(width: 24.0),
        SizedBox(
          width: width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(fontSize: 21.0, fontWeight: FontWeight.bold),
              ),
              Padding(
                child: Text(subtitle),
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              ),
              if (textChild != null)
                for (String item in textChild!)
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 2.0),
                    child: Text(item),
                  ),
              const SizedBox(height: 9.0)
            ],
          ),
        ),
      ],
    );
  }
}
