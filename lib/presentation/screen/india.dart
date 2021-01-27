
import 'package:flutter/material.dart';
import 'package:covid19/presentation/widgets/card.dart';


class India extends StatefulWidget {
  
  @override
  _IndiaState createState() => _IndiaState();
}

class _IndiaState extends State<India> {
  @override
  Widget build(BuildContext context) {
    Commoncard _card = new Commoncard();
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: Colors.transparent,
      body: RefreshIndicator(
        backgroundColor: Colors.white,
        onRefresh: (){

        },
              child: Container(
    child: Column(
        children: [
          Row(
            children: [
              SafeArea(
                                child: Image(
                                  alignment: Alignment.topLeft,
                                  height: 300,width: 300,
                                  image: AssetImage("assests/india.png"),
                                ),
              ),
              Text("INDIA",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.white),)
            ],
          ),
          SizedBox(height: 30,),
          Row(
            
            children: [
              Padding(
                padding: EdgeInsets.only(left: width*0.07),
                child: _card.colorcard(context, "Total Cases", Colors.blue),
              ),
               Padding(
                padding: EdgeInsets.only(left: width*0.04),
                child: _card.colorcard(context, "Active Cases", Colors.blue),
              ),


            ],
            
          ),
          SizedBox(height: 20,),
          Row(
            
            children: [
              Padding(
                padding: EdgeInsets.only(left: width*0.07),
                child: _card.colorcard(context, "Recovered Cases", Colors.blue),
              ),
               Padding(
                padding: EdgeInsets.only(left: width*0.04),
                child: _card.colorcard(context, "Death Cases", Colors.blue),
              ),


            ],
        
          ),
          SizedBox(height: 20,),
          Image(
            width: 100,
            height: 100,
            image: AssetImage("assests/covid12.png"),
            fit: BoxFit.cover,
          )
        ],
    ),
          ),
      ),
      );
  }
}