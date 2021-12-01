import 'package:flutter/material.dart';

class ButtonTopNav extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;

  const ButtonTopNav({Key? key, required this.title, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        padding: const EdgeInsets.all(22.0),
      ),
      onPressed: onPressed,
      child: Text(
        title,
        style: Theme.of(context).textTheme.subtitle1?.copyWith(
          fontSize: 20.0,
        ),
      ),
    );
  }
}
