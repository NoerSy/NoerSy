import 'package:flutter/material.dart';
import 'package:myprofile_flutter/theme/platecolor.dart';
import 'package:myprofile_flutter/view/widget/button_topnav.dart';
import 'package:myprofile_flutter/view/widget/child_dasboard.dart';

class Dashboard extends StatefulWidget {
  final List<ButtonTopNav> topNav;
  final List<ChildDashboard> children;
  final PageController pageController;
  final int current;

  const Dashboard({
    Key? key,
    required this.topNav,
    required this.children,
    required this.pageController,
    required this.current,
  }) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  bool _isOpen = false;
  bool _isWade = false;
  int _duration = 200;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        if (constraints.maxWidth > 930) {
          _isWade = true;
          _isOpen = false;
        }
        if (constraints.maxWidth < 930) _isWade = false;
        return Stack(
          alignment: Alignment.center,
          children: [
            PageView(
              scrollDirection: Axis.vertical,
              controller: widget.pageController,
              children: widget.children,
            ),
            if (constraints.maxWidth > 930)
              Positioned(
                width: 1000,
                height: 90,
                top: 20,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: widget.topNav,
                ),
              )
            else
              Positioned(
                width: 1000,
                height: 90,
                top: 20,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      constraints: constraints,
                      padding: const EdgeInsets.all(8.0),
                      child: widget.topNav[widget.current]..onSmall = openNav,
                    )
                  ],
                ),
              ),
            Positioned(
              top: 100,
              child: AnimatedOpacity(
                duration: Duration(milliseconds: _duration),
                opacity: _isOpen ? 1 : 0,
                child: Column(
                  children: [
                    for (ButtonTopNav item in widget.topNav)
                      if (item.index != widget.current)
                        Container(
                          margin: const EdgeInsets.all(4.0),
                          decoration: BoxDecoration(
                            color: Platecolor.bg3,
                            boxShadow: [
                              BoxShadow(
                                color: Platecolor.bg2.withOpacity(0.05),
                                spreadRadius: 1,
                              ),
                              BoxShadow(
                                color: Platecolor.bg2.withOpacity(0.02),
                                spreadRadius: 2,
                              )
                            ],
                            borderRadius: BorderRadius.circular(7.0),
                          ),
                          child: item..onSmall = navTO,
                        )
                  ],
                ),
              ),
            ),
            Positioned(bottom: 100, child: Text("${constraints.maxWidth}")),
          ],
        );
      },
    );
  }

  void navTO() {
    if (mounted && !_isWade) {
      _duration = 0;
      setState(() => _isOpen = false);
    }
  }

  void openNav() {
    if (mounted && !_isWade) {
      _duration = 200;
      if (_isOpen) {
        setState(() => _isOpen = false);
      } else {
        setState(() => _isOpen = true);
      }
    }
  }
}
