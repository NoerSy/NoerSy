import 'package:flutter/material.dart';

class ButtonTopNav extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  final int index;
  final int current;

  const ButtonTopNav({
    Key? key,
    required this.title,
    required this.onPressed,
    required this.index,
    required this.current,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(7.0),
        color: index != current ? Colors.transparent : Colors.white.withOpacity(0.05),
      ),
      child: TextButton(
        style: TextButton.styleFrom(
          primary: Colors.white,
          padding: const EdgeInsets.all(22.0),
        ),
        onPressed: onPressed,
        child: Text(
          title,
          style:
              Theme.of(context).textTheme.subtitle1?.copyWith(fontSize: 20.0),
        ),
      ),
    );
  }
}
