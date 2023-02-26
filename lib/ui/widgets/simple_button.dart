import 'package:flutter/material.dart';

class SimpleButton extends StatelessWidget {
  const SimpleButton({super.key, required this.onTap, required this.child});

  final void Function()? onTap;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Ink(
        decoration: BoxDecoration(
          color: Colors.white24,
          borderRadius: BorderRadius.all(Radius.circular(5)),
        ),
        child: Container(
          padding: EdgeInsets.all(15),
          child: child,
        ),
      ),
    );
  }
}
