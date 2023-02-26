import 'package:flutter/material.dart';

class FullWidthButton extends StatelessWidget {
  const FullWidthButton({super.key, required this.onTap, required this.child, this.color});

  final void Function()? onTap;
  final Widget child;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Ink(
        decoration: BoxDecoration(
          color: color ?? Colors.white24,
          borderRadius: BorderRadius.all(Radius.circular(5)),
        ),
        child: Container(
          padding: EdgeInsets.all(20),
          width: double.infinity,
          child: child,
        ),
      ),
    );
  }
}
