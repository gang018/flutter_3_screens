import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_3_screens/di/RepositoryProvider.dart';
import 'package:flutter_3_screens/presentation/auth/presenter/SignUpPresenter.dart';
import 'package:flutter_3_screens/presentation/profile/view/ProfileScreen.dart';

class SignUpScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => SignUpState();
}

class SignUpState extends State<SignUpScreen> {

  SignUpPresenter _presenter;

  TextEditingController _mailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _surnameController = TextEditingController();
  TextEditingController _patronicController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _nicknameController = TextEditingController();

  @override
  void initState() {
    super.initState();

    _presenter = SignUpPresenter(RepositoryProvider().getProfileRepo());
    _presenter.bindView(this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Регистрация"),
      ),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: SingleChildScrollView(
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
                focusNode: ,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.grey,
                        width: 0.5,
                      )),
                  labelText: "Введите пароль",
                ),
              ),
              TextFormField(
                maxLines: 1,
                controller: _nameController,
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.grey,
                        width: 0.5,
                      )),
                  labelText: "Введите имя",
                ),
              ),
              TextFormField(
                maxLines: 1,
                controller: _surnameController,
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.grey,
                        width: 0.5,
                      )),
                  labelText: "Введите фамилию",
                ),
              ),
              TextFormField(
                maxLines: 1,
                controller: _patronicController,
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.grey,
                        width: 0.5,
                      )),
                  labelText: "Введите отчество",
                ),
              ),
              TextFormField(
                maxLines: 1,
                controller: _phoneController,
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.grey,
                        width: 0.5,
                      )),
                  labelText: "Введите телефон",
                ),
              ),
              TextFormField(
                maxLines: 1,
                controller: _nicknameController,
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.grey,
                        width: 0.5,
                      )),
                  labelText: "Введите никнейм",
                ),
              ),
              RaisedButton(
                child: Text("Зарегистрироваться"),
                color: Colors.green,
                textColor: Colors.white,
                onPressed: () => _presenter.handleSignUpClick(
                    email: _mailController.text,
                    password: _passwordController.text,
                    name: _nameController.text,
                    surname: _surnameController.text,
                    patronymic_name: _patronicController.text,
                    phone: _phoneController.text,
                    nickname: _nicknameController.text
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void showProfile() {
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (BuildContext context) => ProfileScreen()),
        (until) => until == null,
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
}