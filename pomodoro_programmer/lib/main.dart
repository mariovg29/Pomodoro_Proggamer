import 'package:flutter/material.dart';
import 'package:pomodoro_programmer/src/routes/routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({ key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "PomodoroProgramming",
      debugShowCheckedModeBanner: false,
      initialRoute: 'introduction',
      routes: getApplicationRoutes(),
      
    );
  }
}

