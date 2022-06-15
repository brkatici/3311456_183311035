import "package:flutter/material.dart";
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:untitled/Screens/PremiumList/premiumTemplate.dart';
import "premiumModel.dart";

class PremiumDetail extends StatelessWidget {
  final PremiumModel _premium;

  PremiumDetail(this._premium);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                0.1,
                0.9,

              ],
              colors: [
                Colors.red.shade300,
                Colors.orange.shade300,
              ],
          )
        ),
        child: Center(
          child: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(16),
                /// Hero Widgetini aynı şekilde bu sayfada da tanımlayıp aynı tag`i vererek animasyonu uyguluyoruz.
                child: Hero(
                  tag: "avatar_" + _premium.id.toString(),
                  child: CircleAvatar(
                    radius: 80,
                    backgroundColor: Colors.white10,
                    backgroundImage: AssetImage(_premium.avatar),
                  ),
                ),
              ),
              Text(_premium.name,
                style: TextStyle(
                    fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  letterSpacing: 3.0
                ),
              ),

              Card(
                margin: const EdgeInsets.fromLTRB(30, 8, 32, 1),
                color: Colors.white10,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                child: Column(
                  children: <Widget>[
                    ListTile(
                      title: Text('Gerçek zamanlı takip',style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),
                      trailing: Icon(FontAwesomeIcons.clock,color:Colors.white),
                    ),
                    ListTile(
                      title: Text('Özel antrenman programı',style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),
                      trailing: Icon(Icons.folder_special,color:Colors.white),
                    ),
                    ListTile(
                      title: Text('Beslenme Programı',style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),
                      trailing: Icon(FontAwesomeIcons.bowlRice,color:Colors.white),
                    ),
                    SizedBox(height: 20,width:0,),

                    MaterialButton(onPressed: (){},
                      height: 70.0,
                      shape:  RoundedRectangleBorder(borderRadius:BorderRadius.circular(22.0) ),
                      color: Colors.white70,
                      child: Text("Programa Kaydol!",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),)
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}