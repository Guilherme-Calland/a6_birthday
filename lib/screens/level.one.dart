import 'package:a6_birthday/components/components.dart';
import 'package:a6_birthday/widgets/rute.dart';
import 'package:flutter/material.dart';

class LevelOne extends StatefulWidget {
  @override
  _LevelOneState createState() => _LevelOneState();
}



class _LevelOneState extends State<LevelOne> {

  @override
  Widget build(BuildContext context) {



    return Container(
      decoration: BoxDecoration(
        image: DecorationImage
        (
          image: ruaJacobina,
        )
      ),
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 300,
          ),
          Rute(
            xOffset: xPos,
            yOffset: yPos,
            state : state
          ),
        ]
      )
    );
  }

  @override
  void initState(){
    super.initState();
    state = ImageState.stillRight;
    Rute.folder = 'x2';
  }
}