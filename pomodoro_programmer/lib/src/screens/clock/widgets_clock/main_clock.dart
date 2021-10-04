import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pomodoro_programmer/src/screens/clock/widgets_clock/boton_clock.dart';
import 'package:pomodoro_programmer/src/screens/clock/widgets_clock/break_work_btn.dart';
import 'package:pomodoro_programmer/src/screens/clock/widgets_clock/crono_clock.dart';
import 'package:pomodoro_programmer/src/screens/clock/widgets_clock/header_clock.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({ Key? key }) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}



class _MainScreenState extends State<MainScreen> {

bool play=false;
String textMood='Go!!!';
static const maxSeconds=60;
int seconds=maxSeconds;

Timer? timer;


void resetTimer() =>setState(()=> seconds= maxSeconds);



void startTimer({bool reset= true}){
  if(reset=true){
    resetTimer();

  }
  timer = Timer.periodic(Duration(milliseconds:1), (_) {
    setState(() {
      if(seconds>1){
        play=true;
      seconds--;
      }else{
        _stop(reset: false);
      }
      
    });
    
    
   });

}

  
  

double percent=0;
static int timeInMinute =10;
static int sec= 59;
int timeInSec= timeInMinute*60;
int ciclenumber=0;

//Timer? timer;


// double breakpercent=0;
static int breaktimeInMinute =5;
  
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
                Hero(tag: 1,child: 
                BuildCrono(
                  percent: percent, 
                  timeInMinute: timeInMinute, 
                  sec: sec,
                  textMood: textMood,)),
              ),
              Expanded(child: Container(width: double.infinity,)),
              Hero(
                tag: 2,
                child: Container(
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
                        WorkBreakButtons(time: 5,text: 'Break Time',icon: Icons.keyboard_arrow_down,),
                      ]
                     
                    ),
                    Row(                    
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      
                      children: [
                        
                       
                        
                                             
                        BotonStart(                          
                          onPressed: ()=>{_stop()}, 
                          textBtn: 'Stop',
                          color:play? Colors.red:Colors.black,
                          //Color(0xfff94138),
                          icon: Icons.stop_circle_outlined
                          ),

                          BotonStart(
                          onPressed: (){if(play){timer!.cancel(); _pause();}else{}}, 
                          textBtn:play? 'Pause':'Paused',
                          color:play?Colors.green:Colors.black,
                          //Color(0xff0f50e9),
                          icon: Icons.pause_circle_outline),

                          BotonStart(
                          onPressed: (){
                            
                            if(play){}else{_startTimer();}
                            }
                           
                          , 
                          textBtn:(play)? 'Started': 'Start',
                          color:play?Colors.black:Colors.green,
                          //(play)?Colors.black:Color(0xff1dbfcc),
                          icon:(play)? Icons.play_circle: Icons.play_circle
                          ),
                      ],
                      
                    ),
                    
                  ],
                ),
                
                ),
              )
              
            
          ],
        ),

      ),
      
    );
  }

  _startTimer({bool act=true}) {
    ciclenumber=ciclenumber;
   timeInMinute=3;
   int time= timeInMinute *60;
   double secPercent = (time/100);
   timer= Timer.periodic(Duration(seconds: 1) , (timer) {
     setState(() {
       if(time>1){
         
         play=true;
         textMood='Working';
        
         time--;
         if(time % 60 ==0){
         timeInMinute--;
         }if(time % secPercent == 0){
           if(percent<1 ){
             percent +=0.01;
           }else{
             percent=1.0;
           }
         }
          if(sec>0){
           sec--;
         }else{
             sec=59;
         }
       }else{
         percent=0;
         //play=false;
         //_isPlaying=false;
         
         
         timer.cancel();
         if(ciclenumber<4){
           timeInMinute=25;
           ciclenumber++;
           timeInMinute=25;
         }else{
           timeInMinute=breaktimeInMinute;
           ciclenumber=0;
         }
         
         
         
         
         _startbreak();
       }
     });
    });
    print('trabajo');
    print(ciclenumber);
    
  }
  _pause(){
    setState(() {
      play=false;
    });
  }
  _stop({bool reset=true}){
    if(reset){
      setState(() {
      timer!.cancel();
      timeInMinute=25;
      sec=59;
      percent=0;
      play=false;
      textMood='Go!!!';
      resetTimer();
    });

    }
    
  }
  _resume(){
    setState(() {
      timer!.cancel();
      timeInMinute=25;
      sec=59;
      percent=0;
      play=false;
      _startTimer();
    });
  }
  
    

           
         


  void _startbreak() {
    if(ciclenumber==4){
      timeInMinute=25;

    }else{
      timeInMinute=1;
    }
    
   int time= timeInMinute *60;
   double secPercent = (time/100);
   timer= Timer.periodic(Duration(seconds: 1) , (timer) {
     setState(() {
       textMood='Break';
      
       
       if(time>1){
         
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

  //  String displayTime() {
  //   //
  //   if (seconds == 60) {
  //     return '$minutes:00';
  //   } else if (minutes > 9 && seconds > 9) {
  //     return '$minutes:$seconds';
  //   } else if (minutes < 10 && seconds < 10) {
  //     return '0$minutes:0$seconds';
  //   } else if (minutes < 10 && seconds > 9) {
  //     return '0$minutes:$seconds';
  //   } else if (minutes > 9 && seconds < 10) {
  //     return '$minutes:0$seconds';
  //   }
  // }

  
  
}