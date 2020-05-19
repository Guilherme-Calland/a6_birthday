import 'package:a6_birthday/components/components.dart';
import 'package:a6_birthday/widgets/birthday.button.dart';
import 'package:a6_birthday/widgets/rute.dart';
import 'package:flutter/material.dart';

class LevelOne extends StatefulWidget {
  @override
  _LevelOneState createState() => _LevelOneState();
}



class _LevelOneState extends State<LevelOne> with TickerProviderStateMixin{

  @override
  Widget build(BuildContext context) {

    xPos = moveAnimation.value;
    yPos = 0;
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage
        (
          image: ruaJacobina,
        )
      ),
      child: Column(
        children: <Widget>[
          SizedBox(height: 210,),
          Rute(
            xOffset: xPos,
            yOffset: yPos,
            state : state
          ),
          SizedBox(height : 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              BirthdayButton(
                title: 'Esquer',
                color: Colors.green,
                onPressed: (){
                  goLeft();
                },
              ),
              BirthdayButton(
                title: 'Parar',
                color: Colors.red,
                onPressed: (){
                  stop();
                },
              ),
              BirthdayButton(
                title: 'Direita',
                color: Colors.green,
                onPressed: (){
                  goRight();
                },
              ),
            ],
          )
        ]
      )
    );
  }

  void goRight() {
    direction = Direction.right;
    legsAnimationController.repeat();
    moveAnimationController.forward();
  }

  void stop() {
    moveAnimationController.stop();
    legsAnimationController.stop();
    setState(() {
      direction  == Direction.left ? 
      state = ImageState.stillLeft :
      state = ImageState.stillRight;
    });
  }

  void goLeft() {
    direction = Direction.left;
    legsAnimationController.repeat();
    moveAnimationController.reverse();
  }


  void startMoving() {
    moveAnimationController = AnimationController(
      duration: Duration(seconds: 6), vsync: this, value: 0.05);
    moveAnimation =
    Tween<double>(begin: -392, end: 440).animate(moveAnimationController)
    ..addListener(() {
    setState(() {});});
  }

  void startLegs() {
    legsAnimationController = AnimationController(
      duration: Duration(milliseconds: 250), vsync: this);
    legsAnimation =
    Tween<double>(begin: 1, end: 200).animate(legsAnimationController)
    ..addListener(() {
      direction == Direction.left ?
      (
        legsAnimation.value >= 100 ?  
        state = ImageState.legUp1Left :
        state = ImageState.legUp2Left 
      )
      :
      (
        legsAnimation.value >= 100 ?
        state = ImageState.legUp1Right :
        state = ImageState.legUp2Right
      );
    setState(() {});});
  }

  @override
  void initState(){
    super.initState();
    startMoving();
    startLegs();
    state = ImageState.stillRight;
    Rute.folder = 'x2';
    yPos = 0;
  }

  @override
  void dispose(){
    super.dispose();
    moveAnimationController.dispose();
    legsAnimationController.dispose();    
  }
}