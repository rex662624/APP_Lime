import 'package:flutter/material.dart';
import 'chat.dart';
class LoginPage extends StatefulWidget{
  @override
  State createState() => new LoginPageState();
}
class LoginPageState extends State<LoginPage> with SingleTickerProviderStateMixin{
  Animation<double> _iconAnimation;
  AnimationController _iconAnimationController;
  @override
  void initState() {
    super.initState();
    _iconAnimationController=new AnimationController(vsync: this,duration: new Duration(milliseconds: 800));
    _iconAnimation=CurvedAnimation(parent: _iconAnimationController, curve: Curves.bounceOut);
    _iconAnimation.addListener(() => this.setState(() {}));
    _iconAnimationController.forward();
  }
  @override
  Widget build(BuildContext context){
    return new Scaffold(
      backgroundColor: Colors.blueGrey,
      body: new Stack(
        fit: StackFit.expand,
        children: <Widget>[
          new Image(
              image: new AssetImage("images/Dog.jpg"),
              fit: BoxFit.cover,
              colorBlendMode: BlendMode.darken,
              color: Colors.black54
            ),
          new Theme(
            data: new ThemeData(
              brightness: Brightness.dark,
              inputDecorationTheme:new InputDecorationTheme(
                labelStyle: new TextStyle(
                  color: Colors.blueGrey,
                  fontSize: 20.0
                )
              )
            ),
            isMaterialAppTheme: true,
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                new Image(
                    image: new AssetImage("images/Logo.png"),
                    width: _iconAnimation.value*140.0,
                ),
                new Container(
                  padding: const EdgeInsets.all(40.0),
                  child: new Form(
                    autovalidate: true,
                    child: new Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        new TextFormField(
                          decoration: new InputDecoration(
                            labelText: "email"
                          ),
                          keyboardType: TextInputType.emailAddress,
                        ),
                        new TextFormField(
                          decoration: new InputDecoration(
                            labelText: "password"
                          ),
                          obscureText: true,
                          keyboardType: TextInputType.text,
                        ),
                        new Padding(
                          padding: const EdgeInsets.only(top: 60.0),
                        ),
                        new MaterialButton(
                          height: 40.0,
                          minWidth: 80.0,
                          color: Colors.green,
                          splashColor: Colors.orangeAccent,
                          textColor: Colors.black,
                          child: new Text("Log in"),
                          onPressed: (){
                            Navigator.of(context).push(
                              new MaterialPageRoute(
                                builder: (context) {
                                  return new Chat();
                                },
                              ),
                            );
                          },
                        )
                      ],
                    ),
                      ),
                )
              ],
            ),
          ),
        ],
      )
    );
  }
}