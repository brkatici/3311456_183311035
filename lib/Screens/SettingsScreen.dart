import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SettingScreen extends StatefulWidget {

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.indigo.shade300,
        title: Text('Ayarlar',),

      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 70,),

            Card(
              margin: const EdgeInsets.fromLTRB(30, 8, 32, 1),
              color: Colors.indigo.shade300,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              child: Column(
                children: <Widget>[
                  ListTile(
                    title: Text('Genel',style: TextStyle(color: Colors.white,fontSize: 20),),
                    trailing: Icon(Icons.keyboard_arrow_right_rounded,color:Colors.white70),
                  ),
                  SizedBox(height: 5,child: Container(
                    color: Colors.grey.shade900,
                  ),
                  ),
                  ListTile(
                    title: Text('Bildirimler & Uyarılar',style: TextStyle(color: Colors.white,fontSize: 20)),
                    trailing: Icon(Icons.keyboard_arrow_right_rounded,color:Colors.white70),
                  ),
                  SizedBox(height: 5,child: Container(
                    color: Colors.grey.shade900,
                  ),
                  ),
                  ListTile(
                    title: Text('Anımsatıcı Ayarları',style: TextStyle(color: Colors.white,fontSize: 20)),
                    trailing: Icon(Icons.keyboard_arrow_right_rounded,color:Colors.white70),
                  ),
                  SizedBox(height: 5,child: Container(
                    color: Colors.grey.shade900,
                  ),
                  ),
                  ListTile(
                    title: Text('Güncelleme Notları',style: TextStyle(color: Colors.white,fontSize: 20)),
                    trailing: Icon(Icons.keyboard_arrow_right_rounded,color:Colors.white70),
                  ),

                  SizedBox(height: 5,child: Container(
                    color: Colors.grey.shade900,
                  ),
                  ),
                  ListTile(
                    title: Text('Uygulama İzinleri',style: TextStyle(color: Colors.white,fontSize: 20)),
                    trailing: Icon(Icons.keyboard_arrow_right_rounded,color:Colors.white70),
                  ),
                  SizedBox(height: 5,child: Container(
                    color: Colors.grey.shade900,
                  ),
                  ),
                  ListTile(
                    title: Text('İyileştirme Öner!',style: TextStyle(color: Colors.white,fontSize: 20)),
                    trailing: Icon(Icons.keyboard_arrow_right_rounded,color:Colors.white70),
                  ),

                ],
              ),
            )
          ],
      ),
      ),);
  }
}
