import 'package:flutter/material.dart';
import 'package:untitled/Screens/UserProfile.dart';
import 'package:untitled/Screens/NavScreen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProfileInfos extends StatefulWidget {
  const ProfileInfos({Key? key}) : super(key: key);

  @override
  State<ProfileInfos> createState() => _ProfileInfosState();
}

class _ProfileInfosState extends State<ProfileInfos> {


  final _firestore =FirebaseFirestore.instance;



  @override
  Widget build(BuildContext context) {

    CollectionReference userRef = _firestore.collection('Users');


    return WillPopScope(
        onWillPop: ()async{
      return Navigator.canPop(context);},
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            leading: BackButton(
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => MainPage()));
              },
            ),
            centerTitle: true,
            backgroundColor: Colors.white60,
            title: Text('Profil Bilgileri',),

          ),
          backgroundColor: Colors.grey.shade900,

          body: Center(
            child: Column(
              children: <Widget>[

                SizedBox(height: 50,width: 0,),
                StreamBuilder<QuerySnapshot>(
                  stream: userRef.snapshots(),
                  builder: (BuildContext context, AsyncSnapshot asyncSnapshot){

                    List<DocumentSnapshot> listOfUsers=asyncSnapshot.data.docs;


                    return Expanded(
                      child: ListView.builder(
                        itemCount: 1,
                        itemBuilder: (context,index){
                         return Column(
                           children:<Widget> [
                             
                             Text("Hesap Bilgileri",style: TextStyle(
                                 color: Colors.white,
                                 fontSize: 24,
                                 fontWeight: FontWeight.bold),),

                             ListTile(
                               title: Text("Mail : "+'${listOfUsers[index+listOfUsers.length-1].get('Mail')}',
                                 style: TextStyle(
                                     color: Colors.white,
                                     fontSize: 18,
                                     fontWeight: FontWeight.bold),),
                               shape: RoundedRectangleBorder(
                                 borderRadius: BorderRadius.circular(40)
                               ),
                               tileColor: Colors.white30,
                             ),

                             SizedBox(height: 20,width: 0,),

                             ListTile(
                               title: Text("Şifre: "+'${listOfUsers[index+listOfUsers.length-1].get('Password')}',
                                 style: TextStyle(
                                     color: Colors.white,
                                     fontSize: 18,
                                     fontWeight: FontWeight.bold),
                               ),
                               shape: RoundedRectangleBorder(
                                   borderRadius: BorderRadius.circular(40)
                               ),
                               tileColor: Colors.white30,
                             ),

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

        ),
      ),
    );
  }
}

TextFormField buildTextField() {
  return TextFormField(
    enabled: false,
    style: TextStyle(color: Colors.white,fontSize: 18),
    // Şifrenin * şeklinde görünmesi
    obscureText: true,
    decoration: InputDecoration(

      errorStyle: TextStyle(color: Colors.white,fontSize: 15),
      label: const Center(
        child: Text("Şifre",
          style: TextStyle(color: Colors.amberAccent, fontWeight: FontWeight.bold , fontSize: 18),),

      ),
      disabledBorder:OutlineInputBorder(
          borderRadius: new BorderRadius.circular(20.0),
          borderSide:  BorderSide(color: Colors.white60,width: 3 )
      ),
    ),
  );
}


