import 'package:flutter/material.dart';
import './model.dart';
import './text_style.dart';

class Separator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
        margin: new EdgeInsets.symmetric(vertical: 8.0),
        height: 2.0,
        width: 18.0,
        color: new Color(0xff00c6ff)
    );
  }
}


class DetailPage extends StatelessWidget {
  final Planet planet;

  DetailPage(this.planet);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text(planet.name)),

      body: new Container(
        constraints: new BoxConstraints.expand(),
        color: new Color(0xFF736AB7),
        child:new ListView(
          padding: new EdgeInsets.fromLTRB(0.0, 72.0, 0.0, 32.0),
          children: <Widget>[
            //new Text(planet.name),
            //detail page的news圖片
            new Hero(//只要加上Hero就可以做動畫了
              tag: "News-id${planet.id}",
              child: new Image.asset(
                planet.image,
                width: 96.0,
                height: 96.0,
              ),
            ),
            new Padding(padding: new EdgeInsets.all(8.0),),
            new Container(
              margin : new EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 0.0),
              child: new Text(planet.location ,
                style: Style.headerTextStyle,),
            ),

            new Separator(),
            new Padding(padding: new EdgeInsets.all(8.0),),

            new Container(
               margin : new EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 0.0),
                child: new Text(
                planet.description, style: Style.contextTextStyle),
            ),
          ],
        ),
      ),
    );
  }
}



