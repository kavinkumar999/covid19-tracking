import 'package:flutter/material.dart';

class Commoncard {
  Widget colorcard(
      BuildContext context, String name, Color colorname, int data) {
    final _size = MediaQuery.of(context).size;
    return SingleChildScrollView(
              child: Container(
                 margin: EdgeInsets.only(top: 18, right: 12),
                padding: EdgeInsets.all(10),
                height: _size.height /8,
                width: _size.width / 2 -25,
                // decoration: BoxDecoration(borderRadius: BorderRadius.circular(0.2)),
                
                color: colorname,
                  // padding: EdgeInsets.only(top: _size.height * 0.02),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      // mainAxisSize: MainAxisSize.max,
                      children: [
                        
                              Text(
                            "$name",
                            style: TextStyle(color: Colors.white, fontSize: 20,fontWeight: FontWeight.bold),
                          ),
                        SizedBox(
                          height: 10,
                        ),
                       Text(
                            "$data",
                            style: TextStyle(color: Colors.white, fontSize: 15),
                          ),
                        
                      ],
                    )),
    );
  }
}
