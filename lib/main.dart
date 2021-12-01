import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:myprofile_flutter/view/page/dashboard_page.dart';
import 'package:universal_html/html.dart' as html;
import 'package:url_strategy/url_strategy.dart';

void main() {
  setPathUrlStrategy();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _opacity = false;
  final loader = html.document.getElementsByClassName('loader-wrapper');

  void display() {
    Future.delayed(
      const Duration(milliseconds: 1),
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
          duration: const Duration(milliseconds: 600),
          opacity: _opacity ? 1 : 0,
          child: const DashboardPage(),
        ),
      ),
      theme: ThemeData.dark(),
    );
  }
}
