import 'package:covid19/bloc/transition/app_transition_bloc.dart';
import 'package:covid19/presentation/screen/initial.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


void main() {
  runApp(BlocProvider(
    create: (context) => AppTransitionBloc(),
    child: MaterialApp(
      theme: ThemeData(primaryColor: Color(0xff272936)),
      debugShowCheckedModeBanner: false,
      home: Startapp(),
    ),
  ));
}
