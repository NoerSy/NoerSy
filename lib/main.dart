import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:myprofile_flutter/view/main_page/dashboard_page.dart';
import 'package:universal_html/html.dart' as html;
import 'package:url_strategy/url_strategy.dart';

void main() {
  setPathUrlStrategy();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _opacity = false;
  final loader = html.document.getElementsByClassName('loader-wrapper');

  void display() {
    Future.delayed(
      Duration(milliseconds: 1),
      () => setState(() {
        _opacity = true;
      }),
    );
  }

  @override
  void initState() {
    if (loader.isNotEmpty) {
      loader.first.remove();
      display();
    }
    if (kDebugMode) _opacity = true;
      super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Nur Syahfei',
      home: Scaffold(
        backgroundColor: Colors.transparent,
        body: AnimatedOpacity(
          duration: Duration(milliseconds: 600),
          opacity: _opacity ? 1 : 0,
          child: DashboardPage(),
        ),
      ),
      theme: ThemeData.dark(),
    );
  }
}
