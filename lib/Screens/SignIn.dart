import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'NavScreen.dart';
import 'WelcomeScreen.dart';


class SignInForm extends StatefulWidget {
  @override
  _SignInFormState createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {

  @override

  void initState() {
    // TODO: implement initState
    super.initState();
    startTimer();
  }
  startTimer() async {
    var duration = new Duration(seconds:9000);
    return new Timer(duration, route);
  }
  route() {
    Navigator.pushReplacement(context, MaterialPageRoute(
        builder: (context) => MainPage()
    )
    );
  }

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(

      onWillPop: ()async{
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
            title: Text('Giriş Yap',),

          ),
          backgroundColor: Colors.grey.shade800,
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
                            backgroundImage: AssetImage('lib/images/Jason.jpg'),
                            child: Container(
                              padding: EdgeInsets.only(top: 100,left: 128),
                              child: Icon(Icons.add_a_photo_outlined,color: Colors.black,size: 48,),
                            ),
                          ),
                        ),
                        SizedBox(height: 40.0,),
                        Container(
                          padding: EdgeInsets.only(right: 20,left: 20),
                          child:buildEmailFormField(),
                        ),

                        SizedBox(height: 15.0,),
                        Container(
                          padding: EdgeInsets.only(right: 20,left: 20),
                          child:buildPasswordFormField(),
                        ),
                        SizedBox(height: 15.0,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Beni Hatırla',style: TextStyle(color: Colors.white,fontSize: 16),),
                            Checkbox(value: true,
                                checkColor: Colors.indigoAccent.shade700,
                                activeColor: Colors.amber,
                                onChanged: (value){
                                  setState(() {
                                    value=true;
                                  });
                                }),
                          ],
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: Colors.greenAccent.shade700
                          ),
                          child: Text("Giriş Yap!", style: TextStyle(color: Colors.white,fontSize: 18),),
                          onPressed: () {
                              route(); // Route fonksiyonunu çağırıp main page e gidiyorum.
                          },
                        ),
                      ],
                    ),
                  )

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
      // Şifrenin * şeklinde görünmesi
      obscureText: true,
      decoration: InputDecoration(

        errorStyle: TextStyle(color: Colors.white,fontSize: 15),
        label: const Center(
          child: Text("Şifre",
            style: TextStyle(color: Colors.amberAccent, fontWeight: FontWeight.bold , fontSize: 18),),

        ),
        enabledBorder: new OutlineInputBorder(
            borderRadius: new BorderRadius.circular(20.0),
            borderSide:  BorderSide(color: Colors.pinkAccent,width: 3 )

        ),
      ),
    );
  }
  TextFormField buildEmailFormField() {
    return TextFormField(
      style: TextStyle(color: Colors.white,fontSize: 18),
      decoration: InputDecoration(
        errorStyle: TextStyle(color: Colors.white,fontSize: 15),
        label: const Center(
          child: Text("E-Mail",
            style: TextStyle(color: Colors.amberAccent, fontWeight: FontWeight.bold , fontSize: 18),),
        ),
        enabledBorder: new OutlineInputBorder(
            borderRadius: new BorderRadius.circular(20.0),
            borderSide:  BorderSide(color: Colors.pinkAccent,width: 3 )

        ),

      ),
    );
  }
}
