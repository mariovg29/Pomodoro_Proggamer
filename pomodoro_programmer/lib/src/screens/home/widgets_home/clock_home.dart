import 'package:flutter/material.dart';
import 'package:pomodoro_programmer/src/screens/home/widgets_home/custom_painter_home.dart';


class Clock extends StatefulWidget {
  const Clock({ Key? key }) : super(key: key);

  @override
  _ClockState createState() => _ClockState();
}

class _ClockState extends State<Clock> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 300,
      child: CustomPaint(
        painter: CustomPainter1(),
      ),
      
      
    );
  }
}