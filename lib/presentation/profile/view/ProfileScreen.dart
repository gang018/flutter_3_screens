import 'package:flutter/material.dart';
import 'package:flutter_3_screens/data/profile/Profile.dart';
import 'package:flutter_3_screens/di/RepositoryProvider.dart';
import 'package:flutter_3_screens/presentation/auth/view/AuthScreen.dart';
import 'package:flutter_3_screens/presentation/profile/presenter/ProfilePresenter.dart';

class ProfileScreen extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => ProfileScreenState();
}

class ProfileScreenState extends State<ProfileScreen> {

  Profile _profile;
  ProfilePresenter _presenter;

  @override
  void initState() {
    super.initState();

    _presenter = ProfilePresenter(RepositoryProvider().getProfileRepo());
    _presenter.bindView(this);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Профиль"),
      ),
      body: getBody(),
    );
  }

  Widget getBody() {
    if (_profile == null) {
      return Container(
        padding: EdgeInsets.all(8.0),
      );
    }

    return Container(
      padding: EdgeInsets.all(8.0),
      width: MediaQuery. of(context). size. width,
      child: Column(
        children: <Widget>[
          Text("name = " + _profile.name),
          Text("email = " + _profile.email),
          Spacer(),
          RaisedButton(
            color: Colors.green,
            textColor: Colors.white,
            child: Text("Выход"),
            onPressed: () => _presenter.handleLogoutClick(),
          )
        ],
      ),
    );
  }

  void showProfile(Profile profile) {
    setState(() {
      _profile = profile;
    });
  }

  void showSignIn() {
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (BuildContext context) => AuthScreen())
    );
  }
}