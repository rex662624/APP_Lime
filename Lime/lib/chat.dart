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
//TickerProviderStateMixin : 為了做訊息的animation
class ChatWindow extends State<Chat> with TickerProviderStateMixin {
  final List<Msg> _messages = <Msg>[];
  final TextEditingController _textController = new TextEditingController();

  //處理如果沒有輸入訊息就不能送出
  bool _isWriting = false;

//-----主要的build---------------------
  @override
  Widget build(BuildContext ctx) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("${dummyData[index].name}"),
        elevation: 6.0,
      ),
      body: new Column(children: <Widget>[
        //顯示message的地方
        new Flexible(
            child: new ListView.builder(//ListView這個東西內建滾動捲軸
              itemBuilder: (_, int index) => _messages[index],//對每個message做...
              itemCount: _messages.length,
              reverse: true,
              padding: new EdgeInsets.all(6.0),
            )),

        //分隔線
        new Divider(height: 1.0),

        //文字框
        new Container(
          child: _buildComposer(),
          decoration: new BoxDecoration(color: Theme.of(ctx).cardColor),
        ),
      ]),
    );
  }
//-----------------------------------


//我們在輸入文字的框框
  Widget _buildComposer() {
    return new IconTheme(//表示包在裡面出現icon就要用IconThemeData(下一行)這個theme
      data: new IconThemeData(color: Theme.of(context).accentColor),
      child: new Container(
          margin: const EdgeInsets.symmetric(horizontal: 9.0),//設定邊框水平間距
          child: new Row(//因為文字和按鈕是一個row
            children: <Widget>[
              //文字部分
              new Flexible(//被這個包住表示他使用的空間是別人剩下的
                child: new TextField(
                  controller: _textController,
                  onChanged: (String txt) {//如果有人刪除會是輸入文字，去改變_iswriting的值
                    setState(() {
                      _isWriting = txt.length > 0;
                    });
                  },
                  //onSubmitted: _submitMsg,//如果要交出訊息就呼叫這個函數
                  decoration://在輸入框顯示的提示
                  new InputDecoration.collapsed(hintText: "輸入訊息..."),
                ),
              ),
              //按鈕部分
              new Container(
                  margin: new EdgeInsets.symmetric(horizontal: 3.0),
                  child:
                  new IconButton(
                    icon: new Icon(Icons.message),
                    onPressed:
                    //如果有人輸入訊息才送出 注意這裡如果設定為NULL 按鈕的顏色會自動變灰色
                    _isWriting ? () => Reply(_textController.text) : null,
                  )
              ),
            ],
          ),

      ),
    );
  }

  //----------按鈕按下去就要呼叫這個
  void Reply(String txt){

    _submitMsg(_textController.text);
    //設定一些人可以自動回覆 reply=1表示目前要顯示的訊息是回覆者的 否則就是顯示使用者打的訊息
    if(index%2==0) {
      reply=1;
      _submitMsg("reply");//這裡是每個人回覆的訊息
      reply=0;
    }
  }

  //回復訊息做的動作
  void _submitMsg(String txt) {
    //設定回覆的時間為現在
    var now = new DateTime.now();
    dummyData[index].time = "${now.hour+8}:${now.minute}";
    //設定最後一個訊息是剛剛打的
    dummyData[index].message=txt;

    //把訊息欄的字刪除
    _textController.clear();
    setState(() {
      _isWriting = false;
    });

    Msg msg ;
    //reply=1表示目前要顯示的訊息是回覆者的 否則就是顯示使用者打的訊息
    if(reply==0) {
      msg = new Msg(
        txt: txt,
        animationController: new AnimationController(
            vsync: this,//把目前的窗口狀態保存下來，讓動畫完成週期
            duration: new Duration(milliseconds: 800)//持續800ms
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
//把resource 釋放掉，ChatScreenState不再使用時會被用
  @override
  void dispose() {
    for (Msg msg in _messages) {
      msg.animationController.dispose();
    }
    super.dispose();
  }

}

//---------------------------顯示每個message講了甚麼話

class Msg extends StatelessWidget {
  //constructor
  Msg({this.txt, this.animationController});//notice

  final String txt;
  final AnimationController animationController;

  @override
  Widget build(BuildContext ctx) {
    return new SizeTransition(
      sizeFactor: new CurvedAnimation(parent: animationController, curve: Curves.easeOut),
      axisAlignment: 12.0,
      child: new Container(
        margin: const EdgeInsets.symmetric(vertical: 8.0),//每個訊息的空隙

        //每個訊息是一個row
        child: new Row(
          crossAxisAlignment: CrossAxisAlignment.start,//從Start對齊
          children: <Widget>[
            //Row的一開始是頭像
            new Container(
              margin: const EdgeInsets.only(right: 8.0),
              child: new CircleAvatar(child: new Text(defaultUserName[0])),
            ),
            //頭像後面的文字與時間
            new Expanded(
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  //輸入者的名字
                  new Text(defaultUserName, style: Theme.of(ctx).textTheme.subhead),
                  //輸入的文字
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
//------------------------------------------

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