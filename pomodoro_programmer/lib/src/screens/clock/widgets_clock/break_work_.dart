import 'package:flutter/material.dart';

class WorkBreakButtons extends StatefulWidget {

  final String text;
  final int time;
  final IconData icon;
  const WorkBreakButtons( { Key? key, 
  required this.text, 
  required this.time, 
   this.icon=Icons.keyboard_arrow_down,
   }) : super(key: key);

  @override
  _WorkBreakButtonsState createState() => _WorkBreakButtonsState();
}

class _WorkBreakButtonsState extends State<WorkBreakButtons> {
  @override
  Widget build(BuildContext context) {

    var textStyle = TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.bold,
      fontSize: 25.0,
      );

      var boxDecoration = BoxDecoration(
      gradient: LinearGradient(
        colors: [
          Color(0xff0f50e9),
          Color(0xff1dbfcc)  
          ]
          ),
          borderRadius:
          BorderRadius.circular(20)
          );



    return Container(
      height: 170,
      decoration: boxDecoration,
      padding: EdgeInsets.symmetric(vertical: 20,horizontal: 18),
      margin: EdgeInsets.all(15),
      child: Center(
        child: Column(
          children: [
            Text(widget.text, 
            style: textStyle   
            ),
            SizedBox(height: 10,),
            Text('${widget.time}',
            style: textStyle,),
            Icon(widget.icon,
            size: 50,
            color: Colors.white,)
            
          ],

        ),
      ),
    );

      
    
  }
}