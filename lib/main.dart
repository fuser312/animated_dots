import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main () => runApp(MaterialApp(debugShowCheckedModeBanner: false, home: AnimatedDots()));

class AnimatedDots extends StatefulWidget {
 
  AnimatedDots({Key key,}): super(key:key);
  @override
  _AnimatedDotsState createState() => _AnimatedDotsState();
}

class JumpingBalls extends Curve {

  double begin;
  double end;
  JumpingBalls(this.begin, this.end);

  @override

  double transformInternal(double t) {
    if(t >= begin && t<(begin+end)/2.0){
      return (2*(t - begin) / (begin-end)) ;

    }
    else if(t >= (begin+end)/2.0+0.2 && t<end){
      return (2*(end - t) / (end - begin)) ;

    }
    else return 0;
  }
}


class _AnimatedDotsState extends State<AnimatedDots> with SingleTickerProviderStateMixin{
  AnimationController animationController;
  Animation animation;

  @override
  void initState() {
    animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );

    animation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(animationController);


    animationController.repeat(
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            height: 200,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(80.0),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                 SlideTransition(
                       position:Tween<Offset>(begin: Offset(0.0, 0.0), end: Offset(0.0, -0.4)).animate(CurvedAnimation(
                      parent: animationController,
                      curve:JumpingBalls(0.0,0.4),
                )),
                       child: Container(
                        height : 40,
                        width: 20,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.grey,
                        ),
                    ),
                     ),


                SlideTransition(
                  position:Tween<Offset>(begin:Offset(0.0, 0.0), end: Offset(0.0, -0.4)) .animate(CurvedAnimation(
                  parent: animationController,
                  curve:JumpingBalls(0.2,0.6),
                )),
                   child: Container(
                    height : 40,
                    width: 20,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.grey,
                    ),
                  ),
                ),

                SlideTransition(
                  position:Tween<Offset>(begin: Offset(0.0, 0.0), end: Offset(0.0, -0.4)).animate(CurvedAnimation(
                  parent: animationController,
                  curve:JumpingBalls(0.4,0.8),
                  )),
                  child: Container(
                    height : 40,
                    width: 20,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.grey,
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
