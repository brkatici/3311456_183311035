import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/Screens/SignIn.dart';
import 'dart:async';
import '../../CustomWidgets/ExportWidget.dart';
import '../NavScreen.dart';
import '../WelcomeScreen.dart';
import 'dart:math';
import 'package:untitled/Screens/WelcomeScreen.dart';


class UpdatePw extends StatefulWidget {
  @override
  _UpdatePwState createState() => _UpdatePwState();
}

class _UpdatePwState extends State<UpdatePw> {

  final _firestore =FirebaseFirestore.instance;

  String password ='';


  TextEditingController controller1=TextEditingController();
  TextEditingController controller2=TextEditingController();



  @override


  //Global key daha sonrasında database işlemleri için formu özelleştirmemi sağladı.
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

    CollectionReference userRef = _firestore.collection('Users');


    return WillPopScope(
      onWillPop: ()async{
        return Navigator.canPop(context);},
      child: SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            leading: BackButton(
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => Welcome()));
              },
            ),
            centerTitle: true,
            backgroundColor: Colors.black54,
            title: Text('Şifre Güncelleme',style: TextStyle(color: Colors.white70,letterSpacing: 2),),

          ),

          body: Container(
            decoration: BoxDecoration(
                gradient:  LinearGradient(
                    begin: Alignment.bottomLeft,
                    end: Alignment.topRight,
                    colors: [Colors.indigoAccent.shade700, Colors.grey.shade900],
            ),),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[

                  CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 80.0,
                    backgroundImage: AssetImage('lib/images/FitzzApp.png'),
                    child: Container(
                      padding: EdgeInsets.only(top: 100,left: 128),
                      child: Icon(Icons.lock_outline_rounded,color: Colors.black,size: 48,),
                    ),
                  ),
                  SizedBox(height: 40,width: 0,),

                  Text("Mail adresinizi ve yeni şifrenizi giriniz",
                    style:
                    TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 18),),
                  SizedBox(height:15,width: 0,),
                  Container(
                    margin: EdgeInsets.fromLTRB(25, 0, 25, 0),
                    child: buildMailFormField(),
                  ),

                  SizedBox(height: 20,width: 0,),
                  Container(
                    margin: EdgeInsets.fromLTRB(25, 0, 25, 0),
                    child: buildChckPasswordFormField(),
                  ),

                  SizedBox(height: 20,width: 0,),

                  MaterialButton(
                    height: 40,
                    onPressed: () async{
                      showPwChangeDialog(context);

                    await userRef.doc(controller1.text).update({'Password':controller2.text});


                  },
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                    color: Colors.white,
                    child:Text("Şifremi Değiştir") ,

                  ),

                ],
              ),
            ),
          ),

        ),
      ),
    );
  }

  TextFormField buildMailFormField() {
    return TextFormField(
      style: TextStyle(color: Colors.white,fontSize: 18),
      controller: controller1,
      decoration: InputDecoration(
        errorStyle: TextStyle(color: Colors.white,fontSize: 15),
        label: const Center(
          child: Text("Email",
            style: TextStyle(color: Colors.amberAccent, fontWeight: FontWeight.bold , fontSize: 18),),

        ),
        enabledBorder: new OutlineInputBorder(
            borderRadius: new BorderRadius.circular(20.0),
            borderSide:  BorderSide(color: Colors.white,width: 3 )

        ),

        // ),
      ),
    );
  }
TextFormField buildChckPasswordFormField() {
  return TextFormField(
    style: TextStyle(color: Colors.white,fontSize: 18),
    obscureText: true,// Şifrenin * şeklinde görünmesi
    controller: controller2,
    decoration: InputDecoration(
      errorStyle: TextStyle(color: Colors.white,fontSize: 15),
      label: const Center(
        child: Text("Şifre",
          style: TextStyle(color: Colors.amberAccent, fontWeight: FontWeight.bold , fontSize: 18),),

      ),
      enabledBorder: new OutlineInputBorder(
          borderRadius: new BorderRadius.circular(20.0),
          borderSide:  BorderSide(color: Colors.white,width: 3 )

      ),

      // ),
    ),
  );
}


}
