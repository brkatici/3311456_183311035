import 'package:flutter/material.dart';
import 'dart:async';
import 'package:untitled/Screens/SignIn.dart';
import 'package:untitled/Screens/SignUp.dart';

class Welcome extends StatefulWidget {
  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override

  void initState() {
    // TODO: implement initState
    super.initState();
    startTimer1();
    startTimer2();
  }
  startTimer1() async {
    var duration = new Duration(seconds: 9000);
    return new Timer(duration, route1);
  }
  startTimer2() async {
    var duration = new Duration(seconds: 9000);
    return new Timer(duration, route2);
  }
  route1() {
    Navigator.pushReplacement(context, MaterialPageRoute(
        builder: (context) => SignInForm()
    )
    );
  }

  route2() {
    Navigator.pushReplacement(context, MaterialPageRoute(
        builder: (context) => SignUpForm()
    )
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo,
      body: Center(
        child: Container(
          padding: EdgeInsets.only(top: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(bottom: 70),
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 80.0,
                  backgroundImage: AssetImage('lib/images/FitzzApp.png'),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 46
                ),
                padding: EdgeInsets.only(bottom: 70,),
                child: Row(

                  children: <Widget>[
                    SizedBox(
                      width: 40.0,
                    ),

                    Text('FitZZ `e Hoşgeldin!',

                      style: TextStyle(fontSize: 25.0,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),),
                  ],
                ),),
              Container(
                padding: EdgeInsets.only(bottom: 40.0),
                child: MaterialButton(
                  minWidth: 250,
                  height: 60,
                  onPressed: () {
                    route1();
                  },
                  color: Colors.indigoAccent[400],
                  shape: RoundedRectangleBorder(
                      side: BorderSide(
                        color: Colors.black,
                      ),
                      borderRadius: BorderRadius.circular(40)),
                  child: Text(
                    "Giriş Yap",
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        color: Colors.white70),
                  ),
                ),
              ),
              MaterialButton(
                minWidth: 250,
                height: 60,
                onPressed: () {
                  route2();
                },
                color: Colors.redAccent,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40)),
                child: Text(
                  "Hemen Kayıt Ol!",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
