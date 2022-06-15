import 'dart:async';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:untitled/Screens/Dosya%C4%B0slemleri/Sorgu.dart';



class SorgulamaEkran extends StatefulWidget {
  SorgulamaEkran() : super();

  @override
  _SorgulamaEkranState createState() => _SorgulamaEkranState();
}

class _SorgulamaEkranState extends State<SorgulamaEkran> {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  String Message ='';

  String fileContents = "";
  final myController = TextEditingController();


  Future<void> addMessageToDatabase() async{
    Message = myController.text;


    CollectionReference mailsRef=
    FirebaseFirestore.instance.collection('ComingMails');


    Map<String,dynamic> userData={'Mail':Message,'DateTime':DateTime.now()};
    await mailsRef.doc(Message).set(userData);

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Mesaj Gönder",
          style: TextStyle(
              color: Colors.white60 ,
              fontSize: 25,
              fontWeight: FontWeight.bold),),
        centerTitle: true,
        backgroundColor: Colors.deepPurpleAccent,
      ),
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
              colors: [Colors.black45, Colors.blueAccent.shade700],
            ),
          ),
          padding: EdgeInsets.fromLTRB(20, 0, 20, 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 50,width: 0,),
              Card(
                color: Colors.white70,
                child: ListTile(
                  title: Text(fileContents,style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold)),
                  trailing: Icon(Icons.verified,color:Colors.black),
                  subtitle: Text("\n Gönderildi",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),),
                ),
              ),
              SizedBox(height: 250,width: 0,),
              TextFormField(
                  style: TextStyle(color: Colors.white,fontSize: 18,),
                  controller: myController,
                  decoration: InputDecoration(
                    label: const Center(
                      child: Text("Mesajınız",
                        style: TextStyle(color: Colors.amber, fontWeight: FontWeight.bold , fontSize: 18),),

                    ),
                    enabledBorder: new OutlineInputBorder(
                        borderSide:  BorderSide(color: Colors.white54,width: 3 )

                    ),
                  ),
              ),

              ElevatedButton(
                child: Text("Gönder",style: TextStyle(color: Colors.black ,fontSize: 18,fontWeight: FontWeight.bold),),
                onPressed: () {
                  FileUtils.saveToFile(myController.text).then((value) =>
                      FileUtils.readFromFile().then((contents) {
                        setState(() {
                          fileContents = contents;
                        });
                      }));
                  addMessageToDatabase();
                  myController.clear();
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.amber,
                  minimumSize: Size(130, 40),
                ),
              ),


            ],
          ),
        ),
      ),
    );
  }
}

