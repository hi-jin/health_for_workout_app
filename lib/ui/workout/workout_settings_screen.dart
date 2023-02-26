import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:health_for_workout/ui/widgets/full_width_card_widget.dart';
import 'package:health_for_workout/ui/widgets/simple_button.dart';
import 'package:health_for_workout/ui/workout/workout_recording_screen.dart';

class WorkoutSettingsScreen extends StatefulWidget {
  const WorkoutSettingsScreen({super.key});

  @override
  State<WorkoutSettingsScreen> createState() => _WorkoutSettingsScreenState();
}

class _WorkoutSettingsScreenState extends State<WorkoutSettingsScreen> {
  final minutesController = TextEditingController();
  final secondsController = TextEditingController();

  bool timerSelected = false;
  bool screentimeSelected = false;
  bool breaktimeSelected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('헬생')),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const SizedBox(height: 30),
              GestureDetector(
                onTap: () => setState(() => timerSelected = !timerSelected),
                child: FullWidthCardWidget(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Icon(FontAwesomeIcons.clock),
                                    const SizedBox(width: 10),
                                    Expanded(child: Text('휴식 타이머 선택', style: TextStyle(fontSize: 18))),
                                  ],
                                ),
                                const SizedBox(height: 5),
                                Text('- 휴식 시간을 효율적으로 관리할 수 있습니다.'),
                              ],
                            ),
                          ),
                          Switch(
                            value: timerSelected,
                            onChanged: (val) {
                              setState(() => timerSelected = val);
                            },
                          ),
                        ],
                      ),
                      if (timerSelected) const SizedBox(height: 20),
                      if (timerSelected)
                        Row(
                          children: [
                            Text('휴식 시간 : ', style: TextStyle(fontSize: 18)),
                            const SizedBox(width: 20),
                            Expanded(
                              child: TextField(
                                controller: minutesController,
                                textAlign: TextAlign.right,
                                keyboardType: TextInputType.number,
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly,
                                ],
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
                                ),
                              ),
                            ),
                            const SizedBox(width: 10),
                            Text('분', style: TextStyle(fontSize: 18)),
                            const SizedBox(width: 20),
                            Expanded(
                              child: TextField(
                                controller: secondsController,
                                textAlign: TextAlign.right,
                                keyboardType: TextInputType.number,
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly,
                                ],
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
                                ),
                              ),
                            ),
                            const SizedBox(width: 10),
                            Text('초', style: TextStyle(fontSize: 18)),
                          ],
                        ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              GestureDetector(
                onTap: () => setState(() => screentimeSelected =!screentimeSelected),
                child: FullWidthCardWidget(
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Icon(FontAwesomeIcons.mobileScreen),
                                const SizedBox(width: 10),
                                Expanded(child: Text('스크린타임 기록하기', style: TextStyle(fontSize: 18))),
                              ],
                            ),
                            const SizedBox(height: 5),
                            Text('- 운동에 온전히 집중한 시간을 기록합니다.'),
                          ],
                        ),
                      ),
                      Switch(
                        value: screentimeSelected,
                        onChanged: (val) {
                          setState(() => screentimeSelected = val);
                        },
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              GestureDetector(
                onTap: () => setState(() => breaktimeSelected =!breaktimeSelected),
                child: FullWidthCardWidget(
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Icon(FontAwesomeIcons.userClock),
                                const SizedBox(width: 15),
                                Expanded(child: Text('휴식 시간 기록하기', style: TextStyle(fontSize: 18))),
                              ],
                            ),
                            const SizedBox(height: 5),
                            Text('- 휴식한 시간을 운동 기록에 저장합니다.'),
                            Text('- \'통계 보기\' 메뉴에서 확인할 수 있습니다.'),
                          ],
                        ),
                      ),
                      Switch(
                        value: breaktimeSelected,
                        onChanged: (val) {
                          setState(() => breaktimeSelected = val);
                        },
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 40),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: SimpleButton(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => WorkoutRecordingScreen()));
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text('운동 시작', style: TextStyle(fontSize: 20)),
                      const SizedBox(width: 10),
                      Icon(FontAwesomeIcons.dumbbell),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
