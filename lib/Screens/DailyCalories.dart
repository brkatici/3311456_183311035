
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:untitled/Screens/WhatIAte.dart';




class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int? _value = 1;
  var items = <String>[
    "Hareketsiz", "Az hareketli", "Düzenli Spor", "Çok Hareketli"
  ];

  TextEditingController controller1 = TextEditingController();
  TextEditingController controller2 = TextEditingController();
  TextEditingController controller3 = TextEditingController();


  double boy = 0,
      kilo = 0,
      cinsiyet = 0,
      result = 0,
      yas = 0;
  int _item = 0;


  calculate() {
    setState(() {
      boy = double.parse(controller1.text);
      kilo = double.parse(controller2.text);
      yas = double.parse(controller3.text);
      if (_item == 0) {
        result = 614 + (13.7 * kilo) + (5 * boy) - (6.8 * yas) - 200;
      }
      else if (_item == 1) {
        result = 614 + (13.7 * kilo) + (5 * boy) - (6.8 * yas) - 100;
      }
      else if (_item == 2) {
        result = 614 + (13.7 * kilo) + (5 * boy) - (6.8 * yas) + 100;
      }

      else {
        result = 614 + (13.7 * kilo) + (5 * boy) - (6.8 * yas) + 250;
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo,
      appBar: AppBar(
        title: Text('Günlük Kalori İhtiyacı'),
        titleTextStyle: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20
        ),
        centerTitle: true,
        backgroundColor: Colors.indigoAccent,
      ),


      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.only(top: 20.0),
                  height: 70,
                  child: TextField(
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white, fontSize: 22),
                    controller: controller1,
                    decoration: InputDecoration(
                        labelText: "Boyunuz",
                        labelStyle: TextStyle(
                            color: Colors.white, fontSize: 20),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),

                        )
                    ),
                  ),
                ),
                Container(
                  height: 70,
                  padding: EdgeInsets.only(top: 20),
                  child: TextField(
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white, fontSize: 22),
                    controller: controller2,
                    decoration: InputDecoration(
                        labelText: "Kilonuz",
                        labelStyle: TextStyle(
                            color: Colors.white, fontSize: 20),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),

                        )
                    ),
                  ),
                ),
                Container(
                  height: 70,
                  padding: EdgeInsets.only(top: 20.0),

                  child: TextField(
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white, fontSize: 22),
                    controller: controller3,
                    decoration: InputDecoration(
                        labelText: "Yaşınız",
                        labelStyle: TextStyle(
                          color: Colors.white, fontSize: 20,),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),

                        )
                    ),
                  ),
                ),
                Container(
                  height: 50,
                  margin: EdgeInsets.only(top: 20),
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 4),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.black,)
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      hint: Text("Aktivite Durumunuz ?"),
                      dropdownColor: Colors.indigoAccent,
                      style: TextStyle(color: Colors.white, fontSize: 22,),


                      isExpanded: true,
                      iconSize: 20,
                      icon: Icon(FontAwesomeIcons.arrowDownWideShort,
                        color: Colors.white,),

                      value: _item == null ? null : items[_item],

                      items: items.map((String value) {
                        return new DropdownMenuItem<String>(
                          value: value,
                          child: new Text(value),
                        );
                      }).toList(),
                      onChanged: (String? value) {
                        setState(() {
                          _item = items.indexOf(value!);
                          print("$_item");
                        });
                      },


                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 100),
                  child: Column(
                    children: [
                      Row(children: [
                        Text("Erkek",
                            style: TextStyle(color:
                            Colors.white, fontSize: 18)
                        ),
                        Radio(
                            value: 1,
                            groupValue: _value,
                            onChanged: (int? value) {
                              setState(() {
                                _value = value;
                              });
                            }
                        ),
                        Text("Kadın", style: TextStyle(
                            color: Colors.white, fontSize: 18)),
                        Radio(
                            value: 2,
                            groupValue: _value,
                            onChanged: (int? value) {
                              setState(() {
                                _value = value;
                              });
                            }
                        ),
                      ],
                      ),

                    ],
                  ),

                ),
                Container(
                  padding: EdgeInsets.only(
                      top: 50, left: 45, right: 45, bottom: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          calculate();
                          controller1.clear();
                          controller2.clear();
                          controller3.clear();
                          Navigator.push(context, // bu metot ile sayfadaki result değişkenini bugün yediklerim sayfasına aktarıyorum.
                              //Aynı zamanda sayfayı da navigate etmiş oluyorum.
                              MaterialPageRoute(
                                  builder: (context) => WhatIAte(calories: result,),
                              )
                          );
                        },
                        style: ElevatedButton.styleFrom(
                            primary: Colors.amber
                        ),
                        child: Text("Hesapla", style: TextStyle(color: Colors
                            .indigoAccent.shade700, fontSize: 25),),
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Text("Kalori İhtiyacınz $result",
                    style: TextStyle(
                        color: Colors.amberAccent,
                        fontSize: 30),),
                ),
              ],
            ),

          ),

        ),
      ),
    );
  }
}
