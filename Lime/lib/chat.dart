import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import './pages/chat_screen.dart';
import './models/chat_model.dart';

class Chat extends StatefulWidget {
  @override
  State createState() => new ChatWindow();
}

const String defaultUserName = "Rex";

int reply=0;//目前適不適回復狀態

class ChatWindow extends State<Chat> with TickerProviderStateMixin {
  final List<Msg> _messages = <Msg>[];
  final TextEditingController _textController = new TextEditingController();
  bool _isWriting = false;

  @override
  Widget build(BuildContext ctx) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("${dummyData[index].name}"),
        elevation:
        Theme.of(ctx).platform == TargetPlatform.iOS ? 0.0 : 6.0,
      ),
      body: new Column(children: <Widget>[
        new Flexible(
            child: new ListView.builder(
              itemBuilder: (_, int index) => _messages[index],
              itemCount: _messages.length,
              reverse: true,
              padding: new EdgeInsets.all(6.0),
            )),
        new Divider(height: 1.0),
        new Container(
          child: _buildComposer(),
          decoration: new BoxDecoration(color: Theme.of(ctx).cardColor),
        ),
      ]),
    );
  }


  Widget _buildComposer() {
    return new IconTheme(
      data: new IconThemeData(color: Theme.of(context).accentColor),
      child: new Container(
          margin: const EdgeInsets.symmetric(horizontal: 9.0),
          child: new Row(
            children: <Widget>[
              new Flexible(
                child: new TextField(
                  controller: _textController,
                  onChanged: (String txt) {
                    setState(() {
                      _isWriting = txt.length > 0;
                    });
                  },
                  onSubmitted: _submitMsg,
                  decoration:
                  new InputDecoration.collapsed(hintText: "Enter some text to send a message"),
                ),
              ),
              new Container(
                  margin: new EdgeInsets.symmetric(horizontal: 3.0),
                  child: Theme.of(context).platform == TargetPlatform.iOS
                      ? new CupertinoButton(
                      child: new Text("Submit"),
                      onPressed: _isWriting ? () => _submitMsg(_textController.text)
                          : null
                  )
                      : new IconButton(
                    icon: new Icon(Icons.message),
                    onPressed:
                    /*_isWriting
                        ? () => _submitMsg(_textController.text)
                        : null,*/
                    _isWriting
                        ? () => Reply(_textController.text)
                        : null,
                  )
              ),
            ],
          ),
          decoration: Theme.of(context).platform == TargetPlatform.iOS
              ? new BoxDecoration(
              border:
              new Border(top: new BorderSide(color: Colors.brown))) :
          null
      ),
    );
  }
  void Reply(String txt){

    _submitMsg(_textController.text);

    if(index%2==0) {
      reply=1;
      _submitMsg("reply");
      reply=0;
    }
  }

  void _submitMsg(String txt) {
    var now = new DateTime.now();
    dummyData[index].time = "${now.hour+8}:${now.minute}";
    dummyData[index].message=txt;

    _textController.clear();
    setState(() {
      _isWriting = false;
    });

    Msg msg ;
    if(reply==0) {
      msg = new Msg(
        txt: txt,
        animationController: new AnimationController(
            vsync: this,
            duration: new Duration(milliseconds: 800)
        ),
      );
    }
  else{
      msg = new ReplyMsg(
        txt: txt,
        animationController: new AnimationController(
            vsync: this,
            duration: new Duration(milliseconds: 800)
        ),
      );

    }
    setState(() {
      _messages.insert(0, msg);
    });
    msg.animationController.forward();

  }

  @override
  void dispose() {
    for (Msg msg in _messages) {
      msg.animationController.dispose();
    }
    super.dispose();
  }

  //------------------


}

class Msg extends StatelessWidget {
  Msg({this.txt, this.animationController});
  final String txt;
  final AnimationController animationController;

  @override
  Widget build(BuildContext ctx) {
    return new SizeTransition(
      sizeFactor: new CurvedAnimation(
          parent: animationController, curve: Curves.easeOut),
      axisAlignment: 12.0,
      child: new Container(
        margin: const EdgeInsets.symmetric(vertical: 8.0),//每個訊息的空隙
        child: new Row(
          crossAxisAlignment: CrossAxisAlignment.start,///這裡
          children: <Widget>[
            new Container(
              margin: const EdgeInsets.only(right: 8.0),
              child: new CircleAvatar(child: new Text(defaultUserName[0])),
            ),
            new Expanded(
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  new Text(defaultUserName, style: Theme.of(ctx).textTheme.subhead),
                  new Container(
                    margin: const EdgeInsets.only(top: 6.0),
                    child: new Text(txt),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//------------------ReplyMsg
class ReplyMsg extends Msg {
  ReplyMsg({this.txt, this.animationController});
  final String txt;
  final AnimationController animationController;

  @override
  Widget build(BuildContext ctx) {
    return new SizeTransition(
      sizeFactor: new CurvedAnimation(
          parent: animationController, curve: Curves.easeOut),
      axisAlignment: 12.0,
      child: new Container(
        margin: const EdgeInsets.symmetric(vertical: 8.0),//每個訊息的空隙
        child: new Row(
          crossAxisAlignment: CrossAxisAlignment.start,///這裡
          children: <Widget>[

            new Expanded(
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  new Text(dummyData[index].name, style: Theme.of(ctx).textTheme.subhead),
                  new Container(
                    margin: const EdgeInsets.only(top: 6.0),
                    child: new Text(txt),
                  ),
                ],
              ),
            ),
            new Container(
              margin: const EdgeInsets.only(right: 8.0),
              child: new CircleAvatar(backgroundImage: new AssetImage(dummyData[index].avatarUrl)),//new Text(defaultUserName[0])),
            ),
          ],
        ),
      ),
    );
  }
}