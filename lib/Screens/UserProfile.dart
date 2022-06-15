import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:untitled/Screens/Dosya%C4%B0slemleri/SorgulamaEkran.dart';
import 'dart:async';

import 'package:untitled/Screens/ProfileScreens/ProfileInfos.dart';
import 'package:untitled/Screens/ProfileScreens/BodySizes.dart';
import 'package:untitled/Screens/ProfileScreens/Inbox.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'PremiumList/PremiumList.dart';


class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override

  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      body: Center(
        child: Container(
          child: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(top: 50),
                child: CircleAvatar(
                  radius: 80.0,
                  backgroundImage: AssetImage('lib/images/Jason.jpg'),
                ),
              ),
              SizedBox(width: 10,height: 20,),
              Text("Someonexample@gmail.com",style: TextStyle(color: Colors.amber.shade700,fontSize: 16,letterSpacing: 0.4)),
              Container(
                padding: EdgeInsets.only(top: 50.0),
                child: MaterialButton(
                  minWidth: 250,
                  height: 40,
                  onPressed: () {
                  },
                  color: Colors.grey.shade700,
                  shape: RoundedRectangleBorder(
                      side: BorderSide(
                        color: Colors.black,
                      ),
                      borderRadius: BorderRadius.circular(40)),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProfileInfos(),
                        ),
                      );
                    },
                    child:
                    Text(
                      "Profil Bilgileri",
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          color: Colors.white70),
                    ),
                  )
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 20.0),
                child: MaterialButton(
                  minWidth: 250,
                  height: 40,
                  onPressed: () {
                  },
                  color: Colors.grey.shade700,
                  shape: RoundedRectangleBorder(
                      side: BorderSide(
                        color: Colors.black,
                      ),
                      borderRadius: BorderRadius.circular(40)),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BodySizes(),
                        ),
                      );
                    },
                    child: Text(
                    "Vücut Ölçülerim",
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        color: Colors.white70),
                  ),
                ),
              ),
              ),
              Container(
                padding: EdgeInsets.only(top: 20.0),
                child: MaterialButton(
                  minWidth: 250,
                  height: 40,
                  onPressed: () {},
                  color: Colors.grey.shade700,
                  shape: RoundedRectangleBorder(
                      side: BorderSide(
                        color: Colors.black,
                      ),
                      borderRadius: BorderRadius.circular(40)),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PremiumsListed(),
                        ),
                      );
                    },
                    child: Text(
                    "Premium`a Geç",
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        color: Colors.white70),
                  ),
                  )
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 20.0),
                child: MaterialButton(
                  minWidth: 250,
                  height: 40,
                  onPressed: () {},
                  color: Colors.grey.shade700,
                  shape: RoundedRectangleBorder(
                      side: BorderSide(
                        color: Colors.black,
                      ),
                      borderRadius: BorderRadius.circular(40)),
                  child: Text(
                    "Before - After Galerisi  ",
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        color: Colors.white70),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 20.0),
                child: MaterialButton(
                  minWidth: 250,
                  height: 40,
                  onPressed: () {},
                  color: Colors.grey.shade700,
                  shape: RoundedRectangleBorder(
                      side: BorderSide(
                        color: Colors.black,
                      ),
                      borderRadius: BorderRadius.circular(40)),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SorgulamaEkran(),
                          ),
                        );
                      },
                      child:
                      Text(
                        "Mail Gönder",
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                            color: Colors.white70),
                      ),
                    )
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 20.0),
                child: MaterialButton(
                  minWidth: 250,
                  height: 40,
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>Inbox()));
                  },
                  color: Colors.grey.shade700,
                  shape: RoundedRectangleBorder(
                      side: BorderSide(
                        color: Colors.black,
                      ),
                      borderRadius: BorderRadius.circular(40)),
                  child: Text(
                    "Gelen Kutusu",
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        color: Colors.white70),
                  ),
                ),
              ),

            ],

          ),

        ),
      ),
    );
  }
}
