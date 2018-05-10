import 'package:flutter/material.dart';
import 'chatmessage.dart';
class Chat extends StatefulWidget{
  @override
  State createState() => new ChatState();
}
class ChatState extends State<Chat> with SingleTickerProviderStateMixin{
  final TextEditingController _textController = new TextEditingController();
  final List<ChatMessage> _messages = <ChatMessage> [];
  void _handleSubmitted(String text){
    _textController.clear();
    ChatMessage message = new ChatMessage(
      text: text,
    );
    setState(() {
      _messages.insert(0, message);
    });
  }

  /*Animation<double> _iconAnimation;
  AnimationController _iconAnimationController;
  @override
  void initState() {
    super.initState();
    _iconAnimationController=new AnimationController(vsync: this,duration: new Duration(milliseconds: 800));
    _iconAnimation=CurvedAnimation(parent: _iconAnimationController, curve: Curves.bounceOut);
    _iconAnimation.addListener(() => this.setState(() {}));
    _iconAnimationController.forward();
  }*/

  Widget _textComposerWidget(){
    return new IconTheme(
      data: new IconThemeData(
        color:  Colors.blue
      ),
      child: new Container(
        margin: const EdgeInsets.symmetric(horizontal:  8.0),
        child: new Row(
          children: <Widget>[
            new Flexible(
              child: new TextField(
              decoration: new InputDecoration.collapsed(hintText: "Send a message"),
              controller: _textController,
              onSubmitted: _handleSubmitted,
            ),
            ),
            new Container(
              margin: const EdgeInsets.symmetric(horizontal:  4.0),
              child: new IconButton(
                  icon: new Icon(Icons.send),
                  onPressed: () => _handleSubmitted(_textController.text)
              ),
              ),
            ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context){
  return Scaffold(
  appBar: AppBar(
  backgroundColor: Theme.of(context).accentColor,
  title: Text("Chat room"),
  ),

   body:new Column(
     children: <Widget>[
       new Flexible(
           child: new ListView.builder(
             padding: new EdgeInsets.all(8.0),
             reverse: true,
             itemBuilder: (_,int index) => _messages[index],
             itemCount: _messages.length,
           )
       ),
       new Divider(height: 1.0,),
       new Container(
         decoration:  new BoxDecoration(
           color: Theme.of(context).cardColor,
         ),
         child: _textComposerWidget(),
       )
     ],
   )
  );
  }
}