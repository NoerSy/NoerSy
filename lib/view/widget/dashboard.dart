import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  final List<Widget> topNav;
  final List<Widget> children;
  final PageController pageController;

  const Dashboard({
    Key? key,
    required this.topNav,
    required this.children,
    required this.pageController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        PageView(
          scrollDirection: Axis.vertical,
          controller: pageController,
          children: children,
        ),
        Positioned(
          width: 1000,
          height: 90,
          top: 20,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: topNav,
          ),
        ),
      ],
    );
  }
}
