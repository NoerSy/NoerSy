
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:myprofile_flutter/view/page/featured_page.dart';
import 'package:myprofile_flutter/view/page/home_page.dart';
import 'package:myprofile_flutter/view/widget/button_topnav.dart';
import 'package:myprofile_flutter/view/widget/child_dasboard.dart';
import 'package:myprofile_flutter/view/widget/dashboard.dart';
import 'package:universal_html/html.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  final PageController _pageController = PageController();
  static final loader = document.getElementsByClassName('loader-wrapper');
  int _index = 0;
  bool _opacity = false;

  void setTo(int index) {
    setState(() {
      _index = index;
      _pageController.animateToPage(
        index,
        duration: const Duration(seconds: 2),
        curve: Curves.ease,
      );
    });
  }


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
    }
    display();
    if (kDebugMode) _opacity = true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: AnimatedOpacity(
        duration: const Duration(milliseconds: 600),
        opacity: _opacity ? 1 : 0,
        child: Dashboard(
          pageController: _pageController,
          topNav: [
            ButtonTopNav(title: "#Home", onPressed: () => setTo(0)),
            ButtonTopNav(title: "#Featured_Works", onPressed: () => setTo(1)),
            ButtonTopNav(title: "#Playground", onPressed: () => setTo(2)),
            ButtonTopNav(title: "#About", onPressed: () => setTo(3)),
            ButtonTopNav(title: "#Contact", onPressed: () => setTo(4)),
          ],
          children: [
            ChildDashboard(
              index: 0,
              current: _index,
              child: const HomePage(),
            ),
            ChildDashboard(
              index: 1,
              current: _index,
              child: const FeaturedPage(),
            ),
            ChildDashboard(
              index: 2,
              current: _index,
              child: const Center(child: Text("data")),
            ),
            ChildDashboard(
              index: 3,
              current: _index,
              child: const Center(child: Text("data")),
            ),
            ChildDashboard(
              index: 4,
              current: _index,
              child: const Center(child: Text("data")),
            ),
          ],
        ),
      ),
    );
  }
}
