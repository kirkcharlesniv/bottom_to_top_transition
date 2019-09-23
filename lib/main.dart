import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => HomeState();
}

class HomeState extends State<Home> with TickerProviderStateMixin {
  AnimationController controller;
  Animation<Offset> offset;
  Animation<double> scaleAnimation;

  @override
  void initState() {
    super.initState();

    controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 400));

    offset = Tween<Offset>(begin: Offset(0, 2), end: Offset.zero)
        .animate(controller);
    scaleAnimation = CurvedAnimation(
      parent: controller,
      curve: Curves.easeInOut,
    );
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Align(
            alignment: Alignment.topCenter,
            child: SlideTransition(
              position: offset,
              child: ScaleTransition(
                scale: scaleAnimation,
                child: Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.9,
                  color: Colors.red,
                  child: Center(
                    child: GestureDetector(
                        onTap: () => controller.reverse(),
                        child: Text(
                          'Reverse',
                          style: TextStyle(color: Colors.white),
                        )),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
