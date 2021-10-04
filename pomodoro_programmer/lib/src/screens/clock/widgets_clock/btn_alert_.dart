
import 'dart:ui';

import 'package:flutter/material.dart';

class BotonAlert extends StatelessWidget {
  final String textBtn; 
  
  const BotonAlert({
    Key? key, 
    required this.textBtn,     
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    
    var textStyle2 = TextStyle(
       color: Colors.white,
       letterSpacing: 2.0,
       fontSize: 15,
       fontWeight: FontWeight.bold,
       fontFamily: 'Opensans'
       );

  final ButtonStyle style =
  ButtonStyle(
    
    backgroundColor: MaterialStateProperty.all<Color>(Color(0xff0f50e9)),
    
    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
      RoundedRectangleBorder(            
      borderRadius: BorderRadius.circular(18.0),   
      
    )));                         

    return 
        SizedBox(
          width: 300,
          height: 40,
          child: ElevatedButton(
            onPressed: (){
              
              Navigator.pop(context);
            },
            style: style,                
            child: Text( textBtn,
                 style: textStyle2,
                   ),
          )
        );
      
  }
}