import 'package:flutter/material.dart';
import './pages/call_screen.dart';
import './pages/camera_screen.dart';
import './pages/chat_screen.dart';
import './pages/status_screen.dart';

class WhatsAppHome extends StatefulWidget {
  @override
  _WhatsAppHomeState createState() => new _WhatsAppHomeState();
}

class _WhatsAppHomeState extends State<WhatsAppHome> with SingleTickerProviderStateMixin {
  //TabBarView一定要建的controller 主要是控制tab間的轉換動畫等等，
  // 也是上面要繼承SingleTickerProviderStateMixin的原因
  TabController _tabController;


  @override
  void initState() {//初始化controller 還有頁面
    // TODO: implement initState
    super.initState();
    _tabController = new TabController(vsync: this, initialIndex: 1, length: 4);
  }

  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Lime"),
        elevation: 0.7,//tab的上升下降(浮起程度)
        bottom: new TabBar(
          controller: _tabController,
          indicatorColor: Colors.white,//讓你看到現在在哪個tab的那一條線
          tabs: <Widget>[
            new Tab(icon: new Icon(Icons.account_circle)),
            new Tab(text: "CHAT"),
            new Tab(
              text: "NEWS",
            ),
           /* new Tab(
              text: "CALLS",
            ),*/
          ],
        ),
        actions: <Widget>[
          new Icon(Icons.add_circle),
          new Padding(//空格 不然會擠在一起
            padding: const EdgeInsets.symmetric(horizontal: 5.0),
          ),
          new Icon(Icons.search),
          new Padding(//空格
           padding: const EdgeInsets.symmetric(horizontal: 5.0),
          ),
          new Icon(Icons.more_vert)
        ],
      ),
      body: new TabBarView(
        controller: _tabController,
        children: <Widget>[
          new CameraScreen(),
          new ChatScreen(),
          new StatusScreen(),
          //new CallsScreen(),
        ],
      ),
      /*floatingActionButton: new FloatingActionButton(
        backgroundColor: Theme.of(context).accentColor,
        child: new Icon(
          Icons.message,
          color: Colors.white,
        ),
        onPressed: () => print("open chats"),
      ),*/
    );
  }
}
