import 'package:flutter/material.dart';
import './DetailPage.dart';
import 'model.dart';
import 'text_style.dart';

class HomePageBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Expanded(
      //表示自動計算占的空間

      child: new Container(
        color: Colors.indigo[400],
        child: new ListView.builder(
          itemBuilder: (context, index) =>
              new PlanetRow(planets[index]), //用list一個一個印出來
          itemCount: planets.length,
        ),
      ),
    );
  }
}

class PlanetRow extends StatelessWidget {

  final Planet planet; //宣告放news的list
  PlanetRow(this.planet); //constructor

  @override
  Widget build(BuildContext context) {
    //一開始頁面的NEWS圖片
    final planetThumbnail = new Container(
      margin: new EdgeInsets.symmetric(vertical: 16.0),
      alignment: FractionalOffset.centerLeft,
      child:  new Hero(//做動畫用的
                tag: "News-id${planet.id}",
                child: new Image(
        image: new AssetImage(planet.image),
        height: 92.0,
        width: 92.0,
      ),
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
          new Text(
            planet.name,
            style: Style.titleTextStyle,
          ),
          new Container(height: 10.0),
          new Text(planet.location, style: Style.commonTextStyle),
          new Container(
              margin: new EdgeInsets.symmetric(vertical: 8.0),
              height: 2.0,
              width: 18.0,
              color: new Color(0xff00c6ff)),
        ],
      ),
    );

    //主題卡
    final planetCard = new Container(
      child: planetCardContent,
      height: 120.0,
      margin: new EdgeInsets.only(left: 46.0),
      decoration: new BoxDecoration(
        color: Colors.deepPurple,
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


    return new GestureDetector(
        onTap: () => Navigator.of(context).push(
            new PageRouteBuilder(//自己建立新頁面
                pageBuilder: (_, __, ___) => new DetailPage(planet),)
        ),
        child: new Container(
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
        )
    );
  }
}


