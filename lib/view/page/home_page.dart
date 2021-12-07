import 'dart:js' as js;

import 'package:flutter/material.dart';
import 'package:myprofile_flutter/theme/costume_icons.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Hello,",
          style: Theme.of(context)
              .textTheme
              .headline6
              ?.copyWith(fontWeight: FontWeight.w300),
        ),
        const SizedBox(height: 8.0),
        Text("I’m Nur Syahfei", style: Theme.of(context).textTheme.headline2),
        const SizedBox(height: 8.0),
        Text(
          "Flutter Developer, specialized in Mobile.",
          style: Theme.of(context)
              .textTheme
              .headline5
              ?.copyWith(fontWeight: FontWeight.w200),
        ),
        const SizedBox(height: 32.0),
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
        )
      ],
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
