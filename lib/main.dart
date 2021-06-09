import 'package:flutter/material.dart';
import 'package:myprofile_flutter/view/MainPage/MainPage.dart';

void main() {
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