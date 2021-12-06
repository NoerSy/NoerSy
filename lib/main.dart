import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:myprofile_flutter/view/page/ajari_privacy_page.dart';
import 'package:myprofile_flutter/view/page/dashboard_page.dart';
import 'package:myprofile_flutter/view/page/featured_page.dart';
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
  final loader = html.document.getElementsByClassName('loader-wrapper');

  @override
  void initState() {
    if (loader.isNotEmpty) {
      loader.first.remove();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Nur Syahfei',
      initialRoute: '/dashboard',
      routes:  {
        "/dashboard" : (context) => const DashboardPage(),
        "/ajari-privacy" : (context) => const AjariPrivacyPage(),
      },
      theme: ThemeData.dark(),
    );
  }
}
