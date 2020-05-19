import 'package:a6_birthday/components/components.dart';
import 'package:a6_birthday/widgets/birthday.button.dart';
import 'package:flutter/material.dart';

class MenuScreen extends StatefulWidget {
  @override
  _MenuScreenState createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage
        (
          image: gameMenu,
        )
      ),
      child: Column(
        children: <Widget>[
          BirthdayButton(
            title: 'Começar',
            color: Colors.red,
            onPressed: () => Navigator.popAndPushNamed(context, 'start.screen'),

          )
        ],
      ),
    );
  }
}