import 'package:flutter/material.dart';
import 'package:mview/ui_models/timer_view_model.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  String _formatTime(seconds) {
    var duration = Duration(seconds: seconds);
    // return duration.toString();
    return duration.toString().split(".").first.substring(2);
  }

  @override
  Widget build(BuildContext context) {
    // context.select((value) => null);
    // context.watch();
    // context.read();

    var strTimer = context.select<TimerViewModel, String>(
      (value) => _formatTime(value.timerDto.timer),
    );
    var timerRun = context.select<TimerViewModel, bool>(
      (value) => value.timerDto.timerRun,
    );

    var onPressed = context.select<TimerViewModel, Function()>(
      (value) => value.onPressed,
    );

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: TimerText(strTimer: strTimer),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterFloat,
      floatingActionButton: SizedBox(
          width: 100,
          height: 100,
          child: FloatingActionButton(
            // shape: const CircleBorder(),
            onPressed: onPressed,
            backgroundColor: Colors.white38,
            isExtended: true,
            child: Icon(
              timerRun ? Icons.pause_circle_filled : Icons.play_arrow_rounded,
              size: 60,
              color: Colors.black,
            ),
          )),
    );
  }
}

/// 기존의 코드에서 Widget 을 분리하는 방법 3가지가 있다.
/// 1. 변수 type 으로 변화하기
/// 2. 함수 type 으로 변화하기
/// 3. class type 으로 변환하기

class TimerText extends StatelessWidget {
  const TimerText({
    super.key,
    required this.strTimer,
  });

  final String strTimer;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          Text(
            strTimer,
            style: TextStyle(
                fontSize: 80,
                fontWeight: FontWeight.w900,
                foreground: Paint()
                  ..style = PaintingStyle.stroke
                  ..strokeWidth = 5
                  ..color = Colors.blue),
          ),
          Text(
            strTimer,
            style: const TextStyle(
                fontSize: 80, fontWeight: FontWeight.w900, color: Colors.amber),
          ),
          // IconButton(
          //     onPressed: onPressed,
          //     icon: timerRun
          //         ? const Icon(Icons.stop_circle)
          //         : const Icon(Icons.play_circle_fill))
        ],
      ),
    );
  }
}
