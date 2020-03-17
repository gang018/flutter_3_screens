
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ProfileScreenState();
  }
}

class _ProfileScreenState extends State<ProfileScreen> {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Профиль"),
      ),
      body: Container(
        padding: EdgeInsets.all(8.0),
        color: Colors.red,
      ),
    );
  }
}