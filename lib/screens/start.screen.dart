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
  
  @override
  Widget build(BuildContext context) {

    setPosition();
    setDoorConditions();

    print(loadingAnimation.value);

    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: livingRoom,
        )
      ),
      child: Column(
        
        children: <Widget>[
          !loadingStartScreen ?
          SizedBox(
            height: 150,
          ) : 
          SizedBox(),
          loadingStartScreen ? 
          Rute(
            xOffset: -500,
            yOffset: -500,
            state : state
          ) :
          Rute(
            xOffset: xPos,
            yOffset: yPos,
            state : state
          ),
          SizedBox(
            height: 20,
          ),
          !openingDoorSequence && !loadingStartScreen ? Row(
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
          ) : SizedBox(),
          !openingDoorSequence && !loadingStartScreen? Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              BirthdayButton(
                title: 'Pular',
                color: Colors.purple,
                onPressed: () {
                  jump();
                },
              ), 
              showOpenDoorButton ? 
              BirthdayButton(
                title: 'Abrir porta',
                color: Colors.orange,
                onPressed: (){
                  setState(() {
                    openingDoorSequence = true;
                    openDoorAnimationController.forward();
                    direction = Direction.left;           
                    legsAnimationController.repeat();
                  });
                }
              ) : SizedBox()
            ],
          ) : SizedBox(),
        ],
      ),
    );
  }

  void setDoorConditions() {
    if(xPos > 41 && xPos < 136){
      showOpenDoorButton = true;
    } else {
      showOpenDoorButton = false;
    }
  }

  void setPosition() {
    if(!openingDoorSequence){
      xPos = moveAnimation.value;
      yPos = -s;
    } else {
      xPos = 98;
      yPos = openDoorAnimation.value;
    }
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
    openDoorSequence();
    changeScreenDelay();
    startLoading();
    loadingAnimationController.forward();
    
  }

    void startLoading() {
      loadingAnimationController = AnimationController(
        duration: Duration(milliseconds: 500), vsync: this);
      loadingAnimation =
      Tween<double>(begin: 700, end: 0).animate(loadingAnimationController)
      ..addListener(() {
        if(loadingAnimation.value > 600){
          state = ImageState.openDoor;
        } else if(loadingAnimation.value > 500){
          state = ImageState.legUp1Left;
        } else if(loadingAnimation.value > 400){
          state = ImageState.legUp2Left;
        } else if (loadingAnimation.value > 300){
          state = ImageState.stillLeft;
        } else if(loadingAnimation.value > 200){
          state = ImageState.legUp1Right;
        } else if(loadingAnimation.value > 100){
          state = ImageState.legUp2Right;
        } else {
          state = ImageState.stillRight;
        }
        if(loadingAnimation.isCompleted){
          loadingStartScreen = false;
        }
      setState(() {});});
    }

  void changeScreenDelay() {
    changeScreenDelayAnimationController = AnimationController(
      duration: Duration(seconds: 1), vsync: this);
    changeScreenDelayAnimation =
    Tween<double>(begin: 0, end: 100).animate(changeScreenDelayAnimationController)
    ..addListener(() {
      if(changeScreenDelayAnimation.isCompleted){
        Navigator.popAndPushNamed(context, 'level.one');
      }
    setState(() {});});
  }

  void openDoorSequence() {
    openDoorAnimationController = AnimationController(
      duration: Duration(seconds: 2), vsync: this, value: 0.0);
    openDoorAnimation =
    Tween<double>(begin: -40, end: -120).animate(openDoorAnimationController)
    ..addListener(() {
      if(openDoorAnimation.isCompleted){
        stop();
        state = ImageState.openDoor;
        changeScreenDelayAnimationController.forward();
      }
    setState(() {});});
  }

  @override
  void dispose() {
    openDoorAnimationController.dispose();
    changeScreenDelayAnimationController.dispose();
    super.dispose();
  }
}

