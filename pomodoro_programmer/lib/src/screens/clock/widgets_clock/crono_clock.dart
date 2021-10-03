import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class BuildCrono extends StatelessWidget {
  const BuildCrono({
    Key? key,
    required this.percent,
    required this.timeInMinute,
    required this.sec,
  }) : super(key: key);

  final double percent;
  final int timeInMinute;
  final int sec;

  @override
  Widget build(BuildContext context) {
    return  Center(
      child: CircularPercentIndicator(
          backgroundColor: Color(0xff1dbfcc),
          percent: percent,
          animation: true,
          animateFromLastPercent: true,
          radius: 250.0,
          lineWidth: 20.0,
          progressColor: Color(0xfff94138),
          center: Text(
            '${timeInMinute-1}:'+'$sec',
            style: TextStyle(
              color: Colors.white,
              fontSize: 70.0,
              fontWeight: FontWeight.bold
            ),
            ),

      
                 ),
    );
  }
}