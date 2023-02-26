import 'package:flutter/material.dart';
import 'package:health_for_workout/core/style.dart';
import 'package:health_for_workout/ui/widgets/full_width_button.dart';
import 'package:health_for_workout/ui/widgets/full_width_card_widget.dart';

class WorkoutRecordingScreen extends StatefulWidget {
  const WorkoutRecordingScreen({super.key});

  @override
  State<WorkoutRecordingScreen> createState() => _WorkoutRecordingScreenState();
}

class _WorkoutRecordingScreenState extends State<WorkoutRecordingScreen> {
  bool isPlaying = true;

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final DateTime? workoutStartedAt = DateTime(now.year, now.month, now.day, now.hour, now.minute - 32, now.second - 11);
    final DateTime? currentSetStartedAt = DateTime(now.year, now.month, now.day, now.hour, now.minute - 1, now.second - 3);

    final tempWorkoutRecordData = [
      ['랫 풀 다운', 80, 10],
      ['랫 풀 다운', 80, 10],
      ['랫 풀 다운', 80, 10],
      ['벤치프레스', 80, 12],
      ['벤치프레스', 80, 12],
      ['벤치프레스', 80, 12],
      ['풀업', 10, 6],
      ['풀업', 10, 6],
      ['풀업', 10, 6],
      ['풀업', 10, 6],
      ['풀업', 10, 6],
    ];

    return Scaffold(
      appBar: AppBar(title: Text('헬생')),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        FullWidthCardWidget(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text('총 운동 시간', style: TextStyle(fontSize: 18)),
                              if (workoutStartedAt != null)
                                Text(
                                  '${now.difference(workoutStartedAt).inMinutes}분 ${now.difference(workoutStartedAt).inSeconds % 60}초',
                                  style: TextStyle(fontSize: 20),
                                ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 10),
                        FullWidthCardWidget(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text('현재 세트', style: TextStyle(fontSize: 18)),
                              if (currentSetStartedAt != null)
                                Text(
                                  '${now.difference(currentSetStartedAt).inMinutes}분 ${now.difference(currentSetStartedAt).inSeconds % 60}초',
                                  style: TextStyle(fontSize: 20),
                                ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TextField(
                          decoration: InputDecoration(
                            labelText: '운동 종목 입력',
                            border: OutlineInputBorder(),
                            focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
                          ),
                        ),
                        const SizedBox(height: 10),
                        TextField(
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            labelText: '무게 입력 (kg)',
                            border: OutlineInputBorder(),
                            focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
                          ),
                        ),
                        const SizedBox(height: 10),
                        FullWidthButton(
                          onTap: () {},
                          child: Text(
                            (isPlaying) ? '세트 종료' : '세트 시작',
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Expanded(
                child: ListView.builder(
                  itemCount: tempWorkoutRecordData.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: _WorkoutRecord(
                        workoutName: tempWorkoutRecordData[index][0] as String,
                        weight: tempWorkoutRecordData[index][1] as int,
                        reps: tempWorkoutRecordData[index][2] as int,
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 10),
              FullWidthButton(
                onTap: () {},
                color: Colors.red,
                child: Text(
                  '운동 종료',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _WorkoutRecord extends StatelessWidget {
  const _WorkoutRecord({super.key, required this.workoutName, required this.weight, required this.reps});

  final String workoutName;
  final int weight;
  final int reps;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      color: MyColors.lightBlack,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(workoutName, style: TextStyle(fontSize: 16)),
              Text('${weight}kg', style: TextStyle(fontSize: 16)),
            ],
          ),
          Text('${reps}회', style: TextStyle(fontSize: 18)),
        ],
      ),
    );
  }
}
