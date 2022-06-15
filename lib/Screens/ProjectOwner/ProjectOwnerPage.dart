
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:untitled/Screens/ProjectOwner/DataBody.dart';
import 'package:http/http.dart' as http;



class OwnerPage extends StatefulWidget {
  const OwnerPage({Key? key}) : super(key: key);

  @override
  State<OwnerPage> createState() => _OwnerPageState();
}

class _OwnerPageState extends State<OwnerPage> {
  late Future<Album> futureCall;
  int pagenumber =2;

  void initState() {
    super.initState();
    futureCall = callApi();
  }

  Future<Album> callApi() async {

      pagenumber++;
      final response = await http
          .get(Uri.parse('https://jsonplaceholder.typicode.com/photos/'+ pagenumber.toString()));
      if (response.statusCode == 200) {
        return Album.fromJson(jsonDecode(response.body));
      } else {
        throw Exception('Failed');
      }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Lisans & Koşullar", style:
        TextStyle(
          color: Colors.black54,
          fontSize: 24,
          fontWeight:FontWeight.bold,),textAlign: TextAlign.center,),
        centerTitle: true,
        backgroundColor: Colors.yellow.shade600

      ),

      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
              colors: [Colors.white54, Colors.grey.shade900],
            ),
          ),
          child: Column(
            children: <Widget>[
              FutureBuilder<Album>(
                future: futureCall,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Column(
                      children: <Widget>[
                        SizedBox(height: 40,width: 0,),
                      ListTile(
                        title: Text("15.06.2022 Kullanım Koşulları Güncellemesi",
                          style:
                          TextStyle(
                              color: Colors.black,
                              fontSize: 24,
                              fontWeight:FontWeight.bold,),textAlign: TextAlign.center,),
                      ),
                        Image(image:AssetImage("lib/images/FitzzApp.png"),height: 200, width: 230,),
                        ListTile(
                          title: Text("FitzzApp Kullanım koşulları \n"+snapshot.data!.url,
                            style:
                            TextStyle(
                              color: Colors.black,
                              fontSize: 24,
                              fontWeight:FontWeight.bold,),textAlign: TextAlign.center,),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                          tileColor: Colors.black ,
                        ),
                        SizedBox(height: 40,width: 0,),
                        ListTile(
                          title: Text("FitzzApp Lisans ve Telif Hakları \n"+snapshot.data!.thumbnailUrl,
                            style:
                            TextStyle(
                              color: Colors.black,
                              fontSize: 24,
                              fontWeight:FontWeight.bold,),textAlign: TextAlign.center,),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                          tileColor: Colors.red ,
                        ),
                        SizedBox(height: 80,width: 0,),
                        Text("FitzzApp || info@fitzz.com || 021* *** ** **",
                          style:
                          TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight:FontWeight.bold,),textAlign: TextAlign.center,),

                      ],
                    );
                  } else if (snapshot.hasError) {
                    return Text('${snapshot.error}');
                  }
                  // By default, show a loading spinner.
                  return const Text(" Servis Dışı..");
                },
              ),
            ],
          ),
        ),
      )
    );
  }
}
