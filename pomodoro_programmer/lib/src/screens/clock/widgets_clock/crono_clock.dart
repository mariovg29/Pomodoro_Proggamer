import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class BuildCrono extends StatelessWidget {
  const BuildCrono({
    Key? key,
    required this.percent,
    required this.timeInMinute,
    required this.sec,
    required this.textMood
    
  }) : super(key: key);

  final double percent;
  final int timeInMinute;
  final int sec;
  final String textMood;

  @override
  Widget build(BuildContext context) {
    return  Center(
      child: CircularPercentIndicator(
          backgroundColor:Color(0xff35425e),          
          //Color(0xff1dbfcc),
          percent: percent,
          animation: true,
          animateFromLastPercent: true,
          radius: 240.0,
          lineWidth: 20.0,
          progressColor: Color(0xfff94138),
          center: Column(
           
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '${timeInMinute-1}:'+'$sec',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 63.0,
                  fontWeight: FontWeight.bold
                ),
                ),
                Text(textMood,
                style: TextStyle(
                  color:Colors.blue,
                  fontSize: 35,
                  fontWeight: FontWeight.bold
                ))

            ],
          ),

      
                 ),
    );
  }
}