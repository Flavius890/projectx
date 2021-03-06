import 'dart:async';
import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'mainmenu.dart';

void main() {
  runApp(MainApp());
}

AudioCache cache = new AudioCache();

AudioPlayer audioPlayer;
bool _buttonstate = true;

class MainApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    cache.loop("audio/maintheme.mp3");
    return MaterialApp(
      title: 'projectx',
      home: MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  String _background = "intro.gif"; //imaginea in _mainBody -> decoration
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
    cache.play("audio/logosound.mp3");

    /*size 150
    backgroundColor: Colors.transparent,
    flexibleSpace: Image(
    image: AssetImage("titleanimation.gif"),
    fit: BoxFit.cover,
     */
    return Scaffold(
      body: _mainBody(),
    );
  }


  Widget _mainBody() {
    return Container(
      alignment: Alignment.center,
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              height: (MediaQuery.of(context).size.height / 3) * 1,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                      "titleanimation.gif"), //imaginea schimbata de timer
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Container(
              height: (MediaQuery.of(context).size.height / 3) * 2,
              width: (MediaQuery.of(context).size.width),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(_background), //imaginea schimbata de timer
                  fit: BoxFit.fill,
                ),
              ),
              child: Align(
              child: Container(
                width: 200,
                height: 50,
                child: GestureDetector(
                  child: Container(
                      decoration: BoxDecoration(
                    color: Colors.transparent,
                    image: DecorationImage(
                      image: AssetImage("enterbutton.gif"),
                    ),
                  )),
                  onTap: () {
                    //audioPlayer.stop();
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MainMenuWidget()),
                    );
                  },
                ),
              ),
              ),
            ),
          ]),
    );
  }
}
