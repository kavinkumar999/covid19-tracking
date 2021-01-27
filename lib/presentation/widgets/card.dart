import 'package:flutter/material.dart';

class Commoncard {
  Widget colorcard (BuildContext context, String name, Color colorname ){
    final _size =  MediaQuery.of(context).size;
    return Container(
      width: _size.width * 0.42,
      height: _size.height * 0.12,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: colorname),
      
      // color: colorname,
      child: Padding(
        padding: EdgeInsets.only(top :_size.height *0.02),
        
      

        child: Column(
          children: [
            Text("$name",style: TextStyle(color: Colors.white,fontSize: 20),),
            SizedBox(height: 20,),
            Text("15000",style: TextStyle(color: Colors.white,fontSize: 15),),
          ],
        )

      )
    
    );
  
  }
  }
