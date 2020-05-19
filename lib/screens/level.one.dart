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

    // print(loadingLvl1Animation.value);

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
          SizedBox( height: 198,)
          ,
          // !loadingLevelOneScreen ?
          Rute(
            xOffset: xPos,
            yOffset: yPos,
            state : state
          ) ,
          // :
          // Rute(
          //   xOffset: xPos,
          //   yOffset: yPos,
          //   state: state
          // ),
          SizedBox(height : 10),
          // !loadingLevelOneScreen ? 
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
          ),
          // :
          // SizedBox(),
          // !loadingLevelOneScreen? 
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
          // : SizedBox()
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

  // void startLoading() {
  //   loadingLvl1AnimationController = AnimationController(
  //     duration: Duration(milliseconds: 1), vsync: this, value: 0.00);
  //   loadingLvl1Animation =
  //   Tween<double>(begin: 1000, end: 0).animate(loadingLvl1AnimationController)
  //   ..addListener(() {
  //     if(loadingLvl1Animation.value > 600){
  //         state = ImageState.arrowOne;
  //       } else if(loadingLvl1Animation.value > 500){
  //         state = ImageState.legUp1Left;
  //       } else if(loadingLvl1Animation.value > 400){
  //         state = ImageState.legUp2Left;
  //       } else if (loadingLvl1Animation.value > 300){
  //         state = ImageState.stillLeft;
  //       } else if(loadingLvl1Animation.value > 200){
  //         state = ImageState.legUp1Right;
  //       } else if(loadingLvl1Animation.value > 100){
  //         state = ImageState.legUp2Right;
  //       } else {
  //         state = ImageState.stillRight;
  //       }
  //       if(loadingLvl1Animation.isCompleted){
  //         loadingLevelOneScreen = false;
  //       }
  //   setState(() {});});
  // }

  

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
    // startLoading();
    // loadingLvl1AnimationController.forward();
    startArrow();
    levelOneArrowAnimationController.forward();
    
  }

  @override
  void dispose(){
    super.dispose();

  }
}