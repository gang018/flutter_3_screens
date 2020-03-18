import 'package:flutter/material.dart';
import 'package:flutter_3_screens/di/RepositoryProvider.dart';
import 'package:flutter_3_screens/presentation/auth/presenter/AuthPresenter.dart';
import 'package:flutter_3_screens/presentation/auth/view/SignUpScreen.dart';
import 'package:flutter_3_screens/presentation/profile/view/ProfileScreen.dart';

class AuthScreen extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => AuthScreenState();
}

class AuthScreenState extends State<AuthScreen> {

  AuthPresenter _presenter;

  TextEditingController _mailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();

    _presenter = AuthPresenter(RepositoryProvider().getProfileRepo());
    _presenter.bindView(this);
  }

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
              controller: _mailController,
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
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
              controller: _passwordController,
              keyboardType: TextInputType.visiblePassword,
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
              onPressed: () => _presenter.handleSignInClick(_mailController.text, _passwordController.text),
            ),
            Spacer(),
            RaisedButton(
              color: Colors.green,
              textColor: Colors.white,
              child: Text("Регистрация"),
              onPressed: () => _presenter.handleSignUpClick(),
            ),
          ],
        ),
      ),
    );
  }

  void showError() {
    showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: Text("Ошибка авторизации"),
        actions: <Widget>[
          MaterialButton(
            child: Text("OK"),
            onPressed: () => Navigator.of(context).pop(),
          )
        ],
      ),
    );
  }

  void showSignUp() {
    Navigator.of(context).push(
        MaterialPageRoute(builder: (BuildContext context) => SignUpScreen())
    );
  }

  void showProfile() {
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (BuildContext context) => ProfileScreen())
    );
  }
}