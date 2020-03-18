import 'package:flutter/material.dart';
import 'package:flutter_3_screens/data/profile/ProfileRepository.dart';
import 'package:flutter_3_screens/presentation/auth/view/AuthScreen.dart';
import 'presentation/profile/view/ProfileScreen.dart';

void main() {

  ProfileRepository().isSignedIn().then((isSignedIn) {
    runApp(MyApp(isSignedIn));
  });
}

class MyApp extends StatelessWidget {

  bool _userSignedIn = false;

  MyApp(this._userSignedIn);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: _userSignedIn? ProfileScreen(): AuthScreen(),
    );
  }
}