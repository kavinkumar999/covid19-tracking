import 'package:covid19/presentation/screen/home.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(primaryColor: Color(0xff272936)),
    debugShowCheckedModeBanner: false,
    home: Startapp(),
  )
    );
}

class Startapp extends StatefulWidget {
  @override
  _StartappState createState() => _StartappState();
}

class _StartappState extends State<Startapp> {

  static List<Widget> _widgetOptions = <Widget>[
    Home(),
    Container(),
    Container(),
    Container()
  ];
  int _select = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: _widgetOptions.elementAt(_select),
      ),
      bottomNavigationBar: Container(
         decoration: BoxDecoration(color: Color(0xff272936),borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20)), 
        ),
        child: SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 8),
            child: GNav(
          tabBorder: Border.all(color: Color(0xff272936), width: 1), // tab button border
          tabShadow: [BoxShadow(color: Color(0xff272936), blurRadius: 8)], // tab button shadow
          curve: Curves.easeInOut, // tab animation curves
          duration: Duration(milliseconds: 800), // tab animation duration
          gap: 2, // the tab button gap between icon and text 
          color: Colors.white, // unselected icon color
          activeColor: Colors.white, // selected icon and text color
          iconSize: 24, // tab button icon size // selected tab background color
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5), // navigation bar padding
          tabs: [
            GButton(
              icon: Icons.home,
              text: 'Home',
            ),
            GButton(
              icon: Icons.headset_mic_sharp,
              text: 'Likes',
            ),
            GButton(
              icon: Icons.search,
              text: 'Search',
            ),
            GButton(
              icon: Icons.supervised_user_circle,
              text: 'Profile',
            )
          ],
          selectedIndex: _select,
          onTabChange: (index){
            setState(() {
              print("object");
              print(index);
              
              _select = index;print(_select);
            });
          },
    ),
          ),
        ),
      ),
      
    );
  }
}