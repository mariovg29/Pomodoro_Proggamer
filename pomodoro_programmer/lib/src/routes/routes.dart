

import 'package:flutter/cupertino.dart';
import 'package:pomodoro_programmer/src/screens/clock/clock_screen.dart';
import 'package:pomodoro_programmer/src/screens/clock/widgets_clock/main_clock.dart';
import 'package:pomodoro_programmer/src/screens/home/home.dart';
import 'package:pomodoro_programmer/src/screens/introduction/introduction_screen.dart';


Map<String, WidgetBuilder>getApplicationRoutes(){
  return <String, WidgetBuilder>{
    'home'         : (BuildContext context) => Home(),
    'introduction' : (BuildContext  context) => Introduction(),
    'clock' : (BuildContext  context) => ClocScreen(),
     'main' : (BuildContext  context) => MainScreen(),


  };
}