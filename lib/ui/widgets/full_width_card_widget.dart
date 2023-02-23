import 'package:flutter/material.dart';
import 'package:health_for_workout/core/style.dart';

class FullWidthCardWidget extends StatelessWidget {
  const FullWidthCardWidget({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      width: double.infinity,
      color: MyColors.lightBlack,
      child: child,
    );
  }
}
