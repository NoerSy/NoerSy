import 'package:flutter/cupertino.dart';

class ChildDashboard extends StatefulWidget {
  final int index;
  final int current;
  final Widget child;

  const ChildDashboard(
      {Key? key,
      required this.index,
      required this.child,
      required this.current})
      : super(key: key);

  @override
  State<ChildDashboard> createState() => _ChildDashboardState();
}

class _ChildDashboardState extends State<ChildDashboard> {
  bool _isDisplayed = false;

  void startDelayed() async {
    if (widget.current == widget.index) {
      Future.delayed(const Duration(milliseconds: 600)).then((value) {
        if (mounted) {
          setState(() {
            _isDisplayed = true;
          });
        }
      });
    } else {
      if (mounted) {
        setState(() {
          _isDisplayed = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    startDelayed();
    return AnimatedOpacity(
      duration: const Duration(milliseconds: 600),
      opacity: _isDisplayed ? 1 : 0,
      child: widget.child,
    );
  }
}
