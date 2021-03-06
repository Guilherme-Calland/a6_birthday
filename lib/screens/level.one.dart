import 'package:a6_birthday/components/components.dart';
import 'package:a6_birthday/widgets/birthday.button.dart';
import 'package:a6_birthday/widgets/rute.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animator/flutter_animator.dart';

class LevelOne extends StatefulWidget {
  @override
  _LevelOneState createState() => _LevelOneState();
}



class _LevelOneState extends State<LevelOne> with TickerProviderStateMixin{

  @override
  Widget build(BuildContext context) {

    if(xPos > -28){
      running = true;
    } else {
      running = false;
    }

    xPos = moveAnimation.value;
    yPos = -s;
    
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage
        (
          image: ruaJacobina,
        )
      ),
      child: Column(
        children: <Widget>[
          SizedBox(height: 20,),
          showLevelOneArrow ? 
            removeLevelOneArrow ?
              SlideOutRight(child: levelOneArrow) : SlideInLeft(child: levelOneArrow) 
          :
          Transform.translate( 
            offset: Offset(-600,0),
            child: levelOneArrow 
          )
          ,
          Rute(
            xOffset: xPos,
            yOffset: yPos,
            state : state
          ), 
          SizedBox(height : 10),
          !running ? Row(
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
          :
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              BirthdayButton(
                title: 'Correr Esq',
                color: Colors.purple,
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
                title: 'Correr Dir',
                color: Colors.purple,
                onPressed: (){
                  goRight();
                },
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              BirthdayButton(
                color: Colors.blue,
                title: 'Pular',
                onPressed: (){
                  jump();
                },
              )
            ],
          )
        ]
      )
    );
  }

  void jump() {
    jumpAnimationController.forward();
    legsAnimationController.stop();
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
      if(moveAnimation.isCompleted){
        moveAnimationController.stop();
        legsAnimationController.stop();
        Navigator.popAndPushNamed(context, 'level.two');
      }
    setState(() {});});
  }

  void startLegs() {
    legsAnimationController = AnimationController(
      duration: Duration(milliseconds: 250), vsync: this);
    legsAnimation =
    Tween<double>(begin: 1, end: 200).animate(legsAnimationController)
    ..addListener(() {
      !running ?
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
        )
      :
        direction == Direction.left ?
        (
          legsAnimation.value >= 100 ?  
          state = ImageState.leftRunning1 :
          state = ImageState.leftRunning2 
        )
        :
        (
          legsAnimation.value >= 100 ?
          state = ImageState.rightRunning1 :
          state = ImageState.rightRunning2
        );
    setState(() {});});
  }

  void startJumping() {
    jumpAnimationController = AnimationController(
      duration: Duration(milliseconds: 500), vsync: this, value: 0.00
    );
    jumpAnimation =
    Tween<double>(begin: 0, end: 500).animate(jumpAnimationController)
      ..addListener(() {
        double s0 = 0;
        double v0 = 0.5;
        double vf = -0.5;
        double t0 = 0;
        double tf = 500;
        double a = (vf - v0) / (tf - t0);

        t = jumpAnimation.value;
        v = v0 + a * t;
        s = s0 + v0 * t + a * t * t / 2;

        print('value of s: ' + s.toString());
        print('value of t: ' + t.toString());
        print('value of v: ' + v.toString());
        print('');

        if(jumpAnimation.isCompleted){
          jumpAnimationController.reset();
          if(moveAnimationController.isAnimating){
            legsAnimationController.repeat();
          }
        }

        if(jumpAnimationController.isAnimating){
          legsAnimationController.stop();
        }
        setState(() {});
      }
    );
  }

  void startArrow() {
    levelOneArrowAnimationController = AnimationController(
      duration: Duration(seconds: 5), vsync: this);
    levelOneArrowAnimation =
    Tween<double>(begin: 0, end: 400).animate(levelOneArrowAnimationController)
    ..addListener(() {
      if(levelOneArrowAnimation.value >= 100){
        showLevelOneArrow = true;
      }
    
      if(levelOneArrowAnimation.isCompleted){
        removeLevelOneArrow = true;
      }
    setState(() {});});
  }

  @override
  void initState(){
    super.initState();
    startMoving();
    startLegs();
    startJumping();
    Rute.folder = 'x2';
    state = ImageState.stillRight;
    startArrow();
    levelOneArrowAnimationController.forward();
    
  }

  @override
  void dispose(){
    super.dispose();
    levelOneArrowAnimationController.dispose();

  }
}