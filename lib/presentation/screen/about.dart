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
          body: Center(
            child: Container(
              child: Column(
                children: [
                  SizedBox(height: 150,),
                  Text("DEVELOPER",style: TextStyle(color: Colors.white,fontSize: 60),),
                  SizedBox(height: 30,),
                  Image(
                      image: AssetImage("assests/corona.png",),
                      width: 50,
                      height: 50,
                      alignment: Alignment.center,
                    ),
                    SizedBox(height: 20,),
                    Text("Email ",style: TextStyle(color: Colors.pink)),
                    SizedBox(height: 30,),
                    Text("kavinkumarnkm007@gmail.com",style: TextStyle(color: Colors.white),),

                ],
              ),
            ),
          )
        
    );
  }
}