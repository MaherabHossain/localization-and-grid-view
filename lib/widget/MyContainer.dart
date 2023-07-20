import 'package:flutter/material.dart';
class MyContainer extends StatelessWidget {
    String text;
    double height;
    double width;
   MyContainer({required this.text,required this.height,required this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black,
          width: 1.0,
        ),
        borderRadius: BorderRadius.circular(20.0), // Make it half of the width/height to create a circular shape.
      ),
      child: Center(
        child: Text(text,style: TextStyle(fontSize: 10),),
      ),
    );
  }
}
