import 'package:a6_birthday/components/components.dart';
import 'package:a6_birthday/widgets/birthday.button.dart';
import 'package:a6_birthday/widgets/rute.dart';
import 'package:flutter/material.dart';

class StartScreen extends StatefulWidget {
  @override
  _StartScreenState createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen>
    with TickerProviderStateMixin {
  AnimationController moveAnimationController, jumpAnimationController, legsAnimationController;
  Animation moveAnimation, jumpAnimation, legsAnimation;
  double xPos = 0, yPos = 0, t = 0, s = 0, v = 0;
  Direction direction = Direction.right;
  ImageState state = ImageState.stillRight;

  @override
  Widget build(BuildContext context) {
    xPos = moveAnimation.value;
    yPos = -s;

    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
        image: AssetImage('images/livingRoom.png'),
      )),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            height: 130,
          ),
          Rute(
            xOffset: xPos,
            yOffset: yPos,
            state : state
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              BirthdayButton(
                  title: 'Esquer',
                  color: Colors.green,
                  onPressed: () {
                    direction = Direction.left;
                    state = ImageState.stillLeft;
                    goLeft();
                  }),
              BirthdayButton(
                  title: 'Parar',
                  color: Colors.blue,
                  onPressed: () {
                    stop();
                  }),
              BirthdayButton(
                  title: 'Direita',
                  color: Colors.green,
                  onPressed: () {
                    direction = Direction.right;
                    state = ImageState.stillRight;
                    goRight();
                  }),
            ],
          ),
          BirthdayButton(
            title: 'Pular',
            color: Colors.purple,
            onPressed: () {
              jump();
            },
          )
        ],
      ),
    );
  }

  void moveLegs() {
    legsAnimationController.repeat();
  }

  void jump() {
    jumpAnimationController.forward();
  }

  void startMoving() {
    moveAnimationController = AnimationController(
      duration: Duration(seconds: 6), vsync: this, value: 0.05);
    moveAnimation =
    Tween<double>(begin: -309, end: 312).animate(moveAnimationController)
    ..addListener(() {
    setState(() {});});
  }

  void goRight() {
    moveAnimationController.forward();
    moveLegs();
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
    moveAnimationController.reverse();
    moveLegs();
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
          legsAnimationController.repeat();
        }

        if(jumpAnimationController.isAnimating){
          legsAnimationController.stop();
        }

        setState(() {});
      }
    );
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
  void initState() {
    super.initState();
    startMoving();
    startJumping();
    startLegs();
  }

  @override
  void dispose() {
    moveAnimationController.dispose();
    jumpAnimationController.dispose();
    legsAnimationController.dispose();
    super.dispose();
  }
}

