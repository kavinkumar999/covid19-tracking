part of 'app_transition_bloc.dart';

@immutable
abstract class AppTransitionState {}

class AppTransitionInitial extends AppTransitionState {}

class Homepage extends AppTransitionState{
  var index;
  Homepage(
    this.index,
  );
}

class AboutPage extends AppTransitionState{
  var index;
  AboutPage(
    this.index,
  );
}

class IndiaPage extends AppTransitionState{
  var index;
  IndiaPage(
    this.index,
  );
}

class SplashScreen extends AppTransitionState{
  var index;
  SplashScreen(
    this.index,
  );
}

class CountryPage extends AppTransitionState{
  var index;
  CountryPage(
    this.index,
  );
}

class GuidelinePage extends AppTransitionState{
  var index;
  GuidelinePage(
    this.index,
  );
}
