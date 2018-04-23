import 'package:flutter/material.dart';
import './FirstPage.dart' as first;
import './SecondPage.dart' as second;
import './ThirdPage.dart' as third;

class MyTabs extends StatefulWidget {
  @override
  MyTabsState createState() => new MyTabsState();
}

class MyTabsState extends State<MyTabs> with SingleTickerProviderStateMixin {//滑過去的動畫要用的

//---controller
  TabController controller;

  @override
  void initState() {
    super.initState();
    controller = new TabController(vsync: this, length: 3);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
//------------------
  @override
  Widget build(BuildContext context) {
    return new Scaffold(

      //-------APP bar
        appBar: new AppBar(
            title: new Text("Pages"),
            backgroundColor: Colors.purple,
            bottom: new TabBar(
                controller: controller,
                tabs: <Tab>[
                  new Tab(icon: new Icon(Icons.arrow_forward)),
                  new Tab(icon: new Icon(Icons.arrow_downward)),
                  new Tab(icon: new Icon(Icons.arrow_back)),
                ]
            )
        ),

        //---------------------------tab 要轉到哪個頁面
        body: new TabBarView(
            controller: controller,
            children: <Widget>[
              new first.First(),
              new second.Second(),
              new third.Third()
            ]
        ),
    );
  }
}