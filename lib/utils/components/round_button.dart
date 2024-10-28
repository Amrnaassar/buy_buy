import 'package:flutter/material.dart';

class RoundButton extends StatelessWidget {
   RoundButton({ this.text,this.colour,required this.onpressed});

   final Color? colour;
   final String? text;
   final  void Function() onpressed;

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0,horizontal: 120),
      child: Material(

        elevation: 5.0,
        color: colour,
        borderRadius: BorderRadius.circular(30.0),
        child: MaterialButton(
          onPressed: onpressed,
          height: 42.0,
          minWidth: 120,
          child: Text(text!,style: TextStyle(color: Colors.white),),
        ),
      ),
    );
  }
}
