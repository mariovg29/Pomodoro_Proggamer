import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:pomodoro_programmer/src/screens/introduction/widgets_introduction/boton_introduccion.dart';

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




  @override
  Widget build(BuildContext context) {
    var textStyle = TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.bold,
      fontSize: 30.0,
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
          decoration: BoxDecoration(
            color: Colors.black,
            // gradient: LinearGradient(
            //   colors: [Color(0xff35425e),Colors.black],
              
            //   )

          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 25),
                child: Text(
                  'Pomodoro Clock',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 40.0
                  )
                  ),


                ),
                Expanded(
                  child: CircularPercentIndicator(
                    percent: percent,
                    animation: true,
                    animateFromLastPercent: true,
                    radius: 250.0,
                    lineWidth: 20.0,
                    progressColor: Color(0xff109bfb),
                    center: Text(
                      '25.00',
                      style: TextStyle(
                        color: Color(0xff0f50e9),
                        fontSize: 70.0
                      ),
                      ),

                  )
               ),
               SizedBox(height: 30.0,),
               Expanded(
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

                              Expanded(
                                
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
                              ),
                              SizedBox(width: 10),
                              Expanded(
                                
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
                              ),
                              
                              
                            ],
                          ),
                          
                          
                          ),
                          SizedBox(height: 40),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 28.0),
                            child: BotonesRedes(textBtn: 'Start', ruta: 'introduction')
                            )
                      
                          
                     ],
                     ),
                     ),
                     

                 )
                 ),
                  

                

            ],
          ),
          
        ),

      ),
      
    );
  }
}