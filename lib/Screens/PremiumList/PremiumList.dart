import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:untitled/Screens/Calculators.dart';
import 'package:untitled/Screens/PremiumList/premiumTemplate.dart';
import './premiumModel.dart';



class PremiumsListed extends StatefulWidget {

  @override
  State<PremiumsListed> createState() => _PremiumsListedState();
}

class _PremiumsListedState extends State<PremiumsListed> {
  final List<PremiumModel> _premiumlist = [
    PremiumModel(10, "Bronze-Premium",
        "lib/images/icon-p-16.jpg")
  ];



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      appBar: AppBar(
        title: Text("Premiumlar",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
        backgroundColor: Colors.cyan,
        centerTitle: true,

      ),
      body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                stops: [
                  0.5,
                  0.8,

                ],
                colors: [
                  Colors.grey.shade800,
                  Colors.white70,
                ],
              ),),
          child: ListView(
            children: <Widget>[
              Container(
                margin: EdgeInsets.all(20),
                child: ElevatedButton(onPressed:(){},
                    child: Row(children:_premiumlist.map((premium) => Premium(premium)).toList(),),
                style: ElevatedButton.styleFrom(
                    primary: Colors.purple,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50)),
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    textStyle: TextStyle(
                        fontSize: 20,
                        letterSpacing: 3.0,
                        fontWeight: FontWeight.bold),
                ),),
              )
            ]
          ),

      ),
    );
  }
}
