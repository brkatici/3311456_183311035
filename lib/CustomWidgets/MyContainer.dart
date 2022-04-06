import 'package:flutter/material.dart';

//Tekrar tekrar kullanacağım için bir widget oluşturdum.

class CalculatorContainer extends StatelessWidget {

  //final String MenuText;
  //final Icon MenuIcon;
  final Widget child;

  CalculatorContainer({required this.child});


  @override
  Widget build(BuildContext context) {
    return Container(
      child: child,
      margin: EdgeInsets.all(18),
      width: 100,
      height: 150,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
              50),
          boxShadow: [
            BoxShadow(
              color: Colors.indigoAccent,
              offset: Offset(-5,5),
              blurRadius: 2,
              spreadRadius: 2,
            )
          ],
          color: Colors.deepOrange
      ),
    );
  }
}