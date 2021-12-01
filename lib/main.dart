import 'package:flutter/material.dart';
import 'package:myprofile_flutter/view/main_page/main_page.dart';
import 'package:url_strategy/url_strategy.dart';
import 'package:universal_html/html.dart' as html;

void main() {
  setPathUrlStrategy();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final loader = html.document.getElementsByClassName('loader-wrapper');
    if (loader.isNotEmpty) {
      loader.first.remove();
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Nur Syahfei',
      home: MainPage(),
      theme: ThemeData.dark().copyWith(
        textTheme: TextTheme().copyWith(
            subtitle1: TextStyle(
              fontSize: 20.5
            )
        ),
      ),
    );
  }
}

