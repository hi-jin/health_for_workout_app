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
  final _minutesController = TextEditingController();
  final _secondsController = TextEditingController();
  final _timerSwitchWidgetController = _SwitchButtonWithDescController();
  final _screentimeSwitchWidgetController = _SwitchButtonWithDescController();
  final _breaktimeSwitchWidgetController = _SwitchButtonWithDescController();

  bool _timerSelected = false;

  void _timerSwitchControllerListenerCallback() {
    setState(() {
      _timerSelected = _timerSwitchWidgetController.selected;
    });
  }

  @override
  void initState() {
    super.initState();
    _timerSwitchWidgetController.addListener(_timerSwitchControllerListenerCallback);
  }

  @override
  void dispose() {
    _timerSwitchWidgetController.removeListener(_timerSwitchControllerListenerCallback);
    super.dispose();
  }

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
              _SwitchButtonWithDesc(
                controller: _timerSwitchWidgetController,
                icon: const Icon(FontAwesomeIcons.clock),
                title: '휴식 타이머 선택',
                subTitles: ['- 휴식 시간을 효율적으로 관리할 수 있습니다.'],
              ),
              if (_timerSelected)
                _TimerDetailInputWidget(
                  text: '휴식 시간',
                  minutesController: _minutesController,
                  secondsController: _secondsController,
                ),
              const SizedBox(height: 20),
              _SwitchButtonWithDesc(
                controller: _screentimeSwitchWidgetController,
                icon: const Icon(FontAwesomeIcons.mobileScreen),
                title: '스크린타임 기록하기',
                subTitles: ['- 운동에 온전히 집중한 시간을 기록합니다.'],
              ),
              const SizedBox(height: 20),
              _SwitchButtonWithDesc(
                controller: _breaktimeSwitchWidgetController,
                icon: const Icon(FontAwesomeIcons.userClock),
                title: '휴식 시간 기록하기',
                subTitles: [
                  '- 휴식한 시간을 운동 기록에 저장합니다.',
                  '- \'통계 보기\' 메뉴에서 확인할 수 있습니다.',
                ],
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

class _TimerDetailInputWidget extends StatelessWidget {
  final String text;
  final TextEditingController minutesController;
  final TextEditingController secondsController;

  const _TimerDetailInputWidget({
    super.key,
    required this.text,
    required this.minutesController,
    required this.secondsController,
  });

  @override
  Widget build(BuildContext context) {
    return FullWidthCardWidget(
      child: Row(
        children: [
          Text('${text} : ', style: TextStyle(fontSize: 18)),
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
    );
  }
}

class _SwitchButtonWithDescController extends ChangeNotifier {
  bool _selected = false;

  _SwitchButtonWithDescController() : super();

  bool get selected => _selected;

  void toggleSelectedState() {
    _selected = !_selected;
    notifyListeners();
  }
}

class _SwitchButtonWithDesc extends StatefulWidget {
  const _SwitchButtonWithDesc({
    super.key,
    required this.controller,
    required this.icon,
    required this.title,
    required this.subTitles,
  });

  final _SwitchButtonWithDescController controller;
  final Widget icon;
  final String title;
  final List<String> subTitles;

  @override
  State<_SwitchButtonWithDesc> createState() => __SwitchButtonWithDescState();
}

class __SwitchButtonWithDescState extends State<_SwitchButtonWithDesc> {
  late bool _selected;

  void _controllerListenerCallback() {
    setState(() {
      _selected = widget.controller.selected;
    });
  }

  @override
  void initState() {
    super.initState();
    _selected = widget.controller.selected;
    widget.controller.addListener(_controllerListenerCallback);
  }

  @override
  void dispose() {
    widget.controller.removeListener(_controllerListenerCallback);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => widget.controller.toggleSelectedState(),
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
                      widget.icon,
                      const SizedBox(width: 15),
                      Expanded(child: Text(widget.title, style: TextStyle(fontSize: 18))),
                    ],
                  ),
                  const SizedBox(height: 5),
                  ...widget.subTitles.map((subTitle) => Text(subTitle)),
                ],
              ),
            ),
            Switch(
              value: _selected,
              onChanged: (val) => widget.controller.toggleSelectedState(),
            ),
          ],
        ),
      ),
    );
  }
}
