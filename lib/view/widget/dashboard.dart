import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
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
    return GestureDetector(
      onTap: (){
        if(mounted){
          setState(() => _isOpen = false);
        }
      },
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: LayoutBuilder(
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
                Positioned(
                  height: 90.0,
                  top: 8.0,
                  width: constraints.maxWidth,
                  child: AnimatedSwitcher(
                    child: _switchNav(constraints),
                    duration: const Duration(milliseconds: 100),
                    switchInCurve: Curves.fastOutSlowIn,
                    switchOutCurve: Curves.fastOutSlowIn,
                  ),
                ),
                Positioned(
                  top: 100,
                  child: AnimatedOpacity(
                    duration: Duration(milliseconds: _duration),
                    opacity: _isOpen ? 1 : 0,
                    child: Column(
                      children: [
                        if(_isOpen)...[
                          for (ButtonTopNav item in widget.topNav)
                            if (item.index != widget.current)
                              Container(
                                height: 80,
                                width: constraints.maxWidth - 16.0,
                                child: item..onSmall = navTO,
                                decoration: BoxDecoration(
                                  color: Platecolor.bg3.withOpacity(0.9),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                              ),
                          ]
                      ],
                    ),
                  ),
                ),
                if (kDebugMode) ...[
                    Positioned(bottom: 80, child: Text("maxWidth : ${constraints.maxWidth}")),
                    Positioned(bottom: 100, child: Text("maxHigh : ${constraints.maxHeight}")),
                  ]
              ],
            );
          },
        ),
      ),
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

  Widget _switchNav(BoxConstraints constraints) {
    if (constraints.maxWidth > 930) {
      return _topNav(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: widget.topNav,
      );
    } else {
      return _topNav(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        child: Container(
          height: 80,
          constraints: constraints,
          width: constraints.maxWidth,
          margin: const EdgeInsets.all(8.0),
          child: widget.topNav[widget.current]..onSmall = openNav,
        ),
      );
    }
  }

  Widget _topNav({
    required mainAxisAlignment,
    required crossAxisAlignment,
    List<ButtonTopNav>? children,
    Widget? child,
  }) {
    if (children != null) {
      return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisAlignment: mainAxisAlignment,
          crossAxisAlignment: crossAxisAlignment,
          children: children,
        ),
      );
    } else {
      return child ?? const SizedBox.shrink();
    }
  }
}
