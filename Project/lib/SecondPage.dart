import 'package:flutter/material.dart';

class Second extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
    body: new Stack(
    fit: StackFit.expand,
      children: <Widget>[
            new Image.asset(
              'assets/weather.png',
              fit: BoxFit.cover,



            ),

            new Center(
          child: new Icon(Icons.local_pizza, size: 150.0, color: Colors.teal)
      )
      ],

    )


    );


    /*
    return new Container(
      child: new Center(
        child: new Icon(Icons.favorite, size: 150.0, color: Colors.redAccent)
      )
    );*/
  }
}