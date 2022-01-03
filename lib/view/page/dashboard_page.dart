import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:myprofile_flutter/view/page/featured2_page.dart';
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
  final ValueNotifier<int?> _topButtonWidth = ValueNotifier(null);

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
    return AnimatedOpacity(
      duration: const Duration(milliseconds: 600),
      opacity: _opacity ? 1 : 0,
      child: NotificationListener(
        onNotification: (ScrollEndNotification notification) {
          setState(() => _index = _pageController.page?.round() ?? _index);
          return notification.dragDetails != null ? false : true;
        },
        child: Dashboard(
          current: _index,
          pageController: _pageController,
          topNav: [
            ButtonTopNav(
              index: 0,
              title: "#Home",
              current: _index,
              onPressed: () => setTo(0),
            ),
            ButtonTopNav(
              index: 1,
              title: "#Featured_Works",
              current: _index,
              onPressed: () => setTo(1),
            ),
            ButtonTopNav(
              index: 2,
              title: "#Playground",
              current: _index,
              onPressed: () => setTo(2),
            ),
            ButtonTopNav(
              index: 3,
              title: "#About",
              current: _index,
              onPressed: () => setTo(3),
            ),
            ButtonTopNav(
              index: 4,
              title: "#Contact",
              current: _index,
              onPressed: () => setTo(4),
            ),
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
              child: const Featured2Page(),
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
