import 'package:flutter/material.dart';

import 'package:intl/intl.dart';
import 'package:pomodoro_programmer/src/screens/home/widgets_home/clock_home.dart';



class Home extends StatefulWidget {
  const Home({ Key? key }) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  
  @override
  Widget build(BuildContext context) {

    var now = DateTime.now();
    var formatedTime = DateFormat('HH:mm').format(now);
    var formatedDate = (DateFormat('EEE,d MMM').format(now));
    var timezoneString = now.timeZoneOffset.toString().split('.').first;
    var offsetSign= '';
    if (!timezoneString.startsWith('-')){
      offsetSign= '+';
    }print(timezoneString);
    print(formatedTime);

    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xff2d2f41),
        body: Row(
          children: <Widget>[
            
            Column(
              
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                buildButton('clock', FlutterLogo()),
                buildButton('alarm', FlutterLogo()),
                buildButton('settings', FlutterLogo()),
                buildButton('otro', FlutterLogo())


              ],
            ),
            VerticalDivider(
              color: Colors.white54,
              width: 1,
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(30),
                alignment: Alignment.center,
                color: Color(0xff2D2f41),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Clock',
                    
                    style: TextStyle(color: Colors.white, fontSize: 20),),
                    SizedBox(height: 20),
                    Text(formatedTime,
                    style: TextStyle(color: Colors.white, fontSize: 60),),
                    Text(formatedDate,                    
                    style: TextStyle(color: Colors.white, fontSize: 18),),
                    SizedBox(height: 20),
                    Clock(),
                    Text('Timezone',
                    style: TextStyle(color: Colors.white, fontSize: 20),),
                    SizedBox(height: 10),             
                    Row(
                      
                      children: [
                        Icon(Icons.language,
                        color: Colors.white,
                        ),
                        Text('  Utc  '+ 
                        offsetSign+
                        timezoneString,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24),),
                      ],
                    ),
                    
                   
                  ],
                ),
              ),
            ),
          ],
        ),
        
        
      ),
    );
  }

  Padding buildButton(text, image) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: ElevatedButton(onPressed: (){
        Navigator.pushReplacementNamed(context, 'introduction');
        
      }, 
                child: Column(
                  children: [
                    image,
                    Text(text,
                    style: TextStyle(
                      fontFamily: 'Avenir',
                      color: Colors.white, 
                      fontWeight: FontWeight.bold,
                      fontSize: 14),),
                  ],
                  
                )),
    );
  }
}