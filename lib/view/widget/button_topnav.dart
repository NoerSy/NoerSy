import 'package:flutter/material.dart';

class ButtonTopNav extends StatelessWidget {
  final String title;
  final int index;
  final int current;
  final VoidCallback onPressed;
  VoidCallback? onSmall;
  double? width;

  ButtonTopNav({
    Key? key,
    required this.title,
    required this.onPressed,
    required this.index,
    required this.current,
    this.onSmall,
    this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(7.0),
        color: index != current
            ? Colors.transparent
            : Colors.white.withOpacity(0.05),
      ),
      child: TextButton(
        style: TextButton.styleFrom(
          primary: Colors.white,
          padding: const EdgeInsets.all(22.0),
        ),
        onPressed: () {
          onPressed.call();
          if (onSmall != null) onSmall!.call();
        },
        child: AnimatedContainer(
          width: width,
          height: 25,
          duration: const Duration(milliseconds: 500),
          child: Text(
            title,
            style:
                Theme.of(context).textTheme.subtitle1?.copyWith(fontSize: 20.0),
          ),
        ),
      ),
    );
  }
}
