import 'package:flutter/material.dart';


class Header extends StatelessWidget {
  final String text;
  const Header({
    
    Key? key, required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(      
      child: Text(
        text,
        style: TextStyle(
          color: Colors.white,
          fontSize: 40.0
        )
        ),


      );
  }
}