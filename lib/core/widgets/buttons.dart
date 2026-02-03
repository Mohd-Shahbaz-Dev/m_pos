import 'package:flutter/material.dart';

class Button extends StatefulWidget {
  final String title;
   final VoidCallback onPressed;
  const Button({super.key, required this.title,required this.onPressed});

  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button> {


  @override
  Widget build(BuildContext context) {
    return 
      Center(
        child: ElevatedButton(onPressed: widget.onPressed,
         style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueAccent,
                      foregroundColor: Colors.white,
                      textStyle:TextStyle(fontSize: 20, ),
                      
                     shape:RoundedRectangleBorder(borderRadius:BorderRadius.circular(10)),
                    ), child: Text(widget.title)
        ),
      );
   
  }
}