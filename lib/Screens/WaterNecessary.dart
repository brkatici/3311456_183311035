import 'package:flutter/material.dart';
import '../CustomWidgets/ExportWidget.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class WaterReminder extends StatefulWidget {
  const WaterReminder({Key? key}) : super(key: key);

  @override
  State<WaterReminder> createState() => _WaterReminderState();
}

class _WaterReminderState extends State<WaterReminder> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey.shade900,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.lightBlueAccent,
          title: Text(
            'Günlük Su Takibi',)
        ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.all(20.0),
                    height: 150,
                    width: 150,
                    padding: EdgeInsets.all(2),
                    color: Colors.red,
                    child:MaterialButton(
                      onPressed: () {},
                      child:
                      Container(
                          child:Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Image(
                                image: AssetImage("lib/images/glass-cup.png"),
                                color: Colors.white,
                              ),

                              SizedBox(height: 2,),

                              Text(
                                'Kupa Bardak',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold
                                ),
                              )
                            ],
                          )),
                    )

                ),
                Container(
                    margin: EdgeInsets.all(20.0),
                    height: 150,
                    width: 150,
                    padding: EdgeInsets.all(2),
                    color: Colors.red,
                    child:MaterialButton(
                      onPressed: () {},
                      child:
                      Container(
                          child:Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Image(image: AssetImage("lib/images/coffee-cup.png"),color: Colors.white,),

                              SizedBox(height: 2,),

                              Text(
                                'Grande Cup',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold
                                ),
                              )
                            ],
                          )),
                    )

                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                    margin: EdgeInsets.all(20.0),
                    height: 150,
                    width: 150,
                    padding: EdgeInsets.all(2),
                    color: Colors.red,
                    child:MaterialButton(
                      onPressed: () {},
                      child:
                      Container(
                          child:Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Image(
                                image: AssetImage("lib/images/glass-of-water.png"),
                                color: Colors.white,),

                              SizedBox(height: 2,),

                              Text(
                                'Su Bardağı',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold
                                ),
                              )
                            ],
                          )),
                    )

                ),
                Container(
                    margin: EdgeInsets.all(20.0),
                    height: 150,
                    width: 150,
                    padding: EdgeInsets.all(2),
                    color: Colors.red,
                    child:MaterialButton(

                      onPressed: () {
                      },
                      child:
                      Container(
                          child:Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Image(image: AssetImage("lib/images/water-bottle.png"),color: Colors.white,),

                              SizedBox(height: 2,),

                              Text(
                                'Matara',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold
                                ),
                              )
                            ],
                          )),
                    )

                ),
              ],
            ),
            Card(
              margin: const EdgeInsets.fromLTRB(30, 8, 32, 1),
              color: Colors.yellow.shade900,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              child: ListTile(
                title: Text('Bildirim Gönder',style: TextStyle(color: Colors.white,fontSize: 20)),
                trailing: ElevatedButton.icon(
                  onPressed:(){
                    showAlertDialog(context);
                  },
                  icon: Icon(FontAwesomeIcons.bell,color: Colors.black,),
                  label: Text("))",style: TextStyle(color: Colors.black),),
                  style:ElevatedButton.styleFrom(
                    primary: Colors.white,
                    shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(20.0)
                    ),
                  ) ,
                ),
              ),
            ),

          ],
        ),
      )
    );
  }
}
