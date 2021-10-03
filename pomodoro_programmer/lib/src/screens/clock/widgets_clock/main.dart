import 'package:flutter/material.dart';
import 'package:pomodoro_programmer/src/screens/clock/widgets_clock/boton_clock.dart';
import 'package:pomodoro_programmer/src/screens/clock/widgets_clock/break_work_.dart';
import 'package:pomodoro_programmer/src/screens/clock/widgets_clock/crono_clock.dart';
import 'package:pomodoro_programmer/src/screens/clock/widgets_clock/header_clock.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({ Key? key }) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          children: [
            Container(
              height: 100,
              width: double.infinity,
              child:
               Header(text: 'Pomodoro Clock'),
              
              ),
              Container(
                height: 300,
                width: double.infinity,
                child:
                BuildCrono(percent: 0, timeInMinute: 10, sec: 00),
              ),
              Expanded(child: Container(width: double.infinity,)),
              Container(
                height: 310,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Color(0xff35425e),
                   borderRadius: BorderRadius.only(
                     topLeft: Radius.circular(30),
                     topRight: Radius.circular(30),                  
                ),
              ),
              child: Column(
                children: [
                  Row(
                    children:[
                      WorkBreakButtons(time: 25,text: 'Work Time', icon: Icons.keyboard_arrow_down,),
                      Expanded(child: Container(width: double.infinity,)),
                      WorkBreakButtons(time: 5,text: 'Break Time',icon: Icons.keyboard_arrow_down, ),
                    ]
                   
                  ),
                  Row(                    
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    
                    children: [
                      BotonStart(
                        onPressed: ()=>{}, 
                        textBtn: 'Resume',
                        color:Color(0xff0f50e9),
                        icon: Icons.restart_alt), 
                                           
                      BotonStart(
                        onPressed: ()=>{}, 
                        textBtn: 'Stop',
                        color:Color(0xfff94138),
                        icon: Icons.stop_circle
                        ),
                        BotonStart(
                        onPressed: ()=>{}, 
                        textBtn: 'Start',
                        color:Color(0xff1dbfcc),
                        icon: Icons.play_circle
                        ),
                    ],
                    
                  ),
                  
                ],
              ),
              
              )
              
            
          ],
        ),

      ),
      
    );
  }
}