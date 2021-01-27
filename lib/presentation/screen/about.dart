import 'package:flutter/material.dart';

class About extends StatefulWidget {
  @override
  _AboutState createState() => _AboutState();
}

class _AboutState extends State<About> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
                  child: Center(
            child: Container(
              child: Column(
                children: [
                  SizedBox(
                    height: 150,
                  ),
                  Text(
                    "DEVEL'0'PER",
                    style: TextStyle(color: Colors.white, fontSize: 60),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                      height: 150,
                      width: 150,
                      decoration: new BoxDecoration(
                          shape: BoxShape.circle,
                          image: new DecorationImage(
                              fit: BoxFit.fill,
                              image: AssetImage(
                                "assests/dev.jpg",
                              )))),
                  SizedBox(
                    height: 20,
                  ),
                  Text("Email ", style: TextStyle(color: Colors.pink)),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    "kavinkumarnkm007@gmail.com",
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
