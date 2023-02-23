import 'package:flutter/material.dart';
import 'package:health_for_workout/ui/utils/date.dart';

enum DateStatus {
  success,
  failure,
}

class DateStatusCard extends StatelessWidget {
  const DateStatusCard({super.key, required this.date, required this.status});

  final DateTime date;
  final DateStatus status;

  @override
  Widget build(BuildContext context) {
    final dayOfWeek = convertWeekdayToString(date.weekday);
    final dayOfMonth = date.day;

    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 12),
      color: status == DateStatus.success ? Colors.green : Colors.grey,
      child: Column(
        children: [
          Text('$dayOfWeek', style: TextStyle(color: Colors.white, fontSize: 20)),
          Text('$dayOfMonth', style: TextStyle(color: Colors.white, fontSize: 20)),
        ],
      ),
    );
  }
}
