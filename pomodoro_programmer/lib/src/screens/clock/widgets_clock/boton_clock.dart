import 'package:flutter/material.dart';

class BotonStart extends StatelessWidget {

  final String textBtn;
  final Function onPressed;
  final Color color;
  final IconData icon;
  
  const BotonStart({
    Key? key, 
    required this.textBtn,  
    required this.onPressed, 
    this.color=Colors.white,
    this.icon=Icons.arrow_downward,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    
    
    var textStyle2 = TextStyle(
       color: Color(0xff35425e),
       //Colors.white,
       letterSpacing: 2.0,
       fontSize: 15,
       fontWeight: FontWeight.bold,
       fontFamily: 'Opensans'
       );

  final ButtonStyle style =
  ButtonStyle(
    
    backgroundColor: MaterialStateProperty.all<Color>(this.color),
    
    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
      RoundedRectangleBorder(            
      borderRadius: BorderRadius.circular(18.0),   
      
    )));                         

    return 
        SizedBox(
          width: 120,
          height: 100,
          child: ElevatedButton(
            onPressed: (){
              
              onPressed();
            },
            style: style,                
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(this.icon,
                color: Color(0xff35425e),
                size: 50,
                ),
                Text( textBtn,
                style: textStyle2,
                ),
              ],

            ),
          )
        );
      
  }
}
