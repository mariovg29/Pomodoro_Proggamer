import 'package:flutter/material.dart';
import 'package:pomodoro_programmer/src/screens/clock/widgets_clock/btn_alert_.dart';

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
      color: Color(0xff35425e),
      fontWeight: FontWeight.bold,
      fontSize: 25.0,
      );

      var boxDecoration = BoxDecoration(
        color: Colors.black,
      // gradient: LinearGradient(
      //   colors: [
      //     Color(0xff0f50e9),
      //     Color(0xff1dbfcc)  
      //     ]
      //     ),
          borderRadius:
          BorderRadius.circular(20)
          );



    return GestureDetector(
      onTap: ()=> _showAlert(context),
      child: Container(
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
                Text('${widget.time} min',
                style: textStyle,),
                Icon(widget.icon,
                size: 50,
                color: Color(0xff35425e),)
                
              ],

            ),
          ),
        ),
    );     
    
  }
  void _showAlert(context) {
    showDialog(
      barrierDismissible: false,
      context: context, 
      builder: (context){
      return AlertDialog(
        shape: 
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20)
        ),
        title: Text('Muy pronto!!!',
        textAlign: TextAlign.center,),
        
        content:
         Column(
           mainAxisSize: MainAxisSize.min,
           children: <Widget>[
             Text('Por ahora no puedes modificar el tiempo...\n\nEstamos trabajando'+
             ' en uevas funcionalidades an la version PRO',
             textAlign: TextAlign.center,
             ),
             CircleAvatar(
               radius: 100,
               backgroundColor: Colors.transparent,
               child: Image.asset('assets/logo_splash.png'),
             )

           ],
        ),
        actions: [
          Hero(
            tag: 2,
            child: Center(
              child: BotonAlert(
                textBtn: 'Atras',
                             
              ),
            ),
          ),
        ],
      );

    }
    );
  }

  
}