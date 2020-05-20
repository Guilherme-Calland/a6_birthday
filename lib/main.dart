import 'package:a6_birthday/screens/level.one.dart';
import 'package:a6_birthday/screens/level.three.dart';
import 'package:a6_birthday/screens/level.two.dart';
import 'package:a6_birthday/screens/menu.screen.dart';
import 'package:a6_birthday/screens/start.screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() async => {
  WidgetsFlutterBinding.ensureInitialized(),

  await SystemChrome.setPreferredOrientations(
      [DeviceOrientation.landscapeLeft, 
       DeviceOrientation.landscapeRight
      ]),
  runApp(BirthDay())
};

class BirthDay extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,
        secondaryHeaderColor: Colors.red
      ),
      initialRoute: 'menu.screen',
      routes: {
        'menu.screen' : (context) => MenuScreen(),
        'start.screen' : (context) => StartScreen(),
        'level.one' : (context) => LevelOne(),
        'level.two' : (context) => LevelTwo(),
        'levelThree' : (context) => LevelThree()
      }
    );
  }
}
