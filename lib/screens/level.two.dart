import 'package:a6_birthday/components/components.dart';
import 'package:a6_birthday/widgets/rute.dart';
import 'package:flutter/material.dart';

class LevelTwo extends StatefulWidget {
  @override
  _LevelTwoState createState() => _LevelTwoState();
}

class _LevelTwoState extends State<LevelTwo> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage
        (
          image: levelTwo,
        )
      ),
      child: Column(
        children: <Widget>[
          SizedBox(height: 270,),
          Rute(
            xOffset: xPos,
            yOffset: yPos,
            state :ImageState.stillRight,
          )
        ],
      ),
    );
  }

  @override
  initState(){
    super.initState();
    Rute.folder = 'x2';
    xPos = -350;
    yPos = 0;
    
  }
}