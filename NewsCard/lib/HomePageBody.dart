import 'package:flutter/material.dart';
import 'model.dart';
import 'text_style.dart';

class HomePageBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new PlanetRow(planets[0]);
  }
}

class PlanetRow extends StatelessWidget {

  final Planet planet;//宣告放news的list
  PlanetRow(this.planet);//constructor

  @override
  Widget build(BuildContext context) {

    //NEWS圖片
    final planetThumbnail = new Container(
      margin: new EdgeInsets.symmetric(
          vertical: 16.0
      ),
      alignment: FractionalOffset.centerLeft,
      child: new Image(
        image: new AssetImage(planet.image),
        height: 92.0,
        width: 92.0,
      ),
    );

    //卡裡面的內容
    final planetCardContent = new Container(
      margin: new EdgeInsets.fromLTRB(76.0, 16.0, 16.0, 16.0),
      constraints: new BoxConstraints.expand(),
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          new Container(height: 4.0),
          new Text(planet.name,
            style: Style.titleTextStyle,
          ),
          new Container(height: 10.0),
          new Text(planet.location,
              style: Style.commonTextStyle

          ),
          new Container(
              margin: new EdgeInsets.symmetric(vertical: 8.0),
              height: 2.0,
              width: 18.0,
              color: new Color(0xff00c6ff)
          ),


        ],
      ),
    );


    //主題卡
    final planetCard = new Container(
      child: planetCardContent,
      height: 120.0,
      margin: new EdgeInsets.only(left: 46.0),
      decoration: new BoxDecoration(
        color: Colors.purple,
        shape: BoxShape.rectangle,
        borderRadius: new BorderRadius.circular(8.0),
        boxShadow: <BoxShadow>[
          new BoxShadow(
            color: Colors.black26,
            blurRadius: 10.0,
            offset: new Offset(0.0, 10.0),
          ),
        ],
      ),
    );



    return new Container(
        margin: const EdgeInsets.symmetric(
      vertical: 16.0,
      horizontal: 24.0,
    ),

      child: new Stack(
            children: <Widget>[
                planetCard,
                planetThumbnail,

              ],
      )
    );
  }
}
