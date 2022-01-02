import 'package:flutter/material.dart';
import 'package:myprofile_flutter/theme/text_style.dart';

class Featured2Page extends StatefulWidget {
  const Featured2Page({Key? key}) : super(key: key);

  @override
  _Featured2PageState createState() => _Featured2PageState();
}

class _Featured2PageState extends State<Featured2Page> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 195.0),
        Text("My Recent Work", style: titleStyle),
        const SizedBox(height: 32.0),
        Text(
          "Here are a few projects I've worked on recently.",
          style: captionStyle,
        ),
        const SizedBox(height: 75.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            CardFeature(
              title: "Ajari",
              caption:
                  "Ajari is a mobile-based application created to facilitate the Al-Quran Learning Place (TPQ) for help teachers teach students and students learn read Iqro based on an independent learning process guided by the teacher.",
              type: "assets/images/ajari/",
            ),
            CardFeature(
              title: "title",
              caption: "caption",
              type: "type",
            ),
            CardFeature(
              title: "title",
              caption: "caption",
              type: "type",
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            CardFeature(
              title: "title",
              caption: "caption",
              type: "type",
            ),
            CardFeature(
              title: "title",
              caption: "caption",
              type: "type",
            ),
            CardFeature(
              title: "title",
              caption: "caption",
              type: "type",
            ),
          ],
        )
      ],
    );
  }
}

class CardFeature extends StatefulWidget {
  final String title, caption, type;

  const CardFeature(
      {Key? key,
      required this.title,
      required this.caption,
      required this.type})
      : super(key: key);

  @override
  State<CardFeature> createState() => _CardFeatureState();
}

class _CardFeatureState extends State<CardFeature> {
  bool onHover = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12.0),
      height: 250,
      width: 450,
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.5),
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        onEnter: (value) => setState(() => onHover = !onHover),
        onExit: (value) => setState(() => onHover = !onHover),
        child: !onHover
            ? Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.0),
                ),
              )
            : Container(
                alignment: Alignment.center,
                child: Text(widget.title),
              ),
      ),
    );
  }
}
