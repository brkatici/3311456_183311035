
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class BodyIndexApp extends StatefulWidget {
  const BodyIndexApp({Key? key}) : super(key: key);

  @override
  State<BodyIndexApp> createState() => _BodyIndexAppState();
}

class _BodyIndexAppState extends State<BodyIndexApp> {
  TextEditingController controller1=TextEditingController();
  TextEditingController controller2=TextEditingController();
  TextEditingController controller3=TextEditingController();


  double boy=0,kilo=0,cinsiyet=0,result=0,yas=0;
  String stability="";

  calculate(){
    setState(() {
      boy = double.parse(controller1.text);
      kilo = double.parse(controller2.text);
      yas = double.parse(controller3.text);
      boy= boy * 0.01;
      yas = yas * 0.04;

      result= (kilo ~/ (boy * boy) )+ yas;

      if(result < 18.5){
        stability="Zayıfsınız";
      }
      else if(18.5<  result && result < 24.9 ){
        stability="Kilonuz Normal";
      }
      else if(25<result && result < 30){
        stability="Fazla Kilolusunuz.";

      }
      else if(30<result && result < 35){
        stability="Tip-1 Obezite";

      }
      else if(35<result && result < 40){
        stability="Tip-2 Obezite";

      }
      else{
        stability="Morbid Obezite";

      }

    });
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo,
      appBar: AppBar(
        title: Text('Kitle Endeksim'),
        titleTextStyle: TextStyle(
          color: Colors.amber,
          fontWeight: FontWeight.bold,
          fontSize: 20
        ),
        centerTitle: true,
        backgroundColor: Colors.indigoAccent,
      ),



      body: Padding(
        padding: const EdgeInsets.all(12),
        child: SingleChildScrollView(
           child:Column(
            children: [
              Container(
                padding: EdgeInsets.only(top: 40.0),
                child: TextField(
                  controller: controller1,
                  decoration: InputDecoration(
                      labelText: "Boyunuz",
                      labelStyle: TextStyle(color: Colors.white,fontSize: 30),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),

                      )
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 20),
                child: TextField(
                  controller: controller2,
                  decoration: InputDecoration(
                      labelText: "Kilonuz",
                      labelStyle: TextStyle(color: Colors.white,fontSize: 30),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),

                      )
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 20.0),
                child: TextField(
                  controller: controller3,
                  decoration: InputDecoration(
                      labelText: "Yaşınız",
                      labelStyle: TextStyle(color: Colors.white,fontSize: 30),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),

                      )
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(onPressed: (){
                      calculate();
                      controller1.clear();
                      controller2.clear();
                      controller3.clear();
                    },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.amber
                      ),
                      child: Text("Hesapla", style: TextStyle(color: Colors.indigoAccent.shade700,fontSize: 25),),
                    ),
                  ],
                ),
              ),
              Container(
                child: Text("Kitle Endeksiniz $result",
                  style: TextStyle(
                      color:Colors.amberAccent,
                      fontSize: 30),),
              ),

              Container(
                height: 80,
                margin: EdgeInsets.all(20),
                padding: EdgeInsets.only(top: 20,left: 20,right: 20,bottom: 20),
                child: Text("$stability",
                  style: TextStyle(
                      color:Colors.lightGreenAccent,
                      fontSize: 40),),
              ),

            ],
          ),

        ),

      ),
    );
  }
}
