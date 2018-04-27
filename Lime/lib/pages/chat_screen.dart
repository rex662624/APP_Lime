import 'package:flutter/material.dart';
import '../models/chat_model.dart';
import 'package:flutter/cupertino.dart';
import '../chat.dart';


class ChatScreen extends StatefulWidget {
  @override
  ChatScreenState createState() {
    return new ChatScreenState();
  }
}
int index=0;
class ChatScreenState extends State<ChatScreen> {
  @override

  Widget build(BuildContext context) {
    return new ListView.builder(
      itemCount: dummyData.length,
      itemBuilder: (context, i) => new Column(//對每個list上的人做......
            children: <Widget>[
              new Divider(
                height: 10.0,
              ),
              new ListTile(
                leading: new CircleAvatar(
                  foregroundColor: Theme.of(context).primaryColor,
                  backgroundColor: Colors.grey,
                  backgroundImage: new AssetImage(dummyData[i].avatarUrl),//new NetworkImage(dummyData[i].avatarUrl),
                ),
                title: new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    new Text(
                      dummyData[i].name,
                      style: new TextStyle(fontWeight: FontWeight.bold),
                    ),
                    new Text(
                      dummyData[i].time,
                      style: new TextStyle(color: Colors.grey, fontSize: 14.0),
                    ),
                  ],
                ),
                subtitle: new Container(
                  padding: const EdgeInsets.only(top: 5.0),
                  child: new Text(
                    dummyData[i].message,
                    style: new TextStyle(color: Colors.grey, fontSize: 15.0),
                  ),
                ),
                //selected: index == i,
                onTap:
                    () {
                  setState(() {
                    index = i;
                    _pushChat();
                  });
                },


              )
            ],
          ),
    );
  }

  //-------------------


  void _pushChat() {
    print(index);
    Navigator.of(context).push(
      new MaterialPageRoute(
        builder: (context) {
          /*
          final tiles = _saved.map(
                (pair) {
              return new ListTile(
                title: new Text(
                  pair.asPascalCase,
                  style: _biggerFont,
                ),
              );
            },
          );
          final divided = ListTile
              .divideTiles(
            context: context,
            tiles: tiles,
          )
              .toList();
          */
          return new Chat();
        },
      ),
    );
  }




}



