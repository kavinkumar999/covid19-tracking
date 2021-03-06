import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  AnimationController _controller;
  Animation image;
  @override
  void initState() {
    // TODO: implement initState
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 1))
    ..addListener(() {
            setState(() {});
          })
     ..addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              _controller.reverse();
            } else if (status == AnimationStatus.dismissed) {
              _controller.forward(from: 0.0);
            }
    });

    image =
        Tween(begin: Offset(0, 0), end: Offset(0, 70.0)).animate(_controller);
    _controller.forward();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 50,
              ),
              Text("COVID -19",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 50)),
              Transform.translate(
                offset: image.value,
                child: Image(
                  alignment: Alignment.centerRight,
                  image: AssetImage("assests/covidcan.png"),
                  // height: 50,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              // MaterialButton(
              //   shape: RoundedRectangleBorder(
              //     borderRadius: BorderRadius.circular(20),
              //   ),
              //   minWidth: width * 0.8,
              //   height: 40,
              //   color: Colors.grey[800],
              //   child: Text(
              //     "Guidelines",
              //     style: TextStyle(fontSize: 20,color: Colors.white),
              //   ),
              //   hoverColor: Colors.grey,
              //   splashColor: Colors.grey,
              //   onPressed: () {},
              // ),
              SizedBox(
                height: 80,
              ),
              MaterialButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                minWidth: width * 0.8,
                height: 40,
                color: Colors.grey[800],
                child: Text(
                  "Helpline",
                  style: TextStyle(fontSize: 20,color: Colors.white),
                ),
                hoverColor: Colors.grey,
                splashColor: Colors.grey,
                onPressed: () {},
              )
            ],
          ),
        ));
  }
}
