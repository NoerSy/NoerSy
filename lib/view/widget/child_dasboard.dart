import 'package:flutter/cupertino.dart';

class ChildDashboard extends StatelessWidget {
  final int index;
  final int current;
  final Widget child;
  const ChildDashboard({Key? key, required this.index, required this.child, required this.current}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      duration: current == index ? Duration(seconds: 2) : Duration(milliseconds: 600),
      opacity: current == index ? 1 : 0,
      child: child,
    );
  }
}
