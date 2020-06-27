import 'dart:async';
import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
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
  Timer _timer;
  int _animationRemaining = 5;

  @override
  Widget build(BuildContext context) {
    startTimer(); //pornesc timer
    return Scaffold(
      body: _mainBody(
      ),
    );
  }

  final player = AudioCache();

  void startTimer() {
    const oneSec = const Duration(seconds: 1);
    player.play("maintheme.mp3");
    _timer = new Timer.periodic(oneSec,
            (timer) {
          if(_animationRemaining<1){
            timer.cancel();
            player.clear("sound.mp3");
          }
          else{
            _animationRemaining = _animationRemaining - 1;
          }
        });
  }

  Widget _mainBody(){
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(_background), //imaginea schimbata de timer
          fit: BoxFit.fill,
        ),
      ),
      alignment: Alignment(0.5,0.5),
      child: FlatButton(
        color: Colors.blue,
        textColor: Colors.white,
        disabledColor: Colors.grey,
        disabledTextColor: Colors.black,
        padding: EdgeInsets.all(8.0),
        splashColor: Colors.blueAccent,
        onPressed: () {
          print("Button Apasat Second");
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => MainApp()),
          );
        },
        child: Text(
          "Flat Button",
          style: TextStyle(fontSize: 20.0),
        ),
      ),

    );
  }

}


