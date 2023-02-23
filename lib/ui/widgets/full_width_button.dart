import 'package:flutter/material.dart';
import 'package:health_for_workout/core/style.dart';

class FullWidthButton extends StatelessWidget {
  const FullWidthButton({super.key, required this.onTap, required this.child});

  final void Function()? onTap;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Ink(
        decoration: BoxDecoration(
          color: MyColors.lightBlack,
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
