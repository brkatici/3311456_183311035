import 'package:flutter/material.dart';
showAlertDialog(BuildContext context) {

  // set up the buttons
  Widget continueButton = TextButton(
    child: Text("Gönder"),
    onPressed:  () {Navigator.of(context).pop();},
  );
  Widget cancelButton = TextButton(
    child: Text("İptal"),
    onPressed:  () {Navigator.of(context).pop();},
  );
  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("Bildirim Gönderme İzni"),
    content: Text("Su Takibi tarafından size bildirim gönderilsin mi ?"),
    actions: [
      continueButton,
      cancelButton
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

showPwChangeDialog(BuildContext context) {

  // set up the buttons
  Widget continueButton = TextButton(
    child: Text("Değiştir"),
    onPressed:  () {Navigator.of(context).pop();},
  );
  Widget cancelButton = TextButton(
    child: Text("İptal"),
    onPressed:  () {Navigator.of(context).pop();},
  );
  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("Şifre Değiştirme"),
    content: Text("Şifreniz değiştirilsin mi ?"),
    actions: [
      continueButton,
      cancelButton
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

showErrorDialog(BuildContext context) {

  // set up the buttons
  Widget continueButton = TextButton(
    child: Text("Tamam"),
    onPressed:  () {Navigator.of(context).pop();},
  );
  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("Hata"),
    content: Text("Bilgiler yanlış lütfen tekrar deneyin"),
    actions: [
      continueButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
