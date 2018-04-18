import 'package:flutter/material.dart';

void main() {
  runApp(new FriendlychatApp());
}

class FriendlychatApp extends StatelessWidget {//APP的主要進入點
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "Friendlychat",
      theme: new ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.lightBlue[800],
        accentColor: Colors.cyan[600],
      ),
      home: new ChatScreen(),
    );
  }
}

class ChatScreen extends StatefulWidget {                     //modified
  @override                                                        //new
  State createState() => new ChatScreenState();                    //new
}

// Add the ChatScreenState class definition in main.dart.

class ChatScreenState extends State<ChatScreen> {
  //new


  //主體 build

  @override //new
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
          title: new Text("Lime")
      ),

      body: new Column(
        children: <Widget>[
          new Flexible(//顯示大家的message
            child: new ListView.builder(
              padding: new EdgeInsets.all(7.0),//邊邊要留的空白
              reverse: true,//因為list要從新的到舊的印出來
              itemBuilder: (_, int index) => globalmessages[index],//_表示unused，
              itemCount: globalmessages.length,//訊息長度
            ),
          ),
          new Divider(height: 5.0),//分隔線
          new Container(//自己目前要打的message
            decoration: new BoxDecoration(
                color: Theme.of(context).cardColor),
            child: _buildTextComposer(),
          ),
        ],
      ),
    );
  }



//文字輸入框
  final List<ChatMessage> globalmessages = <ChatMessage>[];//globalmessage代表要顯示的所有訊息
  final TextEditingController _textController = new TextEditingController();

  void _handleSubmitted(String text) {
    //submit message要做的事情
    _textController.clear();//清掉textfield的

    //並加入messagelist以顯示在螢幕上
    ChatMessage mymessage = new ChatMessage(
      text: text,
    );
    setState(() {//在這裡動態顯示message(用setstate告訴famework知道這個部分被改變)
      globalmessages.insert(0,mymessage);
    });
  }

  Widget _buildTextComposer() {
    return new IconTheme( //new
      data: new IconThemeData(color: Theme
          .of(context)
          .accentColor), //new
      child: new Container( //modified
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        child: new Row(
          children: <Widget>[
            new Flexible(
              child: new TextField(
                controller: _textController,
                onSubmitted: _handleSubmitted,
                decoration: new InputDecoration.collapsed(
                    hintText: "從這裡輸入"),
              ),
            ),
            new Container(
              margin: new EdgeInsets.symmetric(horizontal: 4.0),
              child: new IconButton(
                  icon: new Icon(Icons.markunread),
                  onPressed: () => _handleSubmitted(_textController.text)),
            ),
          ],
        ),
      ),
    );
  }
}

//----------------------message display
const String _name = "rex662624";//名字


class ChatMessage extends StatelessWidget {//聊天時顯示的訊息格式
  ChatMessage({this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return new Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      child: new Row(
        crossAxisAlignment: CrossAxisAlignment.start,//自動對齊用的
        children: <Widget>[
          new Container(
            margin: const EdgeInsets.only(right: 16.0),
            child: new CircleAvatar(child: new Text(_name[0])),//圓形的大頭貼(會顯示name的第一個字元 所以用name[0])
          ),
          new Column(//包起來的部分合成一個container
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              new Text(_name, style: Theme.of(context).textTheme.subhead),
              new Container(
                margin: const EdgeInsets.only(top: 5.0),
                child: new Text(text),
              ),
            ],
          ),
        ],
      ),
    );
  }
}