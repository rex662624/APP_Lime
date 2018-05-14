import 'package:flutter/material.dart';
import './login.dart';
import './whatsapp_home.dart';


void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "Lime",
      theme: new ThemeData(
        primaryColor: Colors.greenAccent[400],
        accentColor: Colors.purple,//new Color(0xff25D366),
      ),
      debugShowCheckedModeBanner: false,//把debug 右上那個拿掉
      home: new LoginPage(),
      routes: {
        "route":(_)=>new WhatsAppHome(),
      },
    );
  }
}
