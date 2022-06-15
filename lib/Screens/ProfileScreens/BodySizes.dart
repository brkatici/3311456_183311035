import 'package:flutter/material.dart';
import 'package:untitled/Screens/NavScreen.dart';

class BodySizes extends StatefulWidget {
  @override
  _BodySizes  createState() => _BodySizes ();
}

class _BodySizes  extends State<BodySizes > {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: ()async{
        return Navigator.canPop(context);},
      child: MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              leading: BackButton(
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => MainPage()));
                },
              ),
              centerTitle: true,
              backgroundColor: Colors.white60,
              title: Text('Vücut Ölçüleri',),

            ),
            backgroundColor: Colors.grey.shade900,
            body: Container(
              margin: EdgeInsets.all(20.0),
              child: ListView(children: <Widget>[
                SizedBox(height: 40,width: 0,),
                Center(
                    child: Text(
                      'Ölçüm Tablosu',
                      style: buildTextStyle()
                    )),
                SizedBox(height: 5,width: 0,),
                DataTable(
                  border: TableBorder.all(color: Colors.white,width: 2.0,borderRadius: BorderRadius.circular(20)),
                  dataTextStyle: buildDataTextStyle(),
                  columns: [
                    DataColumn(label: Text(
                        'Bölge',
                        style: buildTextStyle()
                    )),
                    DataColumn(label: Text(
                        'Son Ölçüm',
                        style: buildTextStyle()
                    )),
                  ],
                  rows: [
                    DataRow(

                        cells: [
                      DataCell(Text('Boyun',)),
                      DataCell(Text('32 cm',),showEditIcon: true,),
                    ]),
                    DataRow(cells: [
                      DataCell(Text('Omuz',)),
                      DataCell(Text('70 cm',),showEditIcon: true),
                    ]),
                    DataRow(cells: [
                      DataCell(
                          Text('Göğüs',),
                      ),
                      DataCell(Text('55 cm',),showEditIcon: true),
                    ]),
                    DataRow(cells: [
                      DataCell(Text('Bel',)),
                      DataCell(Text('103 cm',),showEditIcon: true),
                    ]),
                  ],
                ),
              ]),
            )
        ),
      ),
    );
  }
}

TextStyle buildTextStyle(){
  return TextStyle(
    color: Colors.amber.shade300,
    fontWeight: FontWeight.bold,
    fontSize: 22.0,
  );
}
TextStyle buildDataTextStyle(){
  return TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.bold,
    fontSize: 16.0,
  );
}

