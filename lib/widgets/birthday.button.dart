import 'package:flutter/material.dart';

class BirthdayButton extends StatelessWidget {
  String title;
  Color color;
  Function onPressed;
  BirthdayButton({this.title, this.color, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 5),
      child: RaisedButton(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        color: color,
        child: Text(
          title,
          style: TextStyle(
            color: Colors.white
          )
        ),
        onPressed: onPressed,
      )
    );
  }
}

