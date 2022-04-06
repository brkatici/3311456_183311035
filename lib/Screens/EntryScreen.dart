import 'package:flutter/material.dart';
import 'dart:async';
import 'package:untitled/Screens/WelcomeScreen.dart';

class Splash extends StatefulWidget {

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override

  void initState() {
    // TODO: implement initState
    super.initState();
    startTimer();
  }
  startTimer() async {
    var duration = new Duration(seconds: 5);
    return new Timer(duration, route);
  }
  route() {
    Navigator.pushReplacement(context, MaterialPageRoute(
        builder: (context) => Welcome()
    )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      body: initScreen(context),
    );
  }
}

  initScreen(BuildContext context){
  return Scaffold(
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget> [
          Container(
            child: Image.asset('lib/images/FitzzApp.png'),
          ),
          Padding(padding: EdgeInsets.only(top: 20.0)),
          const SizedBox(height: 40,),
          const CircularProgressIndicator(
            color: Colors.lightGreen,
          )
        ],
      ),
    ),
  );
  }