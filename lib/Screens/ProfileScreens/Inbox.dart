import 'package:flutter/material.dart';
import 'package:untitled/Screens/NavScreen.dart';
import 'package:untitled/Screens/UserProfile.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class Inbox extends StatefulWidget {
  const Inbox({Key? key}) : super(key: key);

  @override
  State<Inbox> createState() => _InboxState();
}

class _InboxState extends State<Inbox> {
  final _firestore =FirebaseFirestore.instance;






  @override
  Widget build(BuildContext context) {
    CollectionReference userRef = _firestore.collection('MailInbox');
    return Scaffold(
      appBar: AppBar(
        title: Text("Gelen Kutusu",
          style: TextStyle(
              color: Colors.white60 ,
              fontSize: 25,
              fontWeight: FontWeight.bold),),
        centerTitle: true,
        backgroundColor: Colors.deepPurpleAccent,
        leading: IconButton(icon: Icon(Icons.arrow_back),onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>MainPage()));

        },),
      ),
      backgroundColor: Colors.deepPurpleAccent,

      body:
      Center(
        child: Column(
          children: <Widget>[

            SizedBox(height: 50,width: 0,),
            StreamBuilder<QuerySnapshot>(
              stream: userRef.snapshots(),
              builder: (BuildContext context, AsyncSnapshot asyncSnapshot){

                List<DocumentSnapshot> listOfUsers=asyncSnapshot.data.docs;
                return Expanded(
                  child: ListView.builder(
                    itemCount: listOfUsers.length,
                    itemBuilder: (context,index){
                      return Column(
                        children:<Widget> [
                          Text("Son Mesajlar",style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold),),
                          SizedBox(height: 20,width: 0,),
                          ListTile(
                            title: Text("Mesaj: "+'${listOfUsers[index+listOfUsers.length-1].get('Message')}',
                              style: TextStyle(
                                letterSpacing: 2,
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),),

                            tileColor: Colors.white54,
                            subtitle: Text("Gönderen : "+'${listOfUsers[index+listOfUsers.length-1].get('Sender')}',
                              style: TextStyle(
                                  color: Colors.yellowAccent,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold
                              ),
                          ),
                            trailing: IconButton(icon: Icon(Icons.delete_forever,color: Colors.red,size: 45,
                            ),

                            onPressed: () async{
                              await listOfUsers[index].reference.delete();

                            },
                              mouseCursor: MouseCursor.uncontrolled,
                              padding: EdgeInsets.only(bottom: 10),
                            )
                            ,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                          )
                        ],
                      );
                    },
                  ),
                );



              },
            ),
          ],
        ),
      ),
    );
  }
}
