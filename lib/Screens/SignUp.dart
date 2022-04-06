import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'NavScreen.dart';
import 'WelcomeScreen.dart';


class SignUpForm extends StatefulWidget {
  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {

  @override

  void initState() {
    // TODO: implement initState
    super.initState();
    startTimer(); // Route  için bir timer başlatıyorum
  }
  startTimer() async { // Timer ayarları için fonksiyon
    var duration = new Duration(seconds:9000);
    return new Timer(duration, route); // Timer`ın nereyi etkileyeceği
  }
  route() { //MainPage`e navigate eden fonksiyon
    Navigator.pushReplacement(context, MaterialPageRoute(
        builder: (context) => MainPage()
    )
    );
  }

  //Global key daha sonrasında database işlemleri için formu özelleştirmemi sağladı.
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
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
            backgroundColor: Colors.indigo.shade300,
            title: Text('Kayıt-Ol',),

          ),
          backgroundColor: Colors.indigo,
          resizeToAvoidBottomInset: false,
          body: Container(
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
                            primary: Colors.amber
                        ),
                        child: Text("Kaydol", style: TextStyle(color: Colors.indigoAccent.shade700,fontSize: 18),),
                          onPressed: () {
                            route();
                          }

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
