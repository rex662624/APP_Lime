import 'package:flutter/material.dart';
import '../models/chat_model.dart';
import 'package:flutter/cupertino.dart';
import '../chat.dart';


class ChatScreen extends StatefulWidget {
  @override
  ChatScreenState createState() => new ChatScreenState();
}
int index=0;//存目前要看的那個人

class ChatScreenState extends State<ChatScreen> {//
  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
      itemCount: dummyData.length,
      itemBuilder: (context, i) => new Column(//對每個list上的人做......
            children: <Widget>[
              new Divider(//分隔線
                height: 10.0,
              ),
              new ListTile(
                leading: new CircleAvatar(//listtile最左邊的東西
                  foregroundColor: Theme.of(context).primaryColor,
                  backgroundColor: Colors.grey,
                  backgroundImage: new AssetImage(dummyData[i].avatarUrl),//new NetworkImage(dummyData[i].avatarUrl),
                ),
                title: new Row(//listtile主要的區域
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,//時間和名字中間的間隔
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
                subtitle: new Container(//會出現在below the title
                  padding: const EdgeInsets.only(top: 5.0),
                  child: new Text(
                    dummyData[i].message,
                    style: new TextStyle(color: Colors.grey, fontSize: 15.0),
                  ),
                ),
                //selected: index == i,
                onTap://如果按下了某個list要跳到聊天室  notice
                    () {
                  setState(() {
                    index = i;//表示點了 i 的聊天室
                    _pushChat();
                  });
                },


              )
            ],
          ),
    );
  }

  //-------------------


  void _pushChat() {//跳到那個人的聊天室
    print(index);
    Navigator.of(context).push(//將現在的頁面push進去並new出一個新的頁面
      new MaterialPageRoute(//新增一個route(Navigator是用來管理route)
        builder: (context) {//這個route裡面是新的chat頁面
          return new Chat();
        },
      ),
    );
  }

}



