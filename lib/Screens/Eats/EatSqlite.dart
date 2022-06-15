
import 'dart:io';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';


class EatSqlite extends StatefulWidget {
  const EatSqlite({Key? key}) : super(key: key);

  @override
  State<EatSqlite> createState() => _EatSqliteState();
}

class _EatSqliteState extends State<EatSqlite> {
  int? selectedId;


  final textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bugün Yediklerim",
          style: TextStyle(
              color: Colors.white60 ,
              fontSize: 25,
              fontWeight: FontWeight.bold),),
        centerTitle: true,
        backgroundColor: Colors.deepPurpleAccent,
      ),
      backgroundColor: Colors.orangeAccent,

      floatingActionButton: FloatingActionButton(
        elevation: 40.0,
        child: Icon(Icons.save),
        onPressed: () async {
          if(textController.text==""){
            print("Boş değer girilmez");

          }
        else{
            selectedId != null
                ? await DatabaseHelper.instance.update(
              Yiyecekler(id: selectedId, name: textController.text),
            ):
            await DatabaseHelper.instance.add(
              Yiyecekler(name: textController.text),
            );
            setState(() {
              textController.clear();
              selectedId = null;
            });
          }
        },
      ), //FloatingAc
      
      body:SingleChildScrollView(
        child: Column(
          children:<Widget> [
            SizedBox(height: 25,width: 0,),
            TextFormField(
              style: TextStyle(color: Colors.black,fontSize: 18),
              controller: textController,
              decoration: InputDecoration(
                errorStyle: TextStyle(color: Colors.black,fontSize: 15),
                label: const Center(
                  child: Text("Ekleyin",
                    style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold , fontSize: 18),),

                ),
                enabledBorder: new OutlineInputBorder(
                    borderRadius: new BorderRadius.circular(20.0),
                    borderSide:  BorderSide(color: Colors.black,width: 3 )

                ),

                // ),
              ),
            ),

            FutureBuilder<List<Yiyecekler>>(
                future: DatabaseHelper.instance.getGroceries(),
                builder: (BuildContext context,
                    AsyncSnapshot<List<Yiyecekler>> snapshot) {
                  if (!snapshot.hasData) {
                    return Center(child: Text('Loading...'));
                  }
                  return ListView(
                      shrinkWrap:true,
                    children: snapshot.data!.map((yiyecek) {
                      return Center(
                        child: Card(
                          child: ListTile(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0)
                            ),
                            onTap: (){
                              setState(() {
                                textController.text = yiyecek.name;
                                selectedId = yiyecek.id;
                              });

                            },
                            onLongPress: (){
                              setState(() {
                                DatabaseHelper.instance.remove(yiyecek.id!);
                              });
                            },
                            title: Text(yiyecek.name,style: TextStyle(color: Colors.black),),
                            subtitle: Text("Silmek için basılı tutun",style: TextStyle(color: Colors.black),),
                            trailing: Icon(Icons.no_food,color: Colors.black,size: 26,),
                          ),
                        ),
                      );
                    }).toList(),
                  );
                }),
          ],
        ),
      ),

    );
  }
}




class Yiyecekler {
  final int? id;
  final String name;

  Yiyecekler({this.id, required this.name});

  factory Yiyecekler.fromMap(Map<String, dynamic> json) => new Yiyecekler(
    id: json['id'],
    name: json['name'],
  );

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
    };
  }
}
class DatabaseHelper {
  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();
  static Database? _database;
  Future<Database> get database async => _database ??= await _initDatabase();

  Future<Database> _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, 'groceries.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }
  Future _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE groceries(
          id INTEGER PRIMARY KEY,
          name TEXT
      )
      ''');
  }
  Future<List<Yiyecekler>> getGroceries() async {
    Database db = await instance.database;
    var groceries = await db.query('groceries', orderBy: 'name');
    List<Yiyecekler> groceryList = groceries.isNotEmpty
        ? groceries.map((c) => Yiyecekler.fromMap(c)).toList()
        : [];
    return groceryList;
  }

  Future<int> add(Yiyecekler yiyecek) async {
    Database db = await instance.database;
    return await db.insert('groceries', yiyecek.toMap());
  }
  Future<int> remove(int id) async {
    Database db = await instance.database;
    return await db.delete('groceries', where: 'id = ?', whereArgs: [id]);
  }
  Future<int> update(Yiyecekler yiyecek) async {
    Database db = await instance.database;
    return await db.update('groceries', yiyecek.toMap(),
        where: "id = ?", whereArgs: [yiyecek.id]);
  }

}