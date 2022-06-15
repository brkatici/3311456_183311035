import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/Screens/SignIn.dart';
import 'dart:async';
import 'NavScreen.dart';
import 'dart:math';
import 'WelcomeScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';


class SignUpForm extends StatefulWidget {
  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {

  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  String email ='';
  String password ='';
  String passwordCheck ='';

  TextEditingController controller1=TextEditingController();
  TextEditingController controller2=TextEditingController();
  TextEditingController controller3=TextEditingController();


  @override


  //Global key daha sonrasında database işlemleri için formu özelleştirmemi sağladı.
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

    //Firebase işlemleri


   Future<void> addUserToDatabase() async{
     email = controller1.text;
     password=controller2.text;
     passwordCheck=controller3.text;


        CollectionReference usersRef=
        FirebaseFirestore.instance.collection('Users');


        Map<String,dynamic> userData={'Mail':email,'Password':password,'DateTime':DateTime.now()};

        await usersRef.doc(email).set(userData).then((value) =>
            FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password));




    }








    return WillPopScope(

      onWillPop: ()async{ // AppBar daki geri okunun navigasyonunu sağlıyorum
        return Navigator.canPop(context);
      },
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            leading: BackButton(
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => Welcome()));
              },
              
            ),
            centerTitle: true,
            title: Text('Kayıt-Ol',),

          ),
          backgroundColor: Colors.indigo,
          resizeToAvoidBottomInset: false,
          body: Container(
            decoration: BoxDecoration(
              gradient:  LinearGradient(
                begin: Alignment.bottomLeft,
                end: Alignment.topRight,
                colors: [Colors.indigoAccent.shade700, Colors.grey.shade900],
              ),),
            padding: EdgeInsets.only(bottom: 150.0),
            child: Center(
              child: Form(
                key: _formKey,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.all(20.0),
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 80.0,
                          backgroundImage: AssetImage('lib/images/FitzzApp.png'),
                          child: Container(
                            padding: EdgeInsets.only(top: 100,left: 128),
                            child: Icon(Icons.add_a_photo,color: Colors.black,size: 48,),
                          ),
                        ),
                      ),
                      SizedBox(height: 40.0,),
                      Container(
                        padding: EdgeInsets.only(right: 20,left: 20),
                        child:buildEmailFormField(),
                      ),
                      
                      SizedBox(height: 20.0,),
                      Container(
                        padding: EdgeInsets.only(right: 20,left: 20),
                        child:buildPasswordFormField(),
                      ),
                      SizedBox(height: 20.0),
                      Container(
                        padding: EdgeInsets.only(right: 20,left: 20),
                        child:buildChckPassFormField(),
                      ),
                      SizedBox(height: 15.0,),
                      ElevatedButton(

                        style: ElevatedButton.styleFrom(
                          minimumSize: Size(120, 50),
                            primary: Colors.amber
                        ),
                          onPressed: () {
                          },
                        child: InkWell(
                          onTap: () {
                            addUserToDatabase();
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SignInForm(),
                              ),
                            );
                          },
                          child: Text("Kayıt ol!",style: TextStyle(
                              color: Colors.black,
                              letterSpacing: 2,
                              fontWeight: FontWeight.bold,
                          fontSize: 18)),
                        ),


                          ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  TextFormField buildPasswordFormField() {
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
            borderSide:  BorderSide(color: Colors.green,width: 3 )

        ),

        // ),
      ),
    );
  }
  TextFormField buildChckPassFormField() {
    return TextFormField(
      obscureText: true, // Şifrenin * şeklinde görünmesi
      controller: controller3,
      style: TextStyle(color: Colors.white,fontSize: 18),
      decoration: InputDecoration(
        errorStyle: TextStyle(color: Colors.white,fontSize: 15),
        label: const Center(
          child: Text("Şifre Tekrar",
            style: TextStyle(color: Colors.amberAccent, fontWeight: FontWeight.bold , fontSize: 18),),

        ),
        enabledBorder: new OutlineInputBorder(
            borderRadius: new BorderRadius.circular(20.0),
            borderSide:  BorderSide(color: Colors.green,width: 3 )
        ),
      ),
    );
  }
  TextFormField buildEmailFormField() {
    return TextFormField(
      controller: controller1,
      style: TextStyle(color: Colors.white,fontSize: 18),
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        errorStyle: TextStyle(color: Colors.white,fontSize: 15),
        label: const Center(
          child: Text("E-Mail",
            style: TextStyle(color: Colors.amberAccent, fontWeight: FontWeight.bold , fontSize: 18),),
        ),
        enabledBorder: new OutlineInputBorder(
            borderRadius: new BorderRadius.circular(20.0),
            borderSide:  BorderSide(color: Colors.green,width: 3 )

        ),
      ),
    );
  }
}
