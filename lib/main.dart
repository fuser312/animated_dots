import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main () => runApp(MaterialApp(debugShowCheckedModeBanner: false, home: AnimatedDots()));

class AnimatedDots extends StatefulWidget {
  final offsetBool;
  final double widthSlide;
  AnimatedDots({
    Key key,
    this.offsetBool,
    this.widthSlide
}): super(key:key);
  @override
  _AnimatedDotsState createState() => _AnimatedDotsState();
}

class _AnimatedDotsState extends State<AnimatedDots> with SingleTickerProviderStateMixin{
  AnimationController _controller;
  Animation<Offset> _offsetFloat;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: const Duration(seconds: 1));
    _offsetFloat = Tween<Offset>(begin: Offset(widget.widthSlide, 0.0), end: Offset.zero).animate(_controller);
    _offsetFloat.addListener((){
      setState(() {

      });
    });
    _controller.forward();
  }

  @override
  void dispose(){
    _controller.dispose();
    super.dispose();
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
              color: Colors.grey,
              borderRadius: BorderRadius.circular(80.0),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                 SlideTransition(
                       position: _offsetFloat,
                       child: Container(
                        height : 20,
                        width: 20,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.blue,
                        ),
                    ),
                     ),


                Container(
                  height : 20,
                  width: 20,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.blue,
                  ),
                ),
                Container(
                  height : 20,
                  width: 20,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.blue,
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
