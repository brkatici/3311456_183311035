import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';


class WhatIAte extends StatefulWidget {

  //Daily Caloriesten gelen değer
  double calories=0;

  WhatIAte({required this.calories,});



  @override
  State<WhatIAte> createState() => _WhatIAteState();
}

class _WhatIAteState extends State<WhatIAte> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.lightGreen,
        title: Text('Bugün Ne Yedim ?',),

      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 50,),

            Card(
              margin: const EdgeInsets.fromLTRB(30, 8, 32, 1),
              color: Colors.green,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              child: Column(
                children: <Widget>[
                  ListTile(
                    title: Text('Kahvaltı',style: TextStyle(color: Colors.white,fontSize: 20),),
                    trailing: Icon(Icons.add,color:Colors.white70),
                  ),
                  SizedBox(height: 5,child: Container(
                    color: Colors.grey.shade900,
                  ),
                  ),
                  ListTile(
                    title: Text('Öğle',style: TextStyle(color: Colors.white,fontSize: 20)),
                    trailing: Icon(Icons.add,color:Colors.white70),
                  ),
                  SizedBox(height: 5,child: Container(
                    color: Colors.grey.shade900,
                  ),
                  ),
                  ListTile(
                    title: Text('Akşam',style: TextStyle(color: Colors.white,fontSize: 20)),
                    trailing: Icon(Icons.add,color:Colors.white70),
                  ),
                  SizedBox(height: 5,child: Container(
                    color: Colors.grey.shade900,
                  ),
                  ),
                  ListTile(
                    title: Text('Ek Öğün',style: TextStyle(color: Colors.white,fontSize: 20)),
                    trailing: Icon(Icons.add,color:Colors.white70,),
                  ),
                ],
              ),
            ),
            SizedBox(height: 50,),
            Container(
                padding: EdgeInsets.only(top: 1,left:20,right: 40,),
                child:
                Row(// Bu kısımda daily caloriesten gelen değer ekrana basılıyor
                  children: [
                    Text('Almanız Gereken :  ',style: TextStyle(color: Colors.white,fontSize: 22),),
                    Text(widget.calories ==null?
                      'Toplam Kalori /': widget.calories.toString(),
                      style: TextStyle(color: Colors.green,fontSize: 22),),
                  ],
                )
            ),
            Container(
              padding: EdgeInsets.only(top: 1,left:20,right: 40,),
              child:
              Text('Alınan :                      1850',style: TextStyle(color: Colors.redAccent,fontSize: 22),),
            ),
            Container(
              height: 170,
              margin: EdgeInsets.only(top: 50,left: 40,right: 40),
              padding: EdgeInsets.only(top: 10,left: 50,right: 40),
              child: Text('Günlük İhtiyacınızın       %x karbonhidrat ,          '
                  '%x yağ,                %xprotein              kadarını aldınız',
                style: TextStyle(color: Colors.white,fontSize: 20),),
              color: Colors.white30,
            ),



          ],
        ),
      ),);
  }
}
