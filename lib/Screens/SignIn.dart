import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/CustomWidgets/Alerts.dart';
import 'dart:async';
import 'NavScreen.dart';
import 'UpdateMyPassword/UpdatePw.dart';
import 'WelcomeScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';


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
  TextEditingController controller1=TextEditingController();
  TextEditingController controller2=TextEditingController();
  String email ='';
  String password ='';

  Future<void> SignIn() async{
    email=controller1.text;
    password=controller2.text;
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password).then((value){
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context)=>MainPage(),
          ),
        );

      });

    } on FirebaseAuthException catch(e) {
      showErrorDialog(context);

    }

  }




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
                            ElevatedButton(onPressed: (){},
                              child: InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => UpdatePw(),
                                    ),
                                  );
                                },
                                child:
                                Text(
                                  "Şifremi Unuttum",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16,
                                      color: Colors.white70),
                                ),
                              )

                            ),
                          ],
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: Colors.greenAccent.shade700
                          ),
                          onPressed: (){
                            SignIn();
                          },
                            child: Text("Giriş Yap!",style: TextStyle(
                                color: Colors.black,
                                letterSpacing: 2,
                                fontWeight: FontWeight.bold,
                                fontSize: 18)),
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
      controller: controller2,
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
      controller: controller1,
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
