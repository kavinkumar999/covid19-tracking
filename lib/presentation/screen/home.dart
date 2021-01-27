import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin{
  AnimationController _controller;
  Animation image;
  @override
  void initState() {
    // TODO: implement initState
    _controller = AnimationController(vsync: this ,duration: Duration(seconds: 2));
    // ..addListener(() {
    //         setState(() {});
    //       })
    //  ..addStatusListener((status) {
    //         if (status == AnimationStatus.completed) {
    //           _controller.reverse();
    //         } else if (status == AnimationStatus.dismissed) {
    //           _controller.forward(from: 0.0);
    //         }
    // });
     
    image = Tween(begin: Offset(0,0),end: Offset(0 , 50.0))
    .animate(_controller);
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
            SizedBox(height: 50,),
            Text("COVID -19",textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 50)),
            Transform.translate(
            offset: image.value,
            child: Image(
              alignment: Alignment.centerRight,
              image: AssetImage("assests/11223.png"),
              // height: 50,

            ),
   ),
   SizedBox(height: 30,),
   MaterialButton(
        shape: RoundedRectangleBorder(
   borderRadius: BorderRadius.circular(20),
        ),
        minWidth: double.infinity,
            height: 40,
         color: Colors.white,
         child: Text("Guidelines" ,style: TextStyle(fontSize: 25),),
         hoverColor: Colors.grey,
         splashColor: Colors.grey,
         onPressed: (){

         },
     ),
     SizedBox(height: 20,),
     MaterialButton(
        shape: RoundedRectangleBorder(
   borderRadius: BorderRadius.circular(20),
        ),
        minWidth: double.infinity,
        height: 40,
         color: Colors.white,
         child: Text("Helpline" ,style: TextStyle(fontSize: 25),),
         hoverColor: Colors.grey,
         splashColor: Colors.grey,
         onPressed: (){

         },
     )
            
          ],
        ),
      ) 
      
      
    );
  }
}