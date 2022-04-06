import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:untitled/Screens/BodyIndex.dart';
import 'package:untitled/Screens/DailyCalories.dart';
import '../CustomWidgets/ExportWidget.dart';


class Calcs extends StatefulWidget {
  const Calcs({Key? key}) : super(key: key);

  @override
  State<Calcs> createState() => _CalcsState();
}

class _CalcsState extends State<Calcs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      appBar: AppBar(
        title: Text('Hesaplayıcılar'),
        centerTitle: true,
          backgroundColor: Colors.indigo.shade300,

      ),

      body: Column(
        children: <Widget> [
          Expanded(child:
          Row(
            children: <Widget> [
              Expanded(
                child: CalculatorContainer(child:
                  Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[

                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MyApp(),
                          ),
                        );
                      },
                      child: Container(
                        padding: EdgeInsets.only(top: 30),
                        height:150,
                        child:ListView(
                          children: <Widget>[
                            Container(child:Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Icon(
                                    FontAwesomeIcons.calculator,
                                    color: Colors.white,
                                    size: 50
                                ),
                                SizedBox(height: 20,),

                                Text(
                                  'Günlük Kalori',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold
                                  ),
                                )
                              ],
                            )),

                          ],
                        )
                      ),
                    ),

                  ],
                ),),
              ),
              Expanded(
                child: CalculatorContainer(child:
                  Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[

                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => BodyIndexApp(),
                          ),
                        );
                      },
                      child: Container(
                          padding: EdgeInsets.only(top: 30),
                          height:150,
                          child:ListView(
                            children: <Widget>[
                              Container(child:Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Icon(
                                      FontAwesomeIcons.personCircleCheck,
                                      color: Colors.white,
                                      size: 50
                                  ),
                                  SizedBox(height: 20,),

                                  Text(
                                    'Kitle Endeksim',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold
                                    ),
                                  )
                                ],
                              )),

                            ],
                          )
                      ),
                    ),

                  ],
                ),),
              ),
            ],
          ),
          ),


          Expanded(child:
          Row(
            children: <Widget> [
              Expanded(
                child: CalculatorContainer(child:Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                        FontAwesomeIcons.bowlFood,
                        color: Colors.white,
                        size: 50
                    ),
                    SizedBox(height: 20,),

                    Text(
                      'Bugün Yediklerim',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold
                      ),
                    )
                  ],
                )),
              ),
              Expanded(
                child: CalculatorContainer(child:Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                        FontAwesomeIcons.bottleWater,
                        color: Colors.white,
                        size: 50
                    ),
                    SizedBox(height: 20,),

                    Text(
                      'Günlük Su İhtiyacı',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold
                      ),
                    )
                  ],
                )),
              ),
            ],
          ),
          ),
        ],
      ),

    );
  }
}









/*
//Container`ı ayrı bir widget olarak kullandım
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
*/