import 'package:a6_birthday/screens/level.one.dart';
import 'package:a6_birthday/screens/menu.screen.dart';
import 'package:a6_birthday/screens/start.screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(BirthDay());
}

class BirthDay extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,
        secondaryHeaderColor: Colors.red
      ),
      initialRoute: 'start.screen',
      routes: {
        'menu.screen' : (context) => MenuScreen(),
        'start.screen' : (context) => StartScreen(),
        'level.one' : (context) => LevelOne(),
      }
    );
  }
}
