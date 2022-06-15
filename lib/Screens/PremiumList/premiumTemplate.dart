import "package:flutter/material.dart";
import "./premiumModel.dart";
import "./premiumFullSize.dart";
class Premium extends StatelessWidget {
  final PremiumModel _premium;

  Premium(this._premium);

  @override
  Widget build(BuildContext context) {
    /// inkwell in ontap metodunu page routing için kullandım
    return InkWell(
      onTap: () =>  Navigator.push(context, MaterialPageRoute(builder: (context) => PremiumDetail(_premium))),
      child: Container(
        padding: EdgeInsets.all(10),
        child: Row(
          children: <Widget>[
            /// Hero animasyonu kullanabilmek için Hero Widget ve tag tanımladık.
            Hero(
              tag: "avatar_" + _premium.id.toString(),
              child: CircleAvatar(
                radius: 32,
                backgroundImage: AssetImage(_premium.avatar),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(_premium.name),
            )
          ],
        ),
      ),
    );
  }
}