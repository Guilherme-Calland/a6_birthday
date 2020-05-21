import 'package:a6_birthday/components/components.dart';
import 'package:a6_birthday/widgets/rute.dart';
import 'package:flutter/material.dart';

class LevelFour extends StatefulWidget {
  @override
  _LevelFourState createState() => _LevelFourState();
}



class _LevelFourState extends State<LevelFour> with TickerProviderStateMixin{

  AnimationController birthdayController;
  Animation birthday;
  bool startBirthdaySequence = false;
  
  @override
  Widget build(BuildContext context) {

    if(startBirthdaySequence){
      xPos = birthday.value;
    } else {
      xPos = 0;
    }

    print(birthday.value);

    return Container(
      decoration: BoxDecoration(
        image: DecorationImage
        (
          image: levelFour,
        )
      ),
      child: Column(
        children: <Widget>[
          SizedBox(height: 260,),
          Row(
            children: <Widget>[
              Container(
                height: 72,
                width: 70,
                child: Rute(
                  xOffset: xPos,
                  yOffset: 4,
                  state: state
                ),
              ),
              SizedBox(width: 348,),
              family,
            ],
          ),
        ],
      ),
    );
  }

  void startBirthday() {
    birthdayController = AnimationController(
      duration: Duration(seconds: 5), vsync: this
    );
    birthday = Tween<double>(begin: -100, end: 300).animate(birthdayController)
    ..addListener(() { 
      if(birthday.value >= 0){
        startBirthdaySequence = true;
      }
      setState(() {
        
      });
    });
  }

  @override
  void initState(){
    super.initState();
    Rute.folder = 'x2'; 
    state = ImageState.rightSmiling;
    startBirthday();    
    birthdayController.forward();
  }

  @override
  void dispose(){
    super.dispose();
    birthdayController.dispose();
  }
}