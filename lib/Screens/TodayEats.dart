import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:untitled/Screens/Calculators.dart';
import 'package:untitled/Screens/Eats/EatSqlite.dart';


class TodaysEat extends StatefulWidget {

  @override
  State<TodaysEat> createState() => _TodaysEatState();
}

class _TodaysEatState extends State<TodaysEat> {
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
                  Text('Eklemek için + işaretine 2 kez dokunun',style: TextStyle(color: Colors.white,fontSize: 25),textAlign: TextAlign.center,),
                  SizedBox(height: 20,child: Container(
                    color: Colors.grey.shade900,
                  ),
                  ),
                  ListTile(
                    title: Text('Kahvaltı',style: TextStyle(color: Colors.white,fontSize: 20),),
                    trailing: InkWell(onDoubleTap: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => EatSqlite(),
                        ),
                      );
                    },child: Icon(Icons.add),),

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
            SizedBox(height: 50,)
          ],
        ),
      ),
    );
  }
}
