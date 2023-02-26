import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:health_for_workout/core/style.dart';
import 'package:health_for_workout/ui/utils/date.dart';
import 'package:health_for_workout/ui/widgets/date_status_card.dart';
import 'package:health_for_workout/ui/widgets/full_width_button.dart';
import 'package:health_for_workout/ui/widgets/full_width_card_widget.dart';
import 'package:health_for_workout/ui/workout/workout_settings_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final daysExercised = 17;
    final recordsOfTheWeek = [
      DateStatus.success,
      DateStatus.failure,
      DateStatus.success,
      DateStatus.success,
      DateStatus.success,
      DateStatus.failure,
      DateStatus.failure,
    ];

    return Scaffold(
      appBar: AppBar(title: Text("헬생")),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
            child: Column(
              children: [
                _DateCountWidget(daysExercised: daysExercised),
                const SizedBox(height: 5),
                Divider(color: Colors.white),
                _RecordsOfTheWeekWidget(recordsOfTheWeek: recordsOfTheWeek),
                const SizedBox(height: 5),
                Divider(color: Colors.white),
                const SizedBox(height: 20),
                FullWidthButton(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => WorkoutSettingsScreen()));
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(FontAwesomeIcons.personRunning),
                      const SizedBox(width: 10),
                      Text(
                        '운동 기록하기',
                        style: TextStyle(fontSize: 22),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                FullWidthButton(
                  onTap: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(FontAwesomeIcons.bowlFood),
                      const SizedBox(width: 10),
                      Text(
                        '식단 기록하기',
                        style: TextStyle(fontSize: 22),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                FullWidthButton(
                  onTap: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(FontAwesomeIcons.bars),
                      const SizedBox(width: 10),
                      Text(
                        '통계 보기',
                        style: TextStyle(fontSize: 22),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _DateCountWidget extends StatelessWidget {
  const _DateCountWidget({super.key, required this.daysExercised});

  final int daysExercised;

  @override
  Widget build(BuildContext context) {
    return FullWidthCardWidget(
      child: Text.rich(
        TextSpan(
          children: [
            TextSpan(text: '운동을 시작한지... '),
            TextSpan(text: 'D+$daysExercised🔥', style: TextStyle(fontSize: 20)),
          ],
        ),
      ),
    );
  }
}

class _RecordsOfTheWeekWidget extends StatelessWidget {
  const _RecordsOfTheWeekWidget({super.key, required this.recordsOfTheWeek});

  final List<DateStatus> recordsOfTheWeek;

  @override
  Widget build(BuildContext context) {
    final today = DateTime.now();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('- 지난 일주일의 기록'),
        const SizedBox(height: 5),
        FullWidthCardWidget(
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                ...List.generate(
                  recordsOfTheWeek.length,
                  (index) => Padding(
                    padding: const EdgeInsets.only(right: 5),
                    child: DateStatusCard(date: getDateNDaysBefore(today, 6 - index), status: recordsOfTheWeek[index]),
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
