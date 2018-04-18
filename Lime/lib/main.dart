import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

void main() {
  runApp(new FriendlychatApp());
}

class FriendlychatApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "Friendlychat",
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
      body: _buildTextComposer(), //文字輸入處
    );
  }

//文字輸入框
  final TextEditingController _textController = new TextEditingController();

  void _handleSubmitted(String text) {
    //submit message要做的事情
    _textController.clear();
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
      ), //new
    );
  }
}