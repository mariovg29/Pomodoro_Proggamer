import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pomodoro_programmer/src/screens/clock/widgets_clock/boton_clock.dart';
import 'package:pomodoro_programmer/src/screens/clock/widgets_clock/crono_clock.dart';
import 'package:pomodoro_programmer/src/screens/clock/widgets_clock/header_clock.dart';

class ClocScreen extends StatefulWidget {
  

  // final int tiimeinMinute;
  // final int timeinSec;

  const ClocScreen({ Key? key, 
  // required this.tiimeinMinute, 
  // required this.timeinSec 
  }) : super(key: key);

  @override
  _ClocScreenState createState() => _ClocScreenState();
}

class _ClocScreenState extends State<ClocScreen> {

double percent=0;
static int timeInMinute =10;
static int sec= 59;
int timeInSec= timeInMinute*60;
Timer? timer;
String textMood='';


// double breakpercent=0;
 static int breaktimeInMinute =5;
// static int breaksec= 59;
// int breaktimeInSec= timeInMinute*59;
// Timer? breaktimer;





  @override
  Widget build(BuildContext context) {
    
    var textStyle = TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.bold,
      fontSize: 25.0,
      );
    var boxDecoration = BoxDecoration(
      gradient: LinearGradient(
        //begin:Alignment.bottomCenter,
        colors: [
          Color(0xff0f50e9),
          // Color(0x00109bfb),
          // Color(0xff1dbfcc),
          Color(0xff1dbfcc)
          
          ]),
      borderRadius: BorderRadius.circular(20)
                                    );
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            color: Colors.black,
            
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Header(text: 'Pomodoro Clock',),
              BuildCrono(percent: percent, timeInMinute: timeInMinute, sec: sec,textMood: textMood),
              SizedBox(height: 30.0,),
               _fondoBotones(boxDecoration, textStyle),
                  

                

            ],
          ),
          
        ),

      ),
      
    );
  }

  Expanded _fondoBotones(BoxDecoration boxDecoration, TextStyle textStyle) {
    return Expanded(
               child: Container(
                 width: double.infinity,
                 decoration: BoxDecoration(
                   color: Color(0xff35425e),
                   borderRadius: BorderRadius.only(
                     topLeft: Radius.circular(30),
                     topRight: Radius.circular(30),
                     

                   )
                 ),
                 child: Padding(
                   padding: EdgeInsets.only(top: 30, left: 20.0, right: 20.0),
                   child: Column(
                     children: <Widget>[
                     Expanded(
                       child:
                        Row(
                          children:<Widget> [

                            _buildWorkButton(boxDecoration, textStyle),
                            SizedBox(width: 10),
                            _buildbreakButton(boxDecoration, textStyle),
                            
                            
                          ],
                        ),
                        
                        
                        ),
                        SizedBox(height: 40),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 28.0),
                          child:
                           BotonStart(
                             textBtn: 'Start',
                             onPressed: ()=>_startTimer(),
                             )
                          )
                    
                        
                   ],
                   ),
                   ),
                   

               )
               );
  }

  Expanded _buildWorkButton(BoxDecoration boxDecoration, TextStyle textStyle) {
    return Expanded(
                              
                              child: GestureDetector(
                                onTap: (){
                                  print('work');
                                },
                                child: Container(
                                  decoration: boxDecoration,
                                  child: Column(                                  
                                    children: [
                                      SizedBox(height: 10),
                                      Text('Work Time',
                                      style: textStyle,
                                      ),
                                      SizedBox(height: 10),
                                       Text('25 min',
                                      style: textStyle
                                      ),
                                      Icon(
                                          Icons.keyboard_arrow_down,
                                          size: 50,
                                          color: Colors.white,
                                          ),
                                      
                                      //SizedBox(height: 10,),
                                    ],
                                  ),
                                ),
                              ),
                            );
  }

  Expanded _buildbreakButton(BoxDecoration boxDecoration, TextStyle textStyle) {
    return Expanded(
      child: GestureDetector(
       onTap: (){
         print('break');
       },
       child: Container(
         decoration: boxDecoration,
         child: Column(                                  
           children: [
             SizedBox(height: 10),
             Text('Break Time',
             style: textStyle,
             ),
             SizedBox(height: 10),
              Text('5 min',
             style: textStyle
             ),
             Icon(
                 Icons.keyboard_arrow_down,
                 size: 50,
                 color: Colors.white,
                 ),
             
             //SizedBox(height: 10,),
           ],
         ),
       ),
     ),
   );
  }

  _startTimer() {
   timeInMinute=5;
   int time= timeInMinute *60;
   double secPercent = (time/100);
   timer= Timer.periodic(Duration(seconds: 1) , (timer) {
     setState(() {
       if(time>0){
         time--;
         if(time % 60 ==0){
         timeInMinute--;
         }if(time % secPercent == 0){
           if(percent<1){
             percent +=0.01;
           }else{
             percent=1;
           }
         }
          if(sec>0){
           sec--;
         }else{
             sec=59;
         }
       }else{
         percent=0;
         
         
         timer.cancel();
         timeInMinute=breaktimeInMinute;
         
         _startbreak();
       }
     });
    });
    print('trabajo');
    
  }

  void _startbreak() {
    timeInMinute=5;
   int time= timeInMinute *60;
   double secPercent = (time/100);
   timer= Timer.periodic(Duration(seconds: 1) , (timer) {
     setState(() {
       if(time>0){
         time--;
         if(time % 60 ==0){
         timeInMinute--;
         }if(time % secPercent == 0){
           if(percent<1){
             percent +=0.01;
           }else{
             percent=1;
           }
         }
          if(sec>0){
           sec--;
         }else{
             sec=59;
         }
       }else{
         percent=0;
         timeInMinute=2;
         
         timer.cancel();
         _startTimer();
       }
     });
    });
    print('descanso');
    
  }
    
  
}



