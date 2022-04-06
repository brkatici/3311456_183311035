import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


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
              Text("realjason@example.com",style: TextStyle(color: Colors.amber.shade700,fontSize: 16,letterSpacing: 0.4)),
              Container(
                padding: EdgeInsets.only(top: 50.0),
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
                    "Profil Bilgileri",
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
                  child: Text(
                    "Vücut Ölçülerim",
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
                  child: Text(
                    "Mevcut - Hedef Kalorilerim",
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
                  child: Text(
                    "Yardım",
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
                  child: Text(
                    "Gizlilik & Koşullar",
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
