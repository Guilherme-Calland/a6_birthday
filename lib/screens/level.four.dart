import 'package:a6_birthday/components/components.dart';
import 'package:a6_birthday/widgets/rute.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animator/flutter_animator.dart';

class LevelFour extends StatefulWidget {
  @override
  _LevelFourState createState() => _LevelFourState();
}

class _LevelFourState extends State<LevelFour> with TickerProviderStateMixin{

  AnimationController birthdayController;
  Animation birthday;
  bool startBirthdaySequence = false;
  bool showHappyBirthday = false;
  
  @override
  Widget build(BuildContext context) {

    if(startBirthdaySequence){
      xPos = birthday.value;
    } else {
      xPos = 0;
    }

    return Container(
      decoration: BoxDecoration(
        image: DecorationImage
        (
          image: levelFour,
        )
      ),
      child: Column(
        children: <Widget>[
          SizedBox(height: 95,),
          showHappyBirthday ? 
          SlideInUp(
            child: happyBirthday 
          )
          :
          Transform.translate(
            offset: Offset(-1000,0),
            child: happyBirthday
          ),
          SizedBox(height: 10,),
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
    birthday = Tween<double>(begin: -100, end: 298).animate(birthdayController)
    ..addListener(() { 
      if(birthday.value >= 0){
        startBirthdaySequence = true;
        legsAnimationController.repeat();
      }
      if(birthday.isCompleted){
        legsAnimationController.stop();
        state = ImageState.rightSmiling;
        showHappyBirthday = true;
      }
      setState(() {
        
      });
    });
  }

 
  void startLegs() {
    legsAnimationController = AnimationController(
      duration: Duration(milliseconds: 250), vsync: this);
    legsAnimation = 
    Tween<double>(
      begin: 1, end: 200
    ).animate(legsAnimationController)
    ..addListener(() {
      legsAnimation.value >= 100 ?
      state = ImageState.rightSmiling1 :
      state = ImageState.rightSmiling2;
      setState(() {});
    });
  }

  @override
  void initState(){
    super.initState();
    Rute.folder = 'x2'; 
    state = ImageState.rightSmiling;
    startBirthday();    
    birthdayController.forward();
    startLegs();
  }


  @override
  void dispose(){
    super.dispose();
    birthdayController.dispose();
  }
}