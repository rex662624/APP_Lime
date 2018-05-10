import 'package:flutter/material.dart';
import 'login.dart';
void main() => runApp(new FlutterApp());

class FlutterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return new MaterialApp(
      title: "FlutterApp",
      theme: new ThemeData(
        primarySwatch: Colors.blueGrey
      ),
      home: new LoginPage()
       );
}
}
