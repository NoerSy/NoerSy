import 'package:flutter/material.dart';
import 'package:myprofile_flutter/view/page/featured_page.dart';
import 'package:myprofile_flutter/view/page/home_page.dart';
import 'package:myprofile_flutter/view/widget/button_topnav.dart';
import 'package:myprofile_flutter/view/widget/child_dasboard.dart';
import 'package:myprofile_flutter/view/widget/dashboard.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  final PageController _pageController = PageController();
  int _index = 0;

  void setTo(int index) {
    setState(() {
      _index = index;
      _pageController.animateToPage(index,
          duration: const Duration(seconds: 2), curve: Curves.ease);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Dashboard(
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
      ],
    );
  }
}
