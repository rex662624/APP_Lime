import 'package:flutter/material.dart';
import './model.dart';
import 'package:flutter/cupertino.dart';

class FriendHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Container(
        color: Colors.teal[100],
        child:
        new ListView.builder(
          itemCount: FriendData.length,
          itemBuilder: (context, i) => new Column(
                //對每個list上的人做......
                children: <Widget>[
                  new Divider(
                    //分隔線
                    height: 20.0,
                  ),
                  new ListTile(
                    leading: new CircleAvatar(
                      //listtile最左邊的東西
                      foregroundColor: Theme.of(context).primaryColor,
                      backgroundColor: Colors.grey,
                      backgroundImage: new AssetImage(FriendData[i]
                          .avatarUrl), //new NetworkImage(dummyData[i].avatarUrl),
                    ),
                    title:
                        new Text(
                          FriendData[i].name,
                          style: new TextStyle(fontWeight: FontWeight.bold,color: Colors.deepPurple, fontSize: 20.0),
                        ),

                  )
                ],
              ),
        ),
      ),
    );
  }
}
