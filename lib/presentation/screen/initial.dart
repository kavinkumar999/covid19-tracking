import 'package:covid19/bloc/country_record/country_bloc.dart';
import 'package:covid19/bloc/transition/app_transition_bloc.dart';
import 'package:covid19/presentation/screen/about.dart';
import 'package:covid19/presentation/screen/countries.dart';
import 'package:covid19/presentation/screen/home.dart';
import 'package:covid19/presentation/screen/india.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';

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
      backgroundColor: Color(0xff272936),
      body: BlocConsumer<AppTransitionBloc, AppTransitionState>(
        listener: (context, state) {
          if (state is Homepage) {
            _select = state.index;
          }
          if (state is IndiaPage) {
            _select = state.index;
          }
          if (state is CountryPage) {
            _select = state.index;
          }
          if (state is AboutPage) {
            _select = state.index;
          }
        },
        builder: (context, state) {
          if (state is Homepage) {
            return Home();
          }
          if (state is IndiaPage) {
            return India();
          }
          if (state is CountryPage) {
            return BlocProvider(
              create: (context) => CountryBloc(),
              child: Country(),
            );
          }
          if (state is AboutPage) {
            return About();
          }
          return Home();
        },
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
            color: Color(0xff272936),
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20)),
            boxShadow: [
              BoxShadow(blurRadius: 20, color: Colors.white.withOpacity(.1))
            ]),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
            child: BlocBuilder<AppTransitionBloc, AppTransitionState>(
              builder: (context, state) {
                return GNav(
                  gap: 3,
                  activeColor: Colors.pink,
                  color: Colors.white,
                  iconSize: 23,
                  padding: EdgeInsets.symmetric(horizontal: 21, vertical: 6),
                  duration: Duration(milliseconds: 800),
                  tabBackgroundColor: Colors.grey[800],
                  selectedIndex: _select,
                  tabs: [
                    GButton(
                      icon: LineAwesomeIcons.home,
                      text: 'Home',
                    ),
                    GButton(
                      icon: LineAwesomeIcons.rocket,
                      text: 'India',
                    ),
                    GButton(
                      icon: LineAwesomeIcons.map,
                      text: 'Countries',
                    ),
                    GButton(
                      icon: LineAwesomeIcons.user,
                      text: 'About',
                    ),
                  ],
                  onTabChange: (index) {
                    BlocProvider.of<AppTransitionBloc>(context)
                        .add(TransitionIndex(index));
                  },
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
