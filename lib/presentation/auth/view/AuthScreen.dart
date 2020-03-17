import 'package:flutter/material.dart';

class AuthScreen extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _AuthScreenState();
  }
}

class _AuthScreenState extends State<AuthScreen> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Авторизация"),
      ),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            TextFormField(
              maxLines: 1,
              initialValue: "oktrus@gmail.com",
              decoration: InputDecoration(
                enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey,
                      width: 0.5,
                    )),
                labelText: "Введите email",
              ),
            ),
            TextFormField(
              maxLines: 1,
              initialValue: "qwe123",
              textInputAction: TextInputAction.done,
              decoration: InputDecoration(
                enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey,
                      width: 0.5,
                    )),
                labelText: "Введите пароль",
              ),
            ),
            RaisedButton(
              child: Text("Войти"),
              color: Colors.green,
              textColor: Colors.white,
              onPressed: () {
                print("clicked");
              },
            ),
            Spacer(),
            RaisedButton(
              color: Colors.green,
              textColor: Colors.white,
              child: Text("Регистрация"),
              onPressed: () {
                print("clicked");
              },
            ),
          ],
        ),
      ),
    );
  }
}