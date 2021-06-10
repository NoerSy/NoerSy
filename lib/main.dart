import 'package:flutter/material.dart';
import 'package:myprofile_flutter/view/MainPage/MainPage.dart';
import 'package:url_strategy/url_strategy.dart';

void main() {
  setPathUrlStrategy();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Nur Syahfei',
      home: MainPage(),
    );
  }
}